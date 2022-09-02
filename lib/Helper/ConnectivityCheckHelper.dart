import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../Services/InternetConnectivity.dart';

mixin ConnectivityCheckHelper on GetxController {
  final MyConnectivity _connectivity = MyConnectivity.instance;
  RxBool isOnline = true.obs;

  @override
  void onInit() {
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      if (source.keys.first == ConnectivityResult.none) {
        isOnline(false);
      } else {
        isOnline(true);
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    _connectivity.disposeStream();
    super.onClose();
  }
}
