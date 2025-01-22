
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/screens/Home/chartArchive/innerWidget/chartArchive_card.dart';

class AppointmentScreen extends StatefulWidget {
  AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  // Example data for the grid items
  final List<Map<String, dynamic>> chartData = [
    {'id': 6, 'date': '15 Jan, 2025', 'name': 'Nur', 'price': 150, },
    {'id': 5, 'date': '15 Jan, 2025', 'name': 'Nur', 'price': 150, },
    {'id': 4, 'date': '15 Jan, 2025', 'name': 'Nur', 'price': 150, },
    {'id': 3, 'date': '15 Jan, 2025', 'name': 'Nur', 'price': 150, },
    {'id': 2, 'date': '15 Jan, 2025', 'name': 'Nur', 'price': 150, },
    {'id': 1, 'date': '15 Dec, 2025', 'name': 'Nur', 'price': 150,},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments',style: AppStyles.fontSize16(),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 1.5,
          ),
          itemCount: chartData.length,
          itemBuilder: (context, index) {
            final item = chartData[index];
            return InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.chartArchiveDetailsScreen,
               parameters: {"screenType": "appointmentScreen"}
                );
              },
              child: ChartCard(
                id: item['id'],
                date: item['date'],
                name: item['name'],
              ),
            );
          },
        ),
      ),
    );
  }
}


