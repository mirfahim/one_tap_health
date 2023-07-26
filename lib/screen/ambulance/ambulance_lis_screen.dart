
import 'package:flutter/material.dart';
import 'package:one_tap_health/screen/ambulance/constant.dart';
import 'package:one_tap_health/screen/ambulance/widget/ambulance_item.dart';

import '../../utils/app_colors/app_colors.dart';

class AvailableCarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.oneTapBlue,
      appBar: buildAppBar(),
      body: ListView.builder(
        itemCount: carList.length,
        itemBuilder: (context, index) => CarListItem(index),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.oneTapBrwnDeep,
      elevation: 0,
      title: Text('Available Car'),
      actions: [
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}