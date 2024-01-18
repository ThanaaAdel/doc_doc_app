import 'package:doc_doc_app/core/Routing/app_router.dart';
import 'package:doc_doc_app/core/helper/extentions.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/theming/styles.dart';


class DonNotHaveAnAccount extends StatelessWidget {
  const DonNotHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        context.pushNamed('/registerScreen');
      },
      child: RichText(
        textAlign: TextAlign.center,
        text:
        TextSpan(children:
        [
          TextSpan(
            text: "Don Not Have an Account ? ",
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: "Sign Up ",
            style: TextStyles.font13BlueSemiBold,
          ),
        ]
        ),

      ),
    );
  }
}
