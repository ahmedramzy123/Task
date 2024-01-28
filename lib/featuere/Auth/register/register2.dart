import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskkafille/featuere/Auth/register/presentaion/register_cubit/cubit/register_cubit.dart';
import 'package:taskkafille/sl.dart';

import '../../layout/home_layout.dart';

class RegisterScreen2 extends StatefulWidget 
{
   const RegisterScreen2({super.key , required this.registerCubit , 
  required this.function
   });
  final RegisterCubit registerCubit;
  final Function function;

  @override
  State<RegisterScreen2> createState() => _RegisterScreen2State();
}

class _RegisterScreen2State extends State<RegisterScreen2> {
  int?  selectRadio;
  bool face=false;
  bool twitter=false;
  bool instegram=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     selectRadio = 0;
  }
  @override

  Widget build(BuildContext context)
  {
    return   BlocConsumer<RegisterCubit,RegisterState>(
        listener: (context,state){},
      builder: (context,state)
      {
        return  Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),

              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('About'
                    ,style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500 ,
                        color: Color(0xff696F79)),)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3,left: 15,right:15 ),
              child: TextFormField(
                validator: (value)
                {
                  if (value!.isEmpty) {
                    return 'Please enter your last name';
                  }
                  if (value.length > 1000) {
                    return 'Last name should not exceed 1000 characters';
                  }
                  return null;
                },
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

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),

              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Salary'
                    ,style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500 ,
                        color: Color(0xff696F79)),)),
            ),
            Container(
              width: 334,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xffF9F9F9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(onPressed: ()
                    {
setState(() {
  RegisterCubit.get(context).minesCount();

});
                    }, icon: Icon(Icons.remove,color: Colors.green,)),
                  ),
                  Text('SAR ٌ${RegisterCubit.get(context).count}'),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(onPressed: ()
                    {
                      setState(() {
                        RegisterCubit.get(context).addCount();

                      });
                    }, icon: Icon(Icons.add,color: Colors.green,)),
                  ),


                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),

              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Birth Date'
                    ,style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500 ,
                        color: Color(0xff696F79)),)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3,left: 15,right:5 ),
              child: TextField(
                onTap: ()
                {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2025),
                  ).then((value) {
                    // value == null
                    //     ? toController.text = ""
                    //     : toController.text =
                    //     value.toString().substring(0, 10);
                  });
                },
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
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),

              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Gender'
                    ,style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500 ,
                        color: Color(0xff696F79)),)),
            ),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  RadioMenuButton(
                      value: 1,
                      groupValue:selectRadio ,
                      onChanged: ( value)
                      {
                        setState(() {
                          selectRadio=value;
                        });

                      },
                      child: const Text('Male')),
                  RadioMenuButton(
                      value:2 ,
                      groupValue:selectRadio ,
                      onChanged: (value)
                      {
                        setState(() {
                          selectRadio=value;
                        });

                      },
                      child: const Text('Female')),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),

              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Skills'
                    ,style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500 ,
                        color: Color(0xff696F79)),)),
            ),
            Container(
              width: 137,
              height: 34,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              decoration: ShapeDecoration(
                color: const Color(0xFFE9F9F1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
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
                    child: Stack(children: [

                    ]),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),

              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text('Favourite Social Media'
                    ,style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500 ,
                        color: Color(0xff696F79)),)),
            ),
            Row(
              children: [
                Checkbox(value: face, onChanged: (value)
                {
                  setState(() {
                    face=value!;
                  });
                },
                ),

                const CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage('assets/image/face.png'),
                ),
                const SizedBox(width: 5,
                ),
                Text('Facebook'),
              ],
            ),
            Row(
              children: [
                Checkbox(value: twitter, onChanged: (value)
                {
                  setState(() {
                    twitter=value!;
                  });
                }),
                const CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage('assets/image/twitter.png'),
                ),
                const SizedBox(width: 5,
                ),
                const Text('Tiwtter'),
              ],
            ),
            Row(
              children: [
                Checkbox(value: instegram, onChanged: (value)
                {
                  setState(() {
                    instegram=value!;
                  });
                }),
                const CircleAvatar(
                  radius: 10,
                  backgroundImage: AssetImage('assets/image/linkedin.png'),
                ),
                const SizedBox(width: 5,
                ),
                const Text('LinkedIn'),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
              [
                TextButton(onPressed: ()
                {
                  // print("Amr");
                  widget.function();
                }, child: const Text("Back")),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Layout()));
                },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize:  Size(335.w, 56.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ), child:  Text("Submit",style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),),),
              ],),
            const SizedBox(height: 50,)




          ],
        );
      },

    );
  }
}