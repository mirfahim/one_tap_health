import 'package:flutter/material.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../constants.dart';

class BottomContainer extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  BottomContainer({required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColor.figmaRed,
        margin: EdgeInsets.all(5),
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.only(bottom: 5.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
