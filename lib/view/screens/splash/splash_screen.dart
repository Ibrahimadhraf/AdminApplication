import 'dart:developer';

import 'package:admin_application/view/helpers/application_utils/color_utils/colors.dart';
import 'package:admin_application/view/helpers/application_utils/key_chain_utils/key_chain_utils.dart';
import 'package:admin_application/view/helpers/size_config.dart';
import 'package:admin_application/view/screens/login/login_screen.dart';
import 'package:admin_application/view/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int timerDurationMilliseconds = 1200;

  final int navigateDurationMilliseconds = 3000;
  late String? email;
  @override
  initState() {

        gotoNext();
        KeyChainUtils().getEmail().then((value) {
          email=value;

        });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: mainColor,
    );
  }
  gotoNext() => Future.delayed(
      Duration(
        milliseconds: navigateDurationMilliseconds,
      ), () async {
    log(email??"empty");
      Get.offAll(() => email==null? LoginScreen():const MainScreen());


  });
}
