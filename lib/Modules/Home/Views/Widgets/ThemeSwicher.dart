import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:cryptocurrency_listing/Services/ThemeService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  RxBool positive = false.obs;

  @override
  void initState() {
    if (ThemeService().theme == ThemeMode.light) {
      positive.value = false;
    } else {
      positive.value = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Obx(
        () => AnimatedToggleSwitch<bool>.dual(
          current: positive.value,
          first: false,
          second: true,
          dif: 5.0,
          indicatorSize: const Size(32, 32),
          borderColor: Colors.transparent,
          borderWidth: 0.0,
          height: 65,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1.5),
            ),
          ],
          onChanged: (b) {
            positive.value = b;
            ThemeService().switchTheme();
          },
          colorBuilder: (b) => b ? Colors.grey : Colors.orangeAccent,
          iconBuilder: (value) => value ? const Icon(Icons.mode_night, size: 20) : const Icon(Icons.sunny, size: 20),
          textBuilder: (value) => value ? const Icon(Icons.sunny, size: 20) : const Icon(Icons.mode_night, size: 20),
        ),
      );
}
