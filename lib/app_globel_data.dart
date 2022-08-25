import 'database/ap_rx_helper.dart';
import 'database/app_loacal_database_helper.dart';
import 'routes/app_route_helper.dart';

class GlobelData {
  final preferenceService = PreferenceService.getInstance();
  final navigationRoutesHelper = RouteHelper.getInstance();
  final rxDataStore = RxDataStore.getInstance();
}
