import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';

class ContactsScreen extends StatelessWidget {
  final List<String> contacts = ['Clients', 'Horse', 'Dog'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts',style: AppStyles.fontSize16()),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.contactSearchScreen);
                  },
                  leading: Icon(Icons.account_circle_outlined),
                  title: Text(contacts[index],style: AppStyles.fontSize16()),

                ),
                Divider(color: AppColors.secondaryColor),
              ],
            ),
          );
        },
      ),
    );
  }
}