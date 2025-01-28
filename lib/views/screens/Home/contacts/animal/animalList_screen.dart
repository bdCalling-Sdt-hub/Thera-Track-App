import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/innerWidget/customHeaderWithSearch_widget.dart';

class AnimalListScreen extends StatefulWidget {
  const AnimalListScreen({super.key});

  @override
  _AnimalListScreenState createState() => _AnimalListScreenState();
}

class _AnimalListScreenState extends State<AnimalListScreen> {
  TextEditingController searchController = TextEditingController();

  // A sample list with both humans and animals
  List<Map<String, dynamic>> recentContacts = [

    {'name': 'Animal - Dog', },
    {'name': 'Animal -- Cat', },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal List', style: AppStyles.fontSize16()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
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
                        Get.toNamed(AppRoutes.animalContactDetailsScreen);
                    },
                  ),
                  Divider(color: AppColors.secondaryColor),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
