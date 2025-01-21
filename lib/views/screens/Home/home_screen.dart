import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/gridview_tile.dart';
import 'package:thera_track_app/views/screens/Home/appDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Key for the scaffold

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: SvgPicture.asset('assets/icons/image.svg'),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Good Evening',
                    style: AppStyles.fontSize14(color: AppColors.whiteColor),
                  ),
                  Text(
                    'Setup Your Account',
                    style: AppStyles.fontSize16(color: AppColors.whiteColor,fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            GridViewTile(
              child: SvgPicture.asset( AppIcons.newChart),
              label: 'Create New Chart',
              onTap: () {
                Get.toNamed(AppRoutes.createNewChartStepOneScreen);

              },
            ),
            GridViewTile(
              child: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text('01', style: TextStyle(fontSize: 18.sp)),
                ),
              ),
              label: 'Notification',
              onTap: () {},
            ),
            GridViewTile(
              child: SvgPicture.asset( AppIcons.chartArchive),
              label: 'Chart Archive',
              onTap: () {},
            ),
            GridViewTile(
              child: SvgPicture.asset( AppIcons.contactIcon),
              label: 'Contacts',
              onTap: () {},
            ),
            GridViewTile(
              child: SvgPicture.asset( AppIcons.appointmentIcon),
              label: 'Appointments',
              onTap: () {},
            ),
            GridViewTile(
              child: SvgPicture.asset( AppIcons.offlineIcon),
              label: 'Offline Files',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
