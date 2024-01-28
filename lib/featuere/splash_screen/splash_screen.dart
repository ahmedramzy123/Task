import 'dart:async';


import 'package:flutter/material.dart';
import 'package:taskkafille/core/utils/assets_manager/assets_manager.dart';
import 'package:taskkafille/featuere/Auth/login/presentation/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 3,), () {
     // Get.offAllNamed(PageName.onBoarding);
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const LoginScreen()));
      //CacheHelper.saveData(key: 'splash', value: true);
      //print(CacheHelper.saveData(key: 'splash', value: true));
    });
  }
  @override
  void initState() {

    super.initState();
    _startDelay();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(AssetsManager.LOGO,fit: BoxFit.cover,));
  }
}
