import 'dart:math';

import 'package:geolocator/geolocator.dart';
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
  var latitude = Rxn<double?>();
  var longitude = Rxn<double?>();

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

      update();

    });

  }

  void postAttendance() {

    loading();

    var _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();

    String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    print(getRandomString(8));

    requestId.value = getRandomString(8);

    var request = {
      "name": nameObs.value,
      "uid": idObs.value,
      "latitude": latitude.value.toString(),
      "longitude": longitude.value.toString(),
      "request_id": requestId.value
    };

    _commonRepository.callPostAttendanceApi(request, (response, error) {
      dismissLoading();

      if (response != null) {
        showMessage("Success",isToast: true);

        Future.delayed(const Duration(milliseconds: 2000), () {
          Get.back();
        });

      } else {
        showMessage("Invalid Credential!");
      }
    });
  }

  Future<Future<Position>?> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) async {

      latitude.value = position.latitude;
      longitude.value = position.longitude;

      print("latitude" + latitude.value.toString());
      print("lon" + longitude.value.toString());

    }).catchError((e) {
      print(e);
    });
  }

}
