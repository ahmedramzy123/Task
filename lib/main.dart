import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:taskkafille/sl.dart';
import 'core/api/dio-helper.dart';
import 'core/bloc_observer/bloc_observ.dart';
import 'core/cashhelper/cashhelper.dart';
import 'featuere/coutery/domain/use_case/usecase.dart';
import 'featuere/coutery/presentation/view_model/cubit/country_cubit.dart';
import 'featuere/services_screen/domain/usecase/usecase.dart';
import 'featuere/services_screen/presentation/view_model/cubit/sercice_cubit.dart';
import 'featuere/splash_screen/splash_screen.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  setup();
    Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: 
      [
        // BlocProvider(
        //   create: (context) => getIt<RegisterCubit>(),
        // ),

       BlocProvider(
          create: (context) => ServiceCubit(getIt<ServiceUseCase>()),
        ),

        BlocProvider(
          create: (context) => ServiceCubit(getIt<ServiceUseCase>()),
        ),
        BlocProvider(
          create: (context) => CountryCubit(getIt<CountryUseCase>()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder:(context,snapshot)=>snapshot.data != ConnectivityResult.none ? MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              home:child,
            ) :
            MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              home: Scaffold(
                body: Center(
                  child: Lottie.asset('assets/animations/no_internet.json'),
                ),
              )
            ),
          );
        },
        child:  const SplashScreen()
      ),
    );
  }
}