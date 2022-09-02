import 'package:cryptocurrency_listing/Modules/Home/Controllers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/GridTileWidget.dart';
import '../Widgets/ThemeSwicher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController get _homeController => Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies', style: TextStyle(fontSize: 16)),
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: ThemeSwitcher(),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _homeController.getCurrencyList();
        },
        child: Column(
          children: [
            Obx(
              () => Visibility(
                visible: !_homeController.isOnline.value,
                child: Container(
                  width: double.infinity,
                  color: Colors.red.shade400,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'You are offline',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: _homeController.currencyList.isEmpty && _homeController.isLoading.value,
                child: const LinearProgressIndicator(),
              ),
            ),
            Obx(
              () => _homeController.currencyList.isEmpty && _homeController.isLoading.value
                  ? const Expanded(
                      child: Center(
                        child: Text(
                          'Loading...',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  : _homeController.currencyList.isEmpty && !_homeController.isLoading.value
                      ? Expanded(
                          child: Center(
                            child: InkWell(
                              child: const Text(
                                'NO DATA AVAILABLE\nCheck your internet connectivity and try again.',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                _homeController.getCurrencyList();
                              },
                            ),
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                            itemCount: _homeController.currencyList.length,
                            padding: const EdgeInsets.all(14),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 14,
                              mainAxisSpacing: 14,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return GridTileWidget(cryptoData: _homeController.currencyList[index]);
                            },
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
