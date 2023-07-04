import 'package:get/get.dart';
import 'package:reprecinct/models/fetch_stores_response.dart';

import 'package:reprecinct/network/repositories/common_repository.dart';
import 'package:reprecinct/utils/endpoints.dart';
import '../utils/constants.dart';

class CommonController extends GetxController {
  late final CommonRepository _commonRepository;

  List<Data> storeList = [];

  var nameObs = Rxn<String?>();
  var idObs = Rxn<String?>();
  var requestId = Rxn<String?>();

  @override
  void onInit() {
    _commonRepository = CommonRepository();
    super.onInit();
  }

  void getStores() {
    loading();

    String url;
    url = fetchStoresEndpoint;
    _commonRepository.callGetStoresApi(url, (response, error) {
      dismissLoading();

      storeList = [];

      if (response != null) {
        response.data?.forEach((element) {
          storeList.add(element);
        });
      }
    });
    // update();
  }

  void postAttendance() {
    //loading();

    var request = {
      "name": nameObs.value,
      "uid": idObs.value,
      "latitude": "23.8103",
      "longitude": "90.4125",
      "request_id": requestId.value
    };

    _commonRepository.callPostAttendanceApi(request, (response, error) {
      if (response != null) {
        showMessage("Success");
      } else {
        showMessage("Invalid Credential!");
      }
    });
  }
}
