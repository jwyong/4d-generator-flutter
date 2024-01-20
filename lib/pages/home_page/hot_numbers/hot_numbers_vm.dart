import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/model/universal/time_period.dart';
import 'package:lucky_generator/repository/dmc_hot_repo.dart';
import 'package:mobx/mobx.dart';

part 'hot_numbers_vm.g.dart';

class HotNumbersVM = AHotNumbersVM with _$HotNumbersVM;

abstract class AHotNumbersVM extends BaseViewModel with Store {
  late final _dmcHotRepository = DmcHotRepository(database);

  // Selected time period (dropdown)
  @observable
  TimePeriod selectedTimePeriod = TimePeriod.year_1;

  // Hot numbers list
  late final Stream<List<DmcHotEntityData>> dmcHotListStream =
      _dmcHotRepository.getDmcHotListStream(selectedTimePeriod);

  /// TimePeriod dropdown related
  void onTimePeriodSelected(TimePeriod timePeriod) {
    // Update dropdown UI text
    selectedTimePeriod = timePeriod;

    // TODO: JAY_LOG Do db queries to refresh lists
    // Old test codes for switching modules
    // switch (timePeriod) {
    //   case TimePeriod.year_1:
    //     updateSelectedModuleType(ModuleType.toto);
    //     break;
    //
    //   default:
    //     updateSelectedModuleType(ModuleType.dmc);
    //     break;
    // }
  }
}
