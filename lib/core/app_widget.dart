import 'package:smattlife/controller/all_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smattlife/core/auth_switch.dart';
import 'package:smattlife/core/theme/theme_dark.dart';
import 'package:smattlife/core/theme/theme_light.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      initialBinding: AllControllerBinding(),
      debugShowCheckedModeBanner: false,
      title: 'smattlifeap',
      initialRoute: "/",
      home: AuthSwitch(),
      theme: LIGHT_THEME,
      //! Remove codes below
      darkTheme: DARK_THEME,
      // themeMode: ThemeService().getThemeMode(),
      themeMode: ThemeMode.system,
    );
  }
}
