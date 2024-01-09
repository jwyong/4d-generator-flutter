import 'dart:async';

import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/repository/dmc_repo.dart';
import 'package:mobx/mobx.dart';

part 'past_results_page_vm.g.dart';

class PastResultsPageVM = APastResultsPageVM with _$PastResultsPageVM;

// Items to fetch everytime user reached each end (initial prefetch count will be double if start from middle of pastResults list)
const pastResultsFetchCount = 30;

abstract class APastResultsPageVM extends BaseViewModel with Store {
  late final _dmcRepository = DmcRepository(database);

  @observable
  Stream<List<DmcEntityData>>? pastResultsStream;

  late final String? initialDrawNo;

  // Init past results stream with a drawNo or latest if null
  void initPastResultsStream({String? drawNo}) async {
    initialDrawNo = drawNo;
    if (drawNo != null) {
      // Got drawNo - use to get pastResults around it
      pastResultsStream = await _dmcRepository.getPastResultsAroundDrawNo(drawNo, pastResultsFetchCount);
    } else {
      // No drawNo - latest past results
      pastResultsStream = _dmcRepository.getLatestPastResults(pastResultsFetchCount);
    }
  }

  // Set initialPage with index of element where drawNo is at.
  int setInitialPage(List<DmcEntityData> list) => list.indexWhere((element) => element.drawNo == initialDrawNo);

  // Load previous / next pages
  Stream<List<DmcEntityData>>? onPreviousPaging(DmcEntityData? firstItem) {
    final firstItemDrawDate = firstItem?.drawDate;
    return firstItemDrawDate != null ?
    _dmcRepository.getPreviousPastResultsFromDateTime(firstItemDrawDate, pastResultsFetchCount, false) : null;
  }

  Stream<List<DmcEntityData>>? onNextPaging(DmcEntityData? lastItem) {
    final lastItemDrawDate = lastItem?.drawDate;
    return lastItemDrawDate != null ?
    _dmcRepository.getNextPastResultsFromDateTime(lastItemDrawDate, pastResultsFetchCount, false) : null;
  }
}
