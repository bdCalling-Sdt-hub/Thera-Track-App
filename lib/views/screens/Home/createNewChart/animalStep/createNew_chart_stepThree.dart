import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/innerWidget/customHeaderWithSearch_widget.dart';

class CreateNewChartStepThreeScreen extends StatefulWidget {
  @override
  _CreateNewChartStepThreeScreenState createState() => _CreateNewChartStepThreeScreenState();
}

class _CreateNewChartStepThreeScreenState extends State<CreateNewChartStepThreeScreen> {
  TextEditingController searchController = TextEditingController();

  List<String> horseList = [
    'Amigo',
    'Blaze',
    'Thunder',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step 3',style: AppStyles.fontSize16(),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(

            children: [
              CustomHeaderWithSearch(
                titleText: 'Horse',
                actionChild: InkWell(
                    onTap: (){
                    Get.toNamed(AppRoutes.createNewChartStepTwoScreen);
                    },
                    child: Row(
                      children: [
                        Text('Add Horse'),
                        SizedBox(width: 4.w),
                        Icon(Icons.add,size: 15.sp),
                      ]

                    )),
                searchController: searchController),

              // Recent Clients section
              SizedBox(height: 10.h),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: horseList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(horseList[index]),
                            SizedBox(width: 8.w),

                            Row(
                              children: [
                                Text('Previous Chart :',style: AppStyles.fontSize12()),
                                Text('15 Jan,2025',style: AppStyles.fontSize12(color: AppColors.redColor)),
                              ],
                            ),

                          ],
                        ),
                        trailing: SvgPicture.asset(AppIcons.rightArrow),
                        onTap: () {
                          // Get.toNamed(AppRoutes.horseDetailsScreen);
                           Get.toNamed(AppRoutes.createNewChartStepFourScreen);
                        },
                      ),
                      Divider(color: AppColors.secondaryColor),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
