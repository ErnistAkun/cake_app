import 'package:cake_app/constants/colors.dart';
import 'package:cake_app/widget/circle_btn.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          CircleButton(
            onTap: () {
              setState(() => isClick = !isClick);
            },
            size: 35,
            image: isClick ? 'heart_full.svg' : 'heart.svg',
            bgColor: pink02,
            iconColor: mainColor,
          )
        ],
      ),
    );
  }
}
