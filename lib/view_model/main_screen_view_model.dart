import 'package:admin_application/view/screens/orders_screen/orders_screen.dart';
import 'package:admin_application/view/screens/user_screen/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenViewModel extends GetxController{
  final ValueNotifier<int>_navigatorValue=ValueNotifier(0);
  get navigatorValue=>_navigatorValue.value;
  Widget currentScreen=const UserScreen();
  void changeNavigatorValue(int selectedValue){
    _navigatorValue.value=selectedValue;


    switch(selectedValue){
      case 0:
        currentScreen=const UserScreen();
        break;

      case 1:
        currentScreen=const OrdersScreen();
        break;

    }
    update();
  }

}