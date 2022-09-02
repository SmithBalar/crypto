import 'package:get/get.dart';

import '../../Bindings/HomeScreenBindings.dart';
import '../../Modules/Home/Views/Screens/HomeScreen.dart';
import 'Routes.dart';

class AppPages {
  static final List<GetPage> getPages = [
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
    ),
  ];
}
