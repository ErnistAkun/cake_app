import 'package:cake_app/constants/colors.dart';
import 'package:flutter/cupertino.dart';

Widget roundButton({String? text, double? fontsize, double? height}) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: height != null ? height : 30.0,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Center(
        child: Text(
          text != null ? text : 'Купи сейчас',
          style: TextStyle(
            fontSize: fontsize != null ? fontsize : 11.0,
            color: white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
