import 'package:admin_application/view/helpers/application_utils/color_utils/colors.dart';
import 'package:flutter/material.dart';



class ApplicationIndicator extends StatelessWidget {
  const ApplicationIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: mainColor,
    );
  }
}
