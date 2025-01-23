import 'package:flutter/material.dart';
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

  // A sample list with both humans and animals
  List<Map<String, dynamic>> recentContacts = [
    {'name': 'Human - Christopher Rogers', 'type': 'human'},
    {'name': 'Human - Joshua Walker', 'type': 'human'},
    {'name': 'Animal - Dog', 'type': 'animal'},
    {'name': 'Animal -- Cat', 'type': 'animal'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts', style: AppStyles.fontSize16()),
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
                  onTap: () {
                    // Get.toNamed(AppRoutes.createNewChartStepTwoScreen);
                  },
                  child: Text(
                    'Add Client',
                    style: AppStyles.fontSize14(
                        color: AppColors.primaryColor, fontWeight: FontWeight.w500),
                  ),
                ),
                searchController: searchController,
              ),
              // Recent Contacts section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: recentContacts.length,
                    itemBuilder: (context, index) {
                      var contact = recentContacts[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(contact['name']),
                            trailing: SvgPicture.asset(AppIcons.rightArrow),
                            onTap: () {
                              // Navigate based on the type (human or animal)
                              if (contact['type'] == 'human') {
                                Get.toNamed(AppRoutes.clientsContactDetailsScreen);
                              } else if (contact['type'] == 'animal') {
                                Get.toNamed(AppRoutes.animalListScreen);
                              }
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
