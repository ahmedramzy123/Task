import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskkafille/core/utils/color_manager/color_manager.dart';
import 'package:taskkafille/core/utils/style_font_manager/style_manager.dart';

import '../../../core/utils/assets_manager/assets_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 82.h, left: 20.w, right: 20.w),
            child: Row(
              children: [
                Text(
                  'Who Am I',
                  style: getBoldStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          ),
          Container(
            width: 110.w,
            height: 110.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorManager.colorPrimary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(55.r),
              color: ColorManager.colorPrimary,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  AssetsManager.LOGO,
                ),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: -15,
                  right: 0,
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: ColorManager.colorPrimary,
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Center(
                          child: SizedBox(
                            width: 20,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'First Name',
                            style: getLight2Style(
                                fontSize: 12, color: Color(0xff696F79)),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.h,right: 10.w ),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: ColorManager.colorGrey3,
                          filled: true,
                          // border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                                color: ColorManager.colorGrey3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Last Name',
                            style: getLight2Style(
                                fontSize: 12, color: Color(0xff696F79)),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.h, right: 20.w),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: ColorManager.colorGrey3,
                          filled: true,
                          // border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                                color: ColorManager.colorGrey3),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Email Address',
                  style: getLight2Style(
                      fontSize: 12,
                      color: Color(0xff696F79)),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.h, right: 20.w, left: 20.w),
            child: TextField(
              decoration: InputDecoration(
                fillColor: ColorManager.colorGrey3,
                filled: true,
                // border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: const BorderSide(
                      color: ColorManager.colorGrey3),
                ),
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Password',
                  style: getLight2Style(
                      fontSize: 12,
                      color: Color(0xff696F79)),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.h, right: 20.w, left: 20.w),
            child: TextField(
              decoration: InputDecoration(
                fillColor: ColorManager.colorGrey3,
                filled: true,
                // border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: const BorderSide(
                      color: ColorManager.colorGrey3),
                ),
              ),
            ),
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'User Type',
                  style: getLight2Style(
                      fontSize: 12,
                      color: Color(0xff696F79)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                RadioMenuButton(
                    value: false,
                    groupValue: 1,
                    onChanged: (value) {},
                    child: const Text('Seller')),
                RadioMenuButton(
                    value: false,
                    groupValue: 1,
                    onChanged: (value) {},
                    child: const Text('Buyer')),
                RadioMenuButton(
                    value: false,
                    groupValue: 1,
                    onChanged: (value) {},
                    child: const Text('Both')),
              ],
            ),
          ),
          //aboute
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'About',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff696F79)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3, left: 15, right: 15),
            child: TextField(
              maxLines: 3,
              decoration: InputDecoration(
                fillColor: const Color(0xffF9F9F9),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          //salary
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Sallary',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff696F79)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3, left: 15, right: 15),
            child: TextField(
              decoration: InputDecoration(
                fillColor: const Color(0xffF9F9F9),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Birth Date',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff696F79)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3, left: 15, right: 5),
            child: TextField(
              decoration: InputDecoration(
                fillColor: const Color(0xffF9F9F9),
                filled: true,
                suffixIcon: Icon(Icons.calendar_month_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Gender',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff696F79)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                RadioMenuButton(
                    value: false,
                    groupValue: 1,
                    onChanged: (value) {},
                    child: const Text('Male')),
                RadioMenuButton(
                    value: false,
                    groupValue: 1,
                    onChanged: (value) {},
                    child: const Text('Female')),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Skills',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff696F79)),
                )),
          ),
          Container(
            width: 137,
            height: 34,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            decoration: ShapeDecoration(
              color: Color(0xFFE9F9F1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Video Production',
                  style: TextStyle(
                    color: Color(0xFF1DBF73),
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    height: 0.09,
                    letterSpacing: 0.24,
                  ),
                ),
                const SizedBox(width: 3),
                Container(
                  width: 12,
                  height: 12,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(children: []),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Favourite Social Media',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff696F79)),
                )),
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              CircleAvatar(
                radius: 10,
                backgroundImage: AssetImage('assets/image/face.png'),
              ),
              SizedBox(
                width: 5,
              ),
              Text('Facebook'),
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              CircleAvatar(
                radius: 10,
                backgroundImage: AssetImage('assets/image/twitter.png'),
              ),
              SizedBox(
                width: 5,
              ),
              Text('Tiwtter'),
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              CircleAvatar(
                radius: 10,
                backgroundImage: AssetImage('assets/image/linkedin.png'),
              ),
              SizedBox(
                width: 5,
              ),
              Text('LinkedIn'),
            ],
          ),
        ],
      ),
    ));
  }
}
