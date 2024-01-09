import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:mobx/mobx.dart';

part 'generic_paging_page_view_model.g.dart';

class GenericPagingPageViewVM<T> = AGenericPagingPageViewVM<T> with _$GenericPagingPageViewVM;

abstract class AGenericPagingPageViewVM<T> extends BaseViewModel with Store {
  // Page controller for pageView
  PageController? pageController;

  // Whether there are any more items to be loaded on the right end (future)
  bool noMoreNextPastResults = true;
  bool noMorePreviousPastResults = true;

  // The initial page for the pageView
  int? initialPage;

  // Currently showing data list for use in the stream
  final _dataList = List<T>.empty(growable: true);
  final _dataStreamController = StreamController<List<T>>();

  get pageViewDataStream => _dataStreamController.stream;

  // Init data stream by add to dataList and dataStreamController.
  void initDataStream(Stream<List<T>>? stream, String? itemId, int Function(List<T> list)? setInitialPageCallback,
      String? firstItemId) {
    stream?.listen((list) {
      if (itemId != null) {
        // Update the initial page to wherever the current drawNo is on the list
        final reversedList = list.reversed.toList();
        initialPage = setInitialPageCallback?.call(reversedList) ?? reversedList.length - 1;

        /// Check whether this drawNo is the end of pastResults
        /// If drawNo is at the end of this list (i.e. initialPage == itemsLength), then it means there are NO MORE next
        /// past results.
        noMoreNextPastResults = initialPage == reversedList.length - 1;

        // There are NO previous items if the drawNo is the first even drawNo
        noMorePreviousPastResults = itemId == firstItemId;

        // Update list to pageView UI
        _dataList.insertAll(0, reversedList);
        _dataStreamController.add(_dataList);
      } else {
        // Set initial page to last item of list
        initialPage = list.length - 1;

        // Update list to pageView UI
        _dataList.insertAll(0, list.reversed);
        _dataStreamController.add(_dataList);
      }
    });
  }

  void onPreviousPaging(List<T> previousList, int fetchCount) {
    // Insert previous past results to start of list
    _dataList.insertAll(0, previousList.reversed);
    _dataStreamController.add(_dataList);

    // Jump to new index of previous index 0 after adding new items to the start of list
    Future.delayed(const Duration(milliseconds: 200), () {
      pageController?.jumpToPage(fetchCount);
    });
  }

  void onNextPaging(List<T> nextList) {
    if (nextList.isNotEmpty) {
      // Add next past results at end of list
      _dataList.addAll(nextList);
      _dataStreamController.add(_dataList);
    }
  }

  void dispose() {
    _dataStreamController.close();
  }
}
