import 'package:admin_application/model/admin_model.dart';
import 'package:admin_application/model/user._model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FireBaseUtil{
  FireBaseUtil._internal();

  static final FireBaseUtil _instance = FireBaseUtil._internal();

  factory FireBaseUtil() => _instance;
  final CollectionReference _userCollectionsRef=FirebaseFirestore.instance.collection('Users');
  final CollectionReference _adminCollectionsRef=FirebaseFirestore.instance.collection('Admins');
  final CollectionReference _ordersCollectionsRef=FirebaseFirestore.instance.collection('Orders');
  getOrders(){
    var value=_ordersCollectionsRef.snapshots();
    return value;
  }
  Future<void> addAdminToFireStore(AdminModel model)async{
    return await _adminCollectionsRef.doc(model.email)
        .set(model.toJson());
  }
   getAdmin({String ? email})async{
    return  _adminCollectionsRef.get();
  }
   getUsers()  {
    var value = _userCollectionsRef.snapshots();

    return  value;
  }
}