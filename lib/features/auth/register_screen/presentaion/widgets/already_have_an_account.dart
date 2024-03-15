import 'package:doc_doc_app/core/helper/extentions.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/theming/styles.dart';


class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        context.pop();
      },
      child: RichText(
        textAlign: TextAlign.center,
        text:
        TextSpan(children:
        [
          TextSpan(
            text: "Already Have an Account ? ",
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: " Login In",
            style: TextStyles.font13BlueSemiBold,
          ),
        ]
        ),

      ),
    );
  }
}
