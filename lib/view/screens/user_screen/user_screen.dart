import 'package:admin_application/network/fire_sore_user.dart';
import 'package:admin_application/view/helpers/size_config.dart';
import 'package:admin_application/view/widgets/application_circular_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream:    FireBaseUtil().getUsers(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data==null || snapshot.data!.docs.isEmpty){
              return Text('no data');
            }
            if (!snapshot.hasData) {
              return const Center(
                child: ApplicationIndicator(),
              );
            }
            return GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              children: snapshot.data!.docs.map((document) {
                print(document.id);
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    width: SizeConfig().screenWidth*.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xff8c52ff),


                    ),
                    child: Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(document['email']),
                    )),

                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
