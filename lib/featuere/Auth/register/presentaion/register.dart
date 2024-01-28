import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskkafille/core/utils/color_manager/color_manager.dart';
import 'package:taskkafille/featuere/Auth/register/presentaion/register_cubit/cubit/register_cubit.dart';
import 'package:taskkafille/featuere/Auth/register/register2.dart';
import 'package:taskkafille/sl.dart';
import '../domain/use_case/use_case_register.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  PageController controller = PageController();

  var fromKey = GlobalKey<FormState>();
  int?  selectRadio;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectRadio = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: fromKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Register',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<RegisterCubit>(),
        child: SingleChildScrollView(
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state)
            {

            },
            builder: (context, state)
            {
              RegisterCubit registerCubit =
            RegisterCubit.get(context);
                       return Column(
                children:
                [
                  SizedBox(
                    height: 50.h,
                  ),
                   CustomSteperWidget(stepOne:
                   registerCubit.stepOne),

                   Padding(
                    padding: EdgeInsets.all(18.0.sp),
                    child: registerCubit.stepOne ?
                      RegisterScreen2(registerCubit: registerCubit,
                      function: ()
                      {
                        setState(() {
                          registerCubit.switchStepOne();
                        });
                      },
                      ):
                      RegisterStepOneWidget(selectRadio: selectRadio!,
                      registerCubit: registerCubit ,
                      function: 
                      (){
                         setState(() {
                          registerCubit.switchStepOne();
                        });
                      }
                      )  ,
                  )
                ],
              );
            },
      // backgroundColor: Colors.white,
      // body: Column(
      //   children: [
      //     Padding(
      //       padding: EdgeInsets.only(
      //         top: 82.h,
      //         left: 20.w,
      //       ),
      //       child: Row(
      //         children: [
      //           InkWell(
      //               onTap: () {
      //                 Navigator.pop(context);
      //               },
      //               child: const Icon(
      //                 Icons.arrow_back_ios,
      //                 color: Colors.black,
      //               )),
      //           Text(
      //             'Register',
      //             style: getBoldStyle(
      //                 fontSize: 18, color: ColorManager.colorBlack),
      //           ),
      //         ],
      //       ),
      //     // Row(
      //     //   children: [
      //     //     Expanded(
      //     //       child: Column(
      //     //         children: [
      //     //           Padding(
      //     //             padding:
      //     //                 EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      //     //             child: Align(
      //     //                 alignment: Alignment.topLeft,
      //     //                 child: Text(
      //     //                   'First Name',
      //     //                   style: getLight2Style(
      //     //                       fontSize: 12, color: ColorManager.colorGrey2),
      //     //                 )),
      //     //           ),
      //     //           Padding(
      //     //             padding: EdgeInsets.only(top: 3.h, right: 10.w),
      //     //             child: SizedBox(
      //     //               height: 56.h,
      //     //               child: TextField(
      //     //                 decoration: InputDecoration(
      //     //                   fillColor: ColorManager.colorGrey3,
      //     //                   filled: true,
      //     //                   // border: InputBorder.none,
      //     //                   enabledBorder: OutlineInputBorder(
      //     //                     borderRadius: BorderRadius.circular(16.r),
      //     //                     borderSide: const BorderSide(
      //     //                         color: ColorManager.colorGrey3),
      //     //                   ),
      //     //                 ),
      //     //               ),
      //     //             ),
      //     //           ),
      //     //         ],
      //     //       ),
      //     //     ),
      //     //     Expanded(
      //     //       child: Column(
      //     //         children: [
      //     //           Padding(
      //     //             padding:
      //     //                 EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      //     //             child: Align(
      //     //                 alignment: Alignment.topLeft,
      //     //                 child: Text(
      //     //                   'Last Name',
      //     //                   style: getLight2Style(
      //     //                       fontSize: 12, color: ColorManager.colorGrey2),
      //     //                 )),
      //     //           ),
      //     //           Padding(
      //     //             padding: EdgeInsets.only(top: 3.h, right: 20.w),
      //     //             child: SizedBox(
      //     //               height: 56.h,
      //     //               child: TextField(
      //     //                 decoration: InputDecoration(
      //     //                   fillColor: ColorManager.colorGrey3,
      //     //                   filled: true,
      //     //                   // border: InputBorder.none,
      //     //                   enabledBorder: OutlineInputBorder(
      //     //                     borderRadius: BorderRadius.circular(16.r),
      //     //                     borderSide: const BorderSide(
      //     //                         color: ColorManager.colorGrey3),
      //     //                   ),
      //     //                 ),
      //     //               ),
      //     //             ),
      //     //           ),
      //     //         ],
      //     //       ),
      //     //     ),
      //     //   ],
      //     // ),
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      //       child: Align(
      //           alignment: Alignment.topLeft,
      //           child: Text(
      //             'Email Address',
      //             style: getLight2Style(
      //                 fontSize: 12, color: ColorManager.colorGrey2),
      //           )),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.only(top: 3.h, left: 20.w, right: 20.w),
      //       child: SizedBox(
      //         height: 56.h,
      //         child: TextField(
      //           decoration: InputDecoration(
      //             fillColor: ColorManager.colorGrey3,
      //             filled: true,
      //             // border: InputBorder.none,
      //             enabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(16.r),
      //               borderSide:
      //                   const BorderSide(color: ColorManager.colorGrey3),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //      Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      //       child: const Align(
      //           alignment: Alignment.topLeft,
      //           child: Text(
      //             'Password',
      //             style: TextStyle(
      //                 fontSize: 12,
      //                 fontWeight: FontWeight.w500,
      //                 color: Color(0xff696F79)),
      //           )),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.only(top: 3.h, left: 20.w, right: 20.w),
      //       child: SizedBox(
      //         height: 56.h,
      //         child: TextField(
      //           decoration: InputDecoration(
      //             fillColor: ColorManager.colorGrey3,
      //             filled: true,
      //             suffixIcon: IconButton(
      //                 icon: Icon(Icons.remove_red_eye_outlined),
      //                 onPressed: () {}),
      //             // border: InputBorder.none,
      //             enabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(16.r),
      //               borderSide:
      //                   const BorderSide(color: ColorManager.colorGrey3),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //      Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      //       child: const Align(
      //           alignment: Alignment.topLeft,
      //           child: Text(
      //             'Confirm Password',
      //             style: TextStyle(
      //                 fontSize: 12,
      //                 fontWeight: FontWeight.w500,
      //                 color: Color(0xff696F79)),
      //           )),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.only(top: 3.h, left: 20.w, right: 20.w),
      //       child: SizedBox(
      //         height: 56.h,
      //         child: TextField(
      //           decoration: InputDecoration(
      //             fillColor: ColorManager.colorGrey3,
      //             filled: true,
      //             suffixIcon: IconButton(
      //                 icon: Icon(Icons.remove_red_eye_outlined),
      //                 onPressed: () {}),
      //             // border: InputBorder.none,
      //             enabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(16.r),
      //               borderSide:
      //                   const BorderSide(color: ColorManager.colorGrey3),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //      Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      //       child: Align(
      //           alignment: Alignment.topLeft,
      //           child: Text(
      //             'User Type',
      //             style: getLight2Style(
      //                 fontSize: 12,
      //                 color: ColorManager.colorGrey2),
      //           )),
      //     ),
      //     Padding(
      //       padding:  EdgeInsets.symmetric(horizontal: 10.w),
      //       child: Row(
      //         children: [
      //           RadioMenuButton(
      //               value: false,
      //               groupValue: 1,
      //               onChanged: (value) {},
      //               child:  Text('Seller',style: getLight2Style(
      //                   fontSize: 14,
      //                   color: ColorManager.colorBlack),)),
      //           RadioMenuButton(
      //               value: false,
      //               groupValue: 1,
      //               onChanged: (value) {},
      //               child:  Text('Buyer',style: getLight2Style(
      //                   fontSize: 14,
      //                   color: ColorManager.colorBlack))),
      //           RadioMenuButton(
      //               value: false,
      //               groupValue: 1,
      //               onChanged: (value) {},
      //               child:  Text('Both',style: getLight2Style(
      //                   fontSize: 14,
      //                   color: ColorManager.colorBlack))),
      //         ],
      //       ),
      //     ),
      //     Padding(
      //       padding:  EdgeInsets.only(top: 50.h, left: 180.w),
      //       child: ElevatedButton(
      //         onPressed: () {
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => RegisterScreen2(),));
      //         },
      //         style: ElevatedButton.styleFrom(
      //           primary: ColorManager.colorPrimary,
      //           minimumSize: Size(160.w, 56.h),
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(16.r),
      //           ),
      //         ),
      //         child: Text(
      //           "Next",
      //           style: getLight2Style(
      //             fontSize: 15,
      //             color: Colors.white,
      //           ),
      //         ),
      //       ),
      //     ),
        )
        ),
      ),
    );
  }
}

