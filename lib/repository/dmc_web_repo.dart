import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lucky_generator/constant/http_constants.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/util/date_time_util.dart';
import 'package:lucky_generator/util/dmc_parser_util.dart';
import 'package:lucky_generator/util/http_util.dart';

/// Repository with dmc official website get calls http functions.
class DmcWebRepository {
  late final DmcParserUtil _dmcParserUtil = DmcParserUtil();

  // Get list of latest results from dmc official web
  Future<List<DmcEntityData>?> getLatestDmcWebResultsList(DateTime dateTimeLatestDraw) async {
    final pastResultsDateTimeList = await _getPastResultsDateList();

    // debugPrint("DmcWebRepository, getLatestDmcWebResultsList, pastResultsDateTimeList = $pastResultsDateTimeList");
    
    // Return if error or empty list (no need to sync)
    if (pastResultsDateTimeList == null) return null;
    if( pastResultsDateTimeList.isEmpty) return List.empty();

    // Get list of dates in string to query
    final datesToQuery = _getDatesStringListToQuery(pastResultsDateTimeList, dateTimeLatestDraw);
    // debugPrint("DmcWebRepository, getLatestDmcWebResultsList, datesToQuery = $datesToQuery");

    // Return empty if no need to sync (subList returned empty)
    // TODO: JAY_LOG - check if subList = emptyList will crash?
    if (datesToQuery.isEmpty) return List.empty();

    // Get list of requestUrls based on list of dates to query
    final List<String> requestLinkList = List.empty(growable: true);
    for (String dateToQuery in datesToQuery) {
      final requestLink = await _getPastResultRequestLink(dateToQuery);
      if (requestLink == null || requestLink.isEmpty) continue;

      requestLinkList.add(requestLink);
    }
    // debugPrint("DmcWebRepository, getLatestDmcWebResultsList, requestLinkList = $requestLinkList");

    // Return error if no list
    if (requestLinkList.isEmpty) return null;

    // Get past results based on request link list
    final List<DmcEntityData> pastResultsList = List.empty(growable: true);
    for (String requestLink in requestLinkList) {
      final dmcEntityData = await _getPastResult(requestLink);
      if (dmcEntityData == null) continue;

      pastResultsList.add(dmcEntityData);
    }
    // debugPrint("DmcWebRepository, getLatestDmcWebResultsList, pastResultsList size = ${pastResultsList.length}");

    return pastResultsList;
  }

  // Get past results date list from dmc web
  Future<List<String>?> _getPastResultsDateList() async {
    final response = await http.get(Uri.https(dmcHost, dmcListPastResultUrl));
    if (response.isSuccess()) {
      return jsonDecode(response.body)['drawdate'].toString().split(' ');
    } else {
      return null;
    }
  }

  // Get the list of dates in string to be used to make web query
  List<String> _getDatesStringListToQuery(List<String> fullDatesList, DateTime dateTimeLatestDraw) {
    // Get index of latest draw date from full list
    final String formattedLatestDrawDate = dateTimeLatestDraw.toFormattedString(yyyyMMddFormat);

    // Get subList of dates to query based on latestDraw date + last item index
    final latestDrawDateIndex = fullDatesList.indexOf(formattedLatestDrawDate);
    final lastIndex = fullDatesList.length - 1;

    return fullDatesList.sublist(latestDrawDateIndex, lastIndex);
  }

  // Get link used to request past result of a given date string
  Future<String?> _getPastResultRequestLink(String date) async {
    final httpsUri = Uri.https(dmcHost, dmcPastResultRequestLinkUrl, {'pastdate': date});
    final response = await http.get(httpsUri, headers: {
      'cookiesession': '123'
    });
    if (response.isSuccess()) {
      return jsonDecode(response.body)['link'].toString();
    } else {
      return null;
    }
  }

  // Get past result from request link
  Future<DmcEntityData?> _getPastResult(String requestLink) async {
    final response = await http.get(Uri.parse(requestLink));
    if (response.isSuccess()) {
      final respJson = jsonDecode(response.body);
      return _dmcParserUtil.getDmcEntityDatafromDmcJson(respJson);
    } else {
      return null;
    }
  }
}
