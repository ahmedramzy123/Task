import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taskkafille/core/utils/color_manager/color_manager.dart';
import 'package:taskkafille/core/utils/style_font_manager/style_manager.dart';
import 'package:taskkafille/featuere/services_screen/presentation/view/services_widgets/service_item.dart';

import '../view_model/cubit/sercice_cubit.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ServiceCubit.get(context).getServices();
    ServiceCubit.get(context).getPopularServices();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServiceCubit,SerciceState>(
      listener: (context,state){},
      builder: (context,state)
      {
        ServiceCubit cubit =  ServiceCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white.withOpacity(0.92),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 83.h),
                child: Text('Services',
                    style:
                    getBoldStyle(color: ColorManager.colorBlack, fontSize: 18)),
              ),
              (state is GetServicesLoading)?Padding(
                padding: EdgeInsets.only(
                  top: 35.h,
                  left: 21.w,
                ),
                child: SizedBox(
                  height: 192.h,
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: ServiceItem(
                          image:'',
                          description: '',
                          price: '',
                          rate: '',
                          cartNumber: '',
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 14.w,
                    ),
                    itemCount: 5 ,
                  ),
                ),
              )
                  : (cubit.serviceModel!=null)?Padding(
                padding: EdgeInsets.only(
                  top: 35.h,
                  left: 21.w,
                ),
                child: SizedBox(
                  height: 192.h,
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ServiceItem(
                        image:cubit.serviceModel!.data![index].mainImage!,
                        description: cubit.serviceModel!.data![index].title!,
                        price: cubit.serviceModel!.data![index].price.toString(),
                        rate: cubit.serviceModel!.data![index].averageRating.toString(),
                        cartNumber: cubit.serviceModel!.data![index].completedSalesCount.toString(),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 14.w,
                    ),
                    itemCount: cubit.serviceModel!.data!.length,
                  ),
                ),
              ):
              (state is GetServicesFailure)?Center(child: Text("error")):SizedBox(),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 83.h),
                child: Text('Popular Services',
                    style:
                    getBoldStyle(color: ColorManager.colorBlack, fontSize: 18)),
              ),
              (state is GetPopularServicesLoading)?Padding(
                padding: EdgeInsets.only(
                  top: 35.h,
                  left: 21.w,
                ),
                child: SizedBox(
                  height: 192.h,
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: ServiceItem(
                          image:'',
                          description: '',
                          price: '',
                          rate: '',
                          cartNumber: '',
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 14.w,
                    ),
                    itemCount: 5,
                  ),
                ),
              ):
              (cubit.popularServiceModel!=null)?
              Padding(
                padding: EdgeInsets.only(
                  top: 35.h,
                  left: 21.w,
                ),
                child: SizedBox(
                  height: 192.h,
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ServiceItem(
                        image:cubit.popularServiceModel!.data![index].mainImage!,
                        description: cubit.popularServiceModel!.data![index].title!,
                        price: cubit.popularServiceModel!.data![index].price.toString(),
                        rate: cubit.popularServiceModel!.data![index].averageRating.toString(),
                        cartNumber: cubit.popularServiceModel!.data![index].completedSalesCount.toString(),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 14.w,
                    ),
                    itemCount: cubit.popularServiceModel!.data!.length,
                  ),
                ),
              ):(state is GetPopularServicesFailure)?const Center(child: Text("error")):const SizedBox(),
            ],
          ),
        );
      },

    );
  }
}