class RegisterStepOneWidget extends 
      StatefulWidget 
{
  int  selectRadio;

   RegisterStepOneWidget({
    super.key,
    required this.selectRadio,
    required this.registerCubit,
    required this.function
  });
  final RegisterCubit registerCubit;
  final Function function;
  @override
  State<RegisterStepOneWidget> createState() => _RegisterStepOneWidgetState();
}

class _RegisterStepOneWidgetState extends State<RegisterStepOneWidget> 
{
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.registerCubit.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'First Name',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff696F79)),
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      controller:  widget.registerCubit.firstname,
                      validator: (value)
                      {
                        if (value!.isEmpty) {
                          return 'Please enter your first name';
                        }
                        if (value.length > 50) {
                          return 'First name should not exceed 50 characters';
                        }
                        return null;
      
                      },
                      decoration: InputDecoration(
                        fillColor: const Color(0xffF9F9F9),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  children: [
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Last Name',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff696F79)),
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      controller: widget.registerCubit.lastName,
                      validator: (value)
                      {
                        if (value!.isEmpty) {
                          return 'Please enter your last name';
                        }
                        if (value.length > 50) {
                          return 'Last name should not exceed 50 characters';
                        }
                        return null;
      
                      },
                      decoration: InputDecoration(
                        fillColor: const Color(0xffF9F9F9),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Email Address',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff696F79)),
              )),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            controller: widget.registerCubit.email,
            validator: (value)
            {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              if (value.length > 64) {
                return 'Email should not exceed 64 characters';
              }
              return null;
      
            },
            decoration: InputDecoration(
              fillColor: const Color(0xffF9F9F9),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Password',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff696F79)),
              )),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            controller: widget.registerCubit.password,
            validator: (value)
            {
              if(value!.isEmpty)
              {
                return 'Password must not be empty';
              }else if (value.length<8)
              {
                return 'Password must not be at Least 8';
      
              }
              return null;
            },
            obscureText: widget.registerCubit.obSecure,
            decoration: InputDecoration(
              fillColor: const Color(0xffF9F9F9),
              filled: true,
              suffixIcon: IconButton(
                  icon: widget.registerCubit.icon ,
                  onPressed: ()
                  {
                    widget.registerCubit.changeObSecurePassword();
                  }),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Confirm Password',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff696F79)),
              )),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
      
            controller: widget.registerCubit.confirmPassword,
            validator: (value)
            {
            if (value!.isEmpty) {
            return 'Please confirm your password';
            }
            if (value != widget.registerCubit.password.text) {
            return 'Passwords do not match';
            }
            return null;
            },
            obscureText: widget.registerCubit.obSecure,
            decoration: InputDecoration(
              fillColor: const Color(0xffF9F9F9),
              filled: true,
              suffixIcon: IconButton(
                  icon: widget.registerCubit.icon,
                  onPressed: ()
                  {
                    widget.registerCubit.changeObSecurePassword();
                  }),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'User Type',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff696F79)),
              )),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              RadioMenuButton(
                  value: 1,
                  groupValue: widget.selectRadio,
                  onChanged: (value)
                  {
                    setState(() {
                      widget.selectRadio = value!;
                      widget.registerCubit.typeUser = 2;
                    });
                  },
                  child: const Text('Seller')),
              RadioMenuButton(
                  value: 2,
                  groupValue: widget.selectRadio,
                  onChanged: (value)
                  {
                    setState(() {
                      widget.selectRadio = value!;
                      widget.registerCubit.typeUser = 1;                  });
                  },
                  child: const Text('Buyer')),
              RadioMenuButton(
                  value: 3,
                  groupValue: widget.selectRadio,
                  onChanged: (value)
                  {
                    setState(() {
                      widget.selectRadio = value!;
                      widget.registerCubit.typeUser = 3;                  });
                  },
                  child: const Text('Both')),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: ()
              {
                if(widget.registerCubit.formKey.currentState!.validate())
                {
                     widget.function();
                };
             
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: const Size(150, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSteperWidget extends StatelessWidget {
  const CustomSteperWidget({super.key, this.stepOne = false});
  final bool stepOne;
  Color color() {
    return stepOne ? ColorManager.colorPrimary : ColorManager.colorGrey;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // one
            Container(
              width: 100.w,
              height: 5.h,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: ColorManager.colorPrimary,
                  ),
                ),
                color: ColorManager.colorPrimary,
              ),
            ),
            // two
            Positioned(
              left: 100.w,
              child: Container(
                width: 150.w,
                height: 5.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: color(),
                    ),
                  ),
                  color: color(),
                ),
              ),
            ),
            // three
            Positioned(
              left: 250.w,
              child: Container(
                width: 150.w,
                height: 5.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: color(),
                    ),
                  ),
                  color: color(),
                ),
              ),
            ),

            Positioned(
              left: 90.w,
              top: -45.h,
              child: Column(
                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF1DBF73)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: ShapeDecoration(
                      color: stepOne ? ColorManager.colorPrimary : Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(width: 2, color: Color(0xFF1DBF73)),
                      ),
                    ),
                    child: Center(
                        child: stepOne
                            ? Icon(
                                Icons.done,
                                color: ColorManager.colorWhite,
                                size: 20.sp,
                              )
                            : Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.colorPrimary),
                              )),
                  ),
                ],
              ),
            ),

            Positioned(
              left: 200.w,
              top: -45.h,
              child: Column(
                children: [
                  Text(
                    "Complete Data",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: color()),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(width: 2, color: color()),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      "2",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: color()),
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
