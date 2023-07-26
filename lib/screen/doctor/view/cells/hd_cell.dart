
import 'package:one_tap_health/screen/doctor/utils/custom_icons_icons.dart';
import 'package:one_tap_health/screen/doctor/utils/he_color.dart';
import 'package:flutter/material.dart';
import 'package:one_tap_health/utils/app_colors/app_colors.dart';

import '../../../../model/doctor/doctor_list_model.dart';

class HDCell extends StatelessWidget {
  final Doctor? doctor;
  final Function? onTap;

  const HDCell({
    Key? key,
    @required this.doctor,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        width: 283,
        height: 199,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColor.appBackGroundBrn,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 16,
              right: 16,
              child: SizedBox(
                width: 162,
                height: 139,
                child: Image(
                  image: AssetImage('images/doctor/bg_shape.png'),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 10,
              child:  Text(
                doctor!.department! + ' Specialist',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Positioned(
              top: 32,
              left: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'Dr.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    doctor!.name!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    doctor!.mobile!,
                    style: TextStyle(
                      color: AppColor.oneTapBrwnDeepest,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),


                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: 77,
                height: 54,
                decoration: BoxDecoration(
                  color: AppColor.oneTapBrwnDeep,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(32)),
                ),
                child: Icon(
                  Icons.kitchen,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
            Positioned(
              right: 16,
              bottom: 0,
              child: SizedBox(
                width: 120,
                height: 173,
                child: Hero(
                  tag: doctor!.name! + doctor!.name!,
                  child: Image(
                    filterQuality: FilterQuality.high,
                    image: AssetImage('images/doctor/albert.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
