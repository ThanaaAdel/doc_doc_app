import 'package:flutter/cupertino.dart';

import '../../../../../core/theming/styles.dart';

class TermAndConditionText extends StatelessWidget {
  const TermAndConditionText({super.key});

  @override
  Widget build(BuildContext context) {
    return  RichText(
      textAlign: TextAlign.center,
      text:
      TextSpan(children:
      [
        TextSpan(
          text: "By logging , you agree to our",
          style: TextStyles.font13GrayRegular,
        ),
        TextSpan(
            text: ' Terms & Condition',
            style: TextStyles.font13DarkBlueRegular
        ),
        TextSpan(
          text: " and",
          style: TextStyles.font13GrayRegular.copyWith(
            height: 1.3
          ),
        ),
        TextSpan(
          text: ' Privacy Policy',
              style: TextStyles.font13DarkBlueRegular
        )
      ]
      ),

    );
  }
}
