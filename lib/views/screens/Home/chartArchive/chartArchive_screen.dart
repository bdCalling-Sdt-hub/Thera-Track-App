
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/screens/Home/chartArchive/innerWidget/chartArchive_card.dart';

class ChartArchiveScreen extends StatefulWidget {
  ChartArchiveScreen({Key? key}) : super(key: key);

  @override
  State<ChartArchiveScreen> createState() => _ChartArchiveScreenState();
}

class _ChartArchiveScreenState extends State<ChartArchiveScreen> {
  // Example data for the grid items
  final List<Map<String, dynamic>> chartData = [
    {'id': 6, 'date': '14 Jan, 2025', 'name': 'Nur', 'price': 150, 'paidStatus': true},
    {'id': 5, 'date': '14 Jan, 2025', 'name': 'Nur', 'price': 150, 'paidStatus': false},
    {'id': 4, 'date': '14 Jan, 2025', 'name': 'Nur', 'price': 150, 'paidStatus': false},
    {'id': 3, 'date': '14 Jan, 2025', 'name': 'Nur', 'price': 150, 'paidStatus': true},
    {'id': 2, 'date': '14 Jan, 2025', 'name': 'Nur', 'price': 150, 'paidStatus': true},
    {'id': 1, 'date': '14 Dec, 2024', 'name': 'Nur', 'price': 150, 'paidStatus': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart Archive',style: AppStyles.fontSize16(),),
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
                    parameters: {"screenType": "chartArchiveScreen"}
                );
              },
              child: ChartCard(
                id: item['id'],
                date: item['date'],
                name: item['name'],
                price: item['price'],
                paidStatus: item['paidStatus'],
              ),
            );
          },
        ),
      ),
    );
  }
}


