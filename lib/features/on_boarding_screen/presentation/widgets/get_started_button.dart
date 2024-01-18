import '../../../../core/helper/extentions.dart';
import '../../../../core/theming/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/Routing/routers.dart';
import '../../../../core/theming/styles.dart';
class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(

      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 52)),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: MaterialStateProperty.all(ColorsManager.mainBlue) ),
      onPressed: () {
context.pushNamed(Routes.loginScreen);
      },
child: Text('Get Started',style: TextStyles.font16WithMedium,),
    );
  }
}
