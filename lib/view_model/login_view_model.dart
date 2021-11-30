
import 'dart:developer';

import 'package:admin_application/model/admin_model.dart';

import 'package:admin_application/network/fire_sore_user.dart';
import 'package:admin_application/view/helpers/application_utils/key_chain_utils/key_chain_utils.dart';
import 'package:admin_application/view/screens/main_screen/main_screen.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LoginViewModel extends GetxController {
  final ValueNotifier<bool> _isSecure = ValueNotifier(true);
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  bool get isSecure => _isSecure.value;
  bool get isLoading => _isLoading.value;
  late  String? userToken;
  @override
  void onInit() {
    // TODO: implement onInit
    // FireBaseUtil().getUsers().then((value) {
    //   print(value);
    //
    // });
     FirebaseMessaging.instance.getToken().then((value){
       userToken=value;
       print(userToken);
       update();
     });
    super.onInit();
  }
  void togglePassword() {
    _isSecure.value = !_isSecure.value;
    update();
  }
   storeUser({String ? email,String? password }) async{


    _isLoading.value=true;
    update();
       FireBaseUtil().getAdmin().then((value) {


         var  mails=(value).docs;
         for(int i=0;i<mails.length;i++){
           if(mails[i].id.toLowerCase()==email?.toLowerCase()){
             log(mails[i].id);
                 _isLoading.value=false;
                 update();

                Get.offAll(const MainScreen());
           }else{
             FireBaseUtil().addAdminToFireStore(AdminModel(email: email ,password: password ,
                     userToken: userToken)).then((value) {
                        _isLoading.value=false;
                           KeyChainUtils().storeEmail(email: email);
                      Get.offAll(const MainScreen());
                 }).catchError((error){
                   _isLoading.value=false;
                 }
                 );
           }
         }


       });

  }
}
