import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/utils/style.dart';

class CreateNewChartStepOneScreen extends StatefulWidget {
  @override
  _CreateNewChartStepOneScreenState createState() => _CreateNewChartStepOneScreenState();
}

class _CreateNewChartStepOneScreenState extends State<CreateNewChartStepOneScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> recentClients = [
    'Christopher Rogers',
    'Joshua Walker',
    'Richard Turner',
    'Richard Turner',
    'Richard Turner'
  ];
  List<String> allClients = [
    'Christopher Rogers',
    'Joshua Walker',
    'Thomas Lee',
    'Steven Reed',
    'Richard Turner',
    'Richard Turner',
    'Richard Turner',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step 1',style: AppStyles.fontSize16(),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Search field
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20),
        
              // Recent Clients section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Clients',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
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
                              // Handle client selection
                            },
                          ),
                          Divider(color: AppColors.colorBADEFB),
                        ],
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
        
              // All Clients section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50.h,
                    color: AppColors.colorBADEFB,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'All Clients',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: allClients.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(allClients[index]),
                            trailing: SvgPicture.asset(AppIcons.rightArrow),
                            onTap: () {
                              // Handle client selection
                            },
                          ),
                          Divider(color: AppColors.colorBADEFB),
                        ],
                      );

                    },
                ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
