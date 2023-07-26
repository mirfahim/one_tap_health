import 'package:one_tap_health/model/doctor/doctor_list_model.dart';
import 'package:one_tap_health/screen/doctor/models/category.dart';
import 'package:one_tap_health/screen/doctor/utils/he_color.dart';
import 'package:flutter/material.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';

class CategoryCell extends StatelessWidget {
  final Doctor? category;

  const CategoryCell({Key? key, @required this.category}) : super(key: key);

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
        color: AppColor.appBackGroundBrn,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.badge,
                  size: 24,
                  color:AppColor.oneTapBrwnDeep,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  category!.name!,
                  style: TextStyle(
                    color: AppColor.textColorBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                    color: AppColor.oneTapBrwnDeep,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(10))),
              ),
              Positioned(
                left: 16,
                child: Text(
                  'Specialist',
                  style: TextStyle(
                    color: AppColor.textColorWhite,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
