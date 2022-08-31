

import '../../common/app_constants.dart';
import '../app_database_services.dart';

class AuthService {
  final DataBaseServices _coreService = DataBaseServices();

  Future callUserLoginAPI(body, context) async {
    var data = await _coreService.apiService(
        context: context,
        body: body,
        method: METHOD.POST,
        endpoint: AppConstants.LOGIN,
        returnType: 'login',
        baseURL: AppConstants.BASE_URL);
    // baseURL: AppConstants.ACCOUNT_SERVICE);
    return data;
  }

  logoutUser(Map<String, dynamic> body) async {
    return await _coreService.apiService(
        body: body,
        method: METHOD.POST,
        endpoint: AppConstants.LOGOUT_USER,
        returnType: 'logoutUser',
        baseURL: AppConstants.BASE_URL);
  }
}