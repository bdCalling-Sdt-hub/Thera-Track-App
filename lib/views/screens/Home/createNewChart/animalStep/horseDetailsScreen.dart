

import 'package:flutter/material.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/innerWidget/detailsRow_widget.dart';

class HorseDetailsScreen extends StatefulWidget {
  @override
  State<HorseDetailsScreen> createState() => _HorseDetailsScreenState();
}

class _HorseDetailsScreenState extends State<HorseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horse Details',style: AppStyles.fontSize16()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horse Details
            DetailRow(titelText: 'Age', value: '5 years',),
            DetailRow(titelText: 'Breed', value: 'Thomas Anree',),
            DetailRow(titelText: 'Gender', value: 'Male',),
            DetailRow(titelText: 'Height', value: '5 ft',),
            DetailRow(titelText: 'Color', value: 'Black',),

            SizedBox(height: 20),
            CustomButton(onTap: (){}, text: 'Done')
          ],
        ),
      ),
    );
  }

}
