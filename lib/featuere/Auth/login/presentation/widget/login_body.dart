import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskkafille/core/cashhelper/cashhelper.dart';
import 'package:taskkafille/core/utils/color_manager/color_manager.dart';
import 'package:taskkafille/core/utils/style_font_manager/style_manager.dart';
import 'package:taskkafille/featuere/Auth/login/presentation/login_screen.dart';
import 'package:taskkafille/featuere/Auth/login/view_model/cubit/auth_login.dart';
import 'package:taskkafille/featuere/Auth/login/view_model/cubit/authstate.dart';
import '../../../../../core/utils/toast/toast.dart';
import '../../../../../sl.dart';
import '../../../../layout/home_layout.dart';
import '../../../register/presentaion/register.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
class LoginBody extends StatelessWidget {
   LoginBody({super.key});

  var fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: fromKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/image/Login-cuate 1.png"),
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),

              child:  Align(
                  alignment: Alignment.topLeft,
                  child: Text('Email Address'
                    ,style: getLight2Style(
                        fontSize: 12.sp,
                        color:  ColorManager.colorGrey2),)
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 3.h,left: 15.w,right:15.w),
              child: TextFormField(
                controller: LoginCubit.get(context).emailController,
                validator: (value){
                  if(value!.isEmpty)
                  {
                    return 'Email must not be empty';
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
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),

              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Password'
                    ,style:  getLight2Style(
                        fontSize: 12.sp,
                        color:  ColorManager.colorGrey2),)),
            ),
            BlocConsumer<LoginCubit,AuthState>(
              listener: (context,state){},
              builder: (context,state)
              {
               return Padding(
                  padding: const EdgeInsets.only(top: 3,left: 15,right:15 ),
                  child: TextFormField(
                    obscureText: LoginCubit.get(context).obSecure,
                    controller: LoginCubit.get(context).passwordController,
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Password must not be empty';
                      }else if (value.length<8)
                      {
                        return 'Password must not be at Least 8';

                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: const Color(0xffF9F9F9),
                      filled: true,
                      suffixIcon:  IconButton(
                          icon:LoginCubit.get(context).icon ,
                          onPressed: ()
                      {
                        LoginCubit.get(context).changeObSecurePassword();
                      }),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                );
              },

            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value){},checkColor: Colors.green,),
                const Text('Remember me',style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500 ,
                    color: Color(0xff696F79)),),
                const Spacer(),
                TextButton(onPressed: (){}, child: const Text('Forget Password ?',style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500 ,
                    color: Color(0xff696F79)),))
              ],
            ),

            BlocConsumer<LoginCubit,AuthState>(
              listener: (context,state)
              {
                if(state is LoginLoading)
                {
                  EasyLoading.show(status: 'Loading');
                }
                if(state is LoginSuccess)
                  {
                    showFlutterToast(message: 'Login Success', state: ToastState.SUCCESS);
                    EasyLoading.dismiss();
                    CacheHelper.put(key: 'token', value: state.userModel.accessToken);

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Layout()));
                  }if(state is LoginFailure)
                {
                  showFlutterToast(message: state.message, state: ToastState.ERROR);
                  EasyLoading.dismiss();

                }
              },
              builder: (context,state){
                return  ElevatedButton(onPressed: ()
                {
                  if(fromKey.currentState!.validate())
                  {
                    LoginCubit.get(context).loginMethod();
                  }
                  else
                  {
                    print('Not Valid');
                  }
                },

                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    minimumSize: const Size(343, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text("Login",style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),),);
              },
            ),

            Padding(

              padding:  EdgeInsets.symmetric(horizontal: 50.w,vertical: 10.h),
              child: Row(
                children: [
                   Text('Don\'t have an account ?',style:
              getLight2Style(
                  fontSize: 14.sp,
                  color:  ColorManager.colorGrey2),),
                  TextButton(onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                  },
                      child:  Text('Register',
                        style:  getLight2Style(
                            fontSize: 14.sp,
                            color:  Colors.green),
                      )),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
