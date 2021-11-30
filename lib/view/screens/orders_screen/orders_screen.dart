import 'package:admin_application/network/fire_sore_user.dart';
import 'package:admin_application/view/helpers/size_config.dart';
import 'package:admin_application/view/widgets/application_circular_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:    FireBaseUtil().getOrders(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data==null || snapshot.data!.docs.isEmpty){
            return Text('no data');
          }
          if (!snapshot.hasData) {
            return const Center(
              child: ApplicationIndicator(),
            );
          }
          return ListView(

            children: snapshot.data!.docs.map((document) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  width: SizeConfig().screenWidth*.5,
                  height: SizeConfig().screenHeight*.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: const Color(0xff8c52ff),


                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(document['title']),

                        Text(document['email']),
                        Text(document['description'])
                      ],
                    ),
                  ),

                ),
              );
            }).toList(),
          );
        });
  }
}
