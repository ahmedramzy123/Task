import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskkafille/core/utils/assets_manager/assets_manager.dart';

import '../../../../../../../core/utils/color_manager/color_manager.dart';
import '../../../../../../../core/utils/style_font_manager/style_manager.dart';

class ServiceItem extends StatelessWidget {
  String description;
  String image;
  String price;
  String rate;
  String cartNumber;

  ServiceItem(
      {super.key,
      required this.description,
      required this.image,
      required this.price,
      required this.rate,
      required this.cartNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157.w,
      height: 192.h,
      decoration: ShapeDecoration(
        color: ColorManager.colorWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 156.w,
                height: 103.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                      image: NetworkImage(
                        image,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                // right: 5,
                left: 4.h,
                bottom: 6.h,
                child: Container(
                    width: 60.w,
                    height: 26.h,
                    decoration: ShapeDecoration(
                      color: ColorManager.colorPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '\$$price',
                        style: getSmallBoldStyle(
                            color: ColorManager.colorWhite, fontSize: 11),
                      ),
                    )),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.center,
                    style: getLight2Style(
                        color: ColorManager.colorBlack, fontSize: 11),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetsManager.STAR,
                      color: ColorManager.colorGold,
                    ),
                    Text(
                      ' ($rate)',
                      style: getSmallBoldStyle(
                          color: ColorManager.colorGold, fontSize: 11),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Container(
                        width: 1.w,
                        height: 10.h,
                        color: ColorManager.colorGrey,
                      ),
                    ),
                    SvgPicture.asset(
                      AssetsManager.CART,
                      width: 14.w,
                      height: 14.h,
                      color: ColorManager.colorGrey,
                    ),
                    Text(
                      ' $cartNumber',
                      style: getSmallBoldStyle(
                          color: ColorManager.colorGrey, fontSize: 10),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
