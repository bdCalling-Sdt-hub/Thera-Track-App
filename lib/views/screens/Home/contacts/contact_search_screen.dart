import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/innerWidget/customHeaderWithSearch_widget.dart';

class ContactSearchScreen extends StatefulWidget {
  const ContactSearchScreen({super.key});

  @override
  _ContactSearchScreenState createState() => _ContactSearchScreenState();
}

class _ContactSearchScreenState extends State<ContactSearchScreen> {
  TextEditingController searchController = TextEditingController();

  List<String> recentClients = [
    'Christopher Rogers',
    'Joshua Walker',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clients',style: AppStyles.fontSize16(),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomHeaderWithSearch(
                  titleText: 'Clients',
                  actionChild: InkWell(
                      onTap: (){
                       // Get.toNamed(AppRoutes.createNewChartStepTwoScreen);
                      },
                      child: Text('Add Client',style: AppStyles.fontSize14(color: AppColors.primaryColor,fontWeight: FontWeight.w500))),
                  searchController: searchController),
              // Recent Clients section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: recentClients.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(recentClients[index]),
                            trailing: SvgPicture.asset(AppIcons.rightArrow),
                            onTap: () {
                              Get.toNamed(AppRoutes.contactDetailsScreen);
                            },
                          ),
                          Divider(color: AppColors.secondaryColor),
                        ],
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
