import 'package:cryptocurrency_listing/Config/Themes/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Config/Routes/AppPages.dart';
import 'Config/Routes/Routes.dart';
import 'Modules/Home/Views/Screens/HomeScreen.dart';
import 'Services/ThemeService.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crypto App',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      color: Colors.indigoAccent,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      getPages: AppPages.getPages,
      initialRoute: Routes.homeScreen,
    );
  }
}
