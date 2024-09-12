import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class HaveAccountCheck extends StatelessWidget {
  const HaveAccountCheck({super.key, required this.checkText, required this.actionText, required this.onTap});
final String checkText,actionText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 45.0),
        child: Row(
          children: [
            Text(
            checkText,
              style: Styles.textStyle14.copyWith(color: Colors.grey),
            ),
            const Gap(6),
            GestureDetector(
              onTap:onTap,
              child: Text(
                actionText,
                style: Styles.textStyle14
                    .copyWith(color: primaryColor, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
