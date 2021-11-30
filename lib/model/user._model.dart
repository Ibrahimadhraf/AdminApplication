import 'package:admin_application/model/main_model.dart';

class UserModel extends MaimModel{
UserModel({
  String ?email,
  String ?password
}):super(password: password ,email: email);

  UserModel.fromJson(Map<dynamic,dynamic>?map){


    email=map!['email'];
    password=map['password'];
  }
  toJson(){
    return{
      'password':password,
      'email':email,

    };
  }
}