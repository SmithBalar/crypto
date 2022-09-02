import 'dart:convert';

import 'package:cryptocurrency_listing/Constants/Constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../Helper/ConnectivityCheckHelper.dart';
import '../../../Providers/DBProvider.dart';
import '../Models/Crypto.dart';

class HomeController extends GetxController with ConnectivityCheckHelper {
  RxList currencyList = [].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    isOnline.listen((val) {
      getCurrencyList();
    });
    super.onInit();
  }

  getCurrencyList() async {
    isLoading = true.obs;
    String? dbData = await DBProvider.db.getAllCryptos();
    List dbResponse = jsonDecode(dbData.toString());
    // if (kDebugMode) {
    //   log(dbResponse.toString());
    // }
    try {
      if (isOnline.value) {
        var url = Uri.parse(baseUrl);
        var response = await http.get(
          url,
          headers: {'Content-type': 'application/json', 'Accept': 'application/json'},
        );
        await DBProvider.db.createCrypto(jsonDecode(response.body));
        List apiResponse = json.decode(response.body);

        currencyList.value = apiResponse.map((e) => CryptoModel.fromJson(e)).toList();

        currencyList.map((e) async => await precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, e.logoUrl), null));
      } else {
        currencyList.value = dbResponse.map((e) => CryptoModel.fromJson(e)).toList();
      }
    } on FormatException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      currencyList.value = dbResponse.map((e) => CryptoModel.fromJson(e)).toList();
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      currencyList.value = dbResponse.map((e) => CryptoModel.fromJson(e)).toList();
    } finally {
      isLoading = false.obs;
    }
  }
}
