import 'package:admin_application/network/fire_sore_user.dart';
import 'package:admin_application/view/helpers/application_utils/color_utils/colors.dart';
import 'package:admin_application/view/helpers/size_config.dart';
import 'package:admin_application/view/widgets/application_circular_indicator.dart';
import 'package:admin_application/view_model/main_screen_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<MainScreenViewModel>(
      init: Get.put(MainScreenViewModel()),
      builder: (ref) =>Scaffold(
         body: ref.currentScreen,
        bottomNavigationBar: buttonNavigationBar(),
      ),
    );

  }
  Widget buttonNavigationBar() {
    return GetBuilder<MainScreenViewModel>(
      init: Get.put(Get.find()),
      builder: (ref) => SizedBox(
        height: SizeConfig().safeBlockVertical * 9,
        child: BottomNavigationBar(

          type: BottomNavigationBarType.fixed,
          selectedItemColor: mainColor,
          backgroundColor: Colors.white,
          selectedFontSize: 12,

          items: [
            BottomNavigationBarItem(
                label: 'Users',
                icon: Padding(
                  padding:
                  EdgeInsets.only(top: SizeConfig().safeBlockVertical * 2),
                  child: Icon(Icons.person ,color: ref.navigatorValue==0? secondaryColor:Colors.grey,)  )),
            BottomNavigationBarItem(
                label: 'Orders',

                icon: Padding(
                  padding:
                  EdgeInsets.only(top: SizeConfig().safeBlockVertical * 2),
                  child:Icon(Icons.agriculture_sharp ,color: ref.navigatorValue==1? secondaryColor:Colors.grey,)
                )),

          ],
          elevation: 6,


          currentIndex: ref.navigatorValue,
          onTap: (index) {
            ref.changeNavigatorValue(index);
          },
        ),
      ),
    );
  }
}
