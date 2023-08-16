import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/repository/dmc_hot_repo.dart';
import 'package:mobx/mobx.dart';

part 'hot_numbers_vm.g.dart';

class HotNumbersVM = AHotNumbersVM with _$HotNumbersVM;

abstract class AHotNumbersVM with Store, BaseViewModel {
  late final _dmcHotRepository = DmcHotRepository(database);

  late final Stream<List<DmcHotEntityData>> dmcHotListStream = _dmcHotRepository.getDmcHotListStream();

}