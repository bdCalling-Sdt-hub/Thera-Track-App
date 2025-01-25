import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thera_track_app/utils/app_colors.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, dynamic>> notifications = [
    {"title": "Nur’s appointment rescheduled", "time": "2 days ago", "selected": false},
    {"title": "Nur’s appointment rescheduled", "time": "1 day ago", "selected": false},
    {"title": "You have an appointment with (client’s name)", "time": "12 hours ago", "selected": false},
    {"title": "Nur’s appointment rescheduled", "time": "Just Now", "selected": false},
    {"title": "Nur’s appointment rescheduled", "time": "2 hours ago", "selected": false},
  ];

  bool isSelectionMode = false; // Track if selection mode is active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isSelectionMode
              ? "${notifications.where((n) => n['selected']).length} Notifications"
              : "Notifications",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        leading: isSelectionMode
            ? IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            setState(() {
              isSelectionMode = false;
              _clearAllSelections();
            });
          },
        )
            : BackButton(),
        actions: isSelectionMode
            ? [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _deleteSelectedItems,
          ),
        ]
            : null,
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        itemCount: notifications.length,
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return GestureDetector(
            onLongPress: () {
              setState(() {
                isSelectionMode = true;
                notifications[index]['selected'] = true;
              });
            },
            onTap: () {
              if (isSelectionMode) {
                setState(() {
                  notifications[index]['selected'] = !notifications[index]['selected'];
                });
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: notification["selected"]
                    ? Colors.blue.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8.r),
                border: notification["selected"]
                    ? Border.all(color: AppColors.secondaryColor, width: 1)
                    : Border.all(color: AppColors.greyColor, width: 1),
              ),
              child: Row(
                children: [
                  if (isSelectionMode)
                    Icon(
                      notification['selected']
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: Colors.blue,
                    ),
                  if (isSelectionMode) SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification["title"],
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        notification["time"],
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _deleteSelectedItems() {
    setState(() {
      notifications.removeWhere((notification) => notification['selected']);
      isSelectionMode = false;
    });
  }

  void _clearAllSelections() {
    for (var notification in notifications) {
      notification['selected'] = false;
    }
  }
}


