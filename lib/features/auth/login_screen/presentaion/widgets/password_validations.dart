import 'package:flutter/material.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
class PasswordValidations extends StatelessWidget {
  const PasswordValidations({super.key, required this.hasLowerCase, required this.hasUpperCase, required this.hasNumber, required this.hasMinLength, required this.hasSpecialCharacters});
final bool hasLowerCase;
final bool hasUpperCase;
final bool hasNumber;
final bool hasMinLength;
final bool hasSpecialCharacters;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowerCase letter',hasLowerCase),
        verticalSpacing(2),
        buildValidationRow('At least 1 UpperCase letter',hasUpperCase),
        verticalSpacing(2),
        buildValidationRow('At least 1 Number ',hasNumber),
        verticalSpacing(2),
        buildValidationRow('At least 1 Special Character ',hasSpecialCharacters),
        verticalSpacing(2),
        buildValidationRow('At least 8 characters long ',hasMinLength),
        verticalSpacing(2),
      ],
    );
  }
}

Widget buildValidationRow(String text, bool hasValidated) {
  return Row(children: [
     const CircleAvatar(
    radius: 2.5,
    backgroundColor: ColorsManager.grey,

    ),
    horizontalSpacing(6),
    Text(text,style: TextStyles.font13DarkBlueRegular.copyWith(
      decoration:  hasValidated ? TextDecoration.lineThrough : null,
      decorationColor:  Colors.green,
      decorationThickness: 2,
      color: hasValidated ? ColorsManager.grey : ColorsManager.mainBlue,
    ),)
  ],);
}
