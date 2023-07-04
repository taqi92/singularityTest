import 'package:reprecinct/models/attendance_response.dart';
import 'package:reprecinct/utils/endpoints.dart';

import '../../models/fetch_stores_response.dart';
import '../../utils/constants.dart';
import '../api_client.dart';

class CommonRepository {
  final ApiClient _apiClient = ApiClient.apiClient;
  static final CommonRepository _commonRepository =
      CommonRepository._internal();

  CommonRepository._internal();

  factory CommonRepository() {
    return _commonRepository;
  }


  void callGetStoresApi(String url,ResponseCallback<StoreResponse?, String?> callback) async {
    _apiClient.getRequest(url, (response, error) {
      if (response != null) {
        callback(StoreResponse.fromJson(response), null);
      } else {
        callback(null, error);
      }
    });
  }

  void callPostAttendanceApi(Map<String, dynamic> request, ResponseCallback<AttendanceResponse?, String?> callback) {
    _apiClient.postRequest(postAttendanceEndPoint, request, (response, error) {
      if(response != null) {
        callback(AttendanceResponse.fromJson(response), null);
      } else {
        callback(null, error);}
    });
  }

}
