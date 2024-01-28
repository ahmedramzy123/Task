import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskkafille/core/utils/assets_manager/assets_manager.dart';
import 'package:taskkafille/core/utils/color_manager/color_manager.dart';
import 'package:taskkafille/core/utils/style_font_manager/style_manager.dart';
import 'package:taskkafille/featuere/profile/presentation/profilescreen.dart';
import 'package:taskkafille/featuere/services_screen/presentation/view/services_screen.dart';

import '../coutery/presentation/view/countries_screen/countries_screen.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;
  bool isSelect = false;
  final tabs = [
    const ProfileScreen(),
    const CountriesScreen(),
    const ServicesScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
            //isSelect = true;
            print(currentIndex);
            print('-----------');
          });
        },
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedItemColor: ColorManager.colorPrimary,
        unselectedItemColor: ColorManager.colorGrey,
        currentIndex: currentIndex,backgroundColor: ColorManager.colorWhite,
        //fixedColor: ColorManager.colorWhite,
        unselectedLabelStyle:
            getSmallBoldStyle(color: ColorManager.colorGrey, fontSize: 12),
        selectedLabelStyle:
            getLight2Style(color: ColorManager.colorPrimary, fontSize: 12),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AssetsManager.PROFILE,
              color:
                  isSelect ? ColorManager.colorPrimary : ColorManager.colorGrey,
            ),
            label: 'Who Am I',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsManager.COUNTRIES,
                  color: isSelect
                      ? ColorManager.colorPrimary
                      : ColorManager.colorGrey),
              label: 'Countries'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsManager.SERVICES,
                  color: isSelect
                      ? ColorManager.colorPrimary
                      : ColorManager.colorGrey),
              label: 'Services'),
        ],
      ),
      body: tabs.elementAt(currentIndex),
    );
  }
}
