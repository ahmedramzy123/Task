
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:taskkafille/core/utils/color_manager/color_manager.dart';
import 'package:taskkafille/core/utils/style_font_manager/style_manager.dart';
import 'package:taskkafille/featuere/coutery/presentation/view_model/cubit/country_cubit.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CountryCubit.get(context).getCountry(1);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryCubit,CountryState>(
      listener: (context, state) {},
      builder:  (context, state) {
        return Scaffold(
            backgroundColor: Colors.white.withOpacity(0.95),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 83.h),
                  child: Text(
                    'Countries',
                    style: getBoldStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                (state is GetCountryLoading)?Center(child: CircularProgressIndicator())
                    :(CountryCubit.get(context).countryModel!=null)?SizedBox(
                  height: 200.h,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 21.w, right: 21.w, top: 35.h),
                      child: DataTable(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: ColorManager.colorWhite,
                          ),
                          //border: TableBorder.all(width: 1),
                          columns: <DataColumn>[
                            DataColumn(
                              label: Text(
                                textAlign: TextAlign.center,
                                'Country',
                                style: getBoldStyle(
                                    color: ColorManager.colorGrey2, fontSize: 12),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Capital',
                                style: getBoldStyle(
                                    color: ColorManager.colorGrey2, fontSize: 12),
                              ),
                              numeric: true,
                            ),
                          ],
                          dataTextStyle: getLight2Style(
                              color: ColorManager.colorBlack, fontSize: 12),
                          rows: List.generate(
                            CountryCubit.get(context).countryModel!.data!.length,
                                (index) => DataRow(
                              cells: <DataCell>[
                                DataCell(Text(CountryCubit.get(context).countryModel!.data![index].name!)),
                                DataCell(Text(CountryCubit.get(context).countryModel!.data![index].capital!)),
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                ):
                (state is GetCountryFailure)? const Center(child: Text('No Data'),):const Center(child: Text('No Data')),
                Spacer(),

                NumberPagination(
                  controlButton: Container(
                    color: ColorManager.colorPrimary,
                    // colorIcon: ColorManager.colorWhite,
                    // iconNext: Icons.arrow_forward_ios,
                    // iconPrevious: Icons.arrow_back_ios,
                  ),
                  onPageChanged: (int pageNumber) {
                    //do somthing for selected page
                    setState(() {
                      CountryCubit.get(context).getCountry(pageNumber);
                    });
                  },
                  // iconNext: SvgPicture.asset(
                  // AssetsManager.NEXT,
                  //   color: ColorManager.colorWhite,
                  // ),
                  // iconPrevious: SvgPicture.asset(
                  //   AssetManager.PREVIOUS,
                  //   color: ColorManager.colorWhite,
                  // ),
                  pageTotal: CountryCubit.get(context).countryModel!.pagination!.totalPages!,
                  pageInit: 1,
                  // picked number when init page
                  colorPrimary: ColorManager.colorPrimary,
                  colorSub: ColorManager.colorWhite,
                ),
              ],
            ));
      },
    );
  }
}
