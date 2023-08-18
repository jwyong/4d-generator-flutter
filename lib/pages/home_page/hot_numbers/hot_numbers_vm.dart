import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/model/time_period.dart';
import 'package:lucky_generator/repository/dmc_hot_repo.dart';
import 'package:mobx/mobx.dart';

part 'hot_numbers_vm.g.dart';

class HotNumbersVM = AHotNumbersVM with _$HotNumbersVM;

abstract class AHotNumbersVM with Store, BaseViewModel {
  late final _dmcHotRepository = DmcHotRepository(database);

  // Selected time period (dropdown)
  late final TimePeriod _selectedTimePeriod = TimePeriod.year_1;

  // Hot numbers list
  late final Stream<List<DmcHotEntityData>> dmcHotListStream =
      _dmcHotRepository.getDmcHotListStream(_selectedTimePeriod);
}
