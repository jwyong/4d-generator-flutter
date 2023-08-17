import 'package:lucky_generator/base/base_state.dart';
import 'package:mobx/mobx.dart';

part 'hot_number_card_vm.g.dart';

class HotNumberCardVM = AHotNumberCardVM with _$HotNumberCardVM;

abstract class AHotNumberCardVM with Store, BaseViewModel {
  @observable
  bool isShowingFront = true;

  void onCardTapped() {
    isShowingFront = !isShowingFront;
  }
}