
import 'package:one_tap_health/model/doctor/doctor_list_model.dart';
import 'package:one_tap_health/screen/doctor/utils/custom_icons_icons.dart';
import 'package:one_tap_health/screen/doctor/utils/he_color.dart';
import 'package:flutter/material.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';
import 'package:get/get.dart';
class TrdCell extends StatelessWidget {
  final Doctor? doctor;

  const TrdCell({
    Key? key,
    @required this.doctor,
  }) : super(key: key);

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            color: AppColor.appBackGroundBrn.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageSection(),
          SizedBox(
            width: 16,
          ),
          _detailsSection(),
        ],
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  /// Image Section
  Container _imageSection() {
    return Container(
      height: 77,
      width: 90,
      decoration: BoxDecoration(
        color: AppColor.figmaRed.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('images/doctor/albert.png' ),
        ),
      ),
    );
  }

  /// Details Section
  Column _detailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
             "4",
              style: TextStyle(
                color: AppColor.textColorBlack,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Icon(
              CustomIcons.star,
              color: AppColor.buttonColorYellow,
              size: 14,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
        height: Get.height*.04,
          width: Get.width *.5,
          child: Text(
            doctor!.name! ,
            maxLines: 2,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 30,
          width: 200,
          child: Text(
            doctor!.department! + ' Specialist',
            maxLines: 3,
            style: TextStyle(
              color: AppColor.textColorBlack,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
