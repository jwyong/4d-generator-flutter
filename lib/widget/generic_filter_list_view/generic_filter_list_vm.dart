import 'package:mobx/mobx.dart';

import '../../base/base_state.dart';

part 'generic_filter_list_vm.g.dart';

class GenericFilterItemVM = AGenericFilterItemVM with _$GenericFilterItemVM;

abstract class AGenericFilterItemVM extends BaseViewModel with Store {
  @observable
  bool isSorting = false;

  @observable
  bool isDesc = false;

  // Update
  @action
  void updateSortingAndDesc(bool isSorting, bool isDesc) {
    this.isSorting = isSorting;
    this.isDesc = isDesc;
  }
}