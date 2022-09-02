import '../../common/app_constants.dart';
import '../app_database_services.dart';

class DashBoardService {
  final DataBaseServices _coreService = DataBaseServices();

  Future getVisitorDetails(Map<String, dynamic> body) async {
    return await _coreService.apiService(
        body: body,
        method: METHOD.POST,
        endpoint: AppConstants.GET_VISITOR_DETAILS,
        returnType: '',
        baseURL: AppConstants.BASE_URL);
  }
 Future sendOtp(Map<String, dynamic> body) async {
    return await _coreService.apiService(
        body: body,
        method: METHOD.POST,
        endpoint: AppConstants.SEND_OTP,
        returnType: '',
        baseURL: AppConstants.BASE_URL);
  }
   Future verifyOtp(Map<String, dynamic> body) async {
    return await _coreService.apiService(
        body: body,
        method: METHOD.POST,
        endpoint: AppConstants.VERIFY_SEND_OTP,
        returnType: '',
        baseURL: AppConstants.BASE_URL);
  }
  Future getHostDetails(Map<String, dynamic> body) async {
    return await _coreService.apiService(
        body: body,
        method: METHOD.POST,
        endpoint: AppConstants.GET_HOST_DETAILS,
        returnType: '',
        baseURL: AppConstants.BASE_URL);
  }

   Future updateVisitorDetials(Map<String, dynamic> body) async {
    return await _coreService.apiService(
        body: body,
        method: METHOD.POST,
        endpoint: AppConstants.UPDATE_VISITOR_DETAILS,
        returnType: '',
        baseURL: AppConstants.BASE_URL);
  }
  Future updateHostDetials(Map<String, dynamic> body) async {
    return await _coreService.apiService(
        body: body,
        method: METHOD.POST,
        endpoint: AppConstants.UPDATE_HOST_DETAILS,
        returnType: '',
        baseURL: AppConstants.BASE_URL);
  }
   Future checkOutUser(Map<String, dynamic> body) async {
    return await _coreService.apiService(
        body: body,
        method: METHOD.POST,
        endpoint: AppConstants.CHECK_OUT_USER,
        returnType: '',
        baseURL: AppConstants.BASE_URL);
  }
   Future logoutUser(Map<String, dynamic> body) async {
    return await _coreService.apiService(
        body: body,
        method: METHOD.POST,
        endpoint: AppConstants.LOGOUT_USER,
        returnType: '',
        baseURL: AppConstants.BASE_URL);
  }

  
}
