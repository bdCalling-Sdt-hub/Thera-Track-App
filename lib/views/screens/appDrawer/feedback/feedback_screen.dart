import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback',style: AppStyles.fontSize16(),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: AppColors.secondaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Give Feedback',
                    style: AppStyles.fontSize20()
                  ),
                  SizedBox(height: 10.h),
                  Text('What do you think of the app?', style: AppStyles.fontSize16()),
                  SizedBox(height: 20.h),
                  // Emoji Rating Section
                  EmojiFeedback(
                initialRating: 2,
                animDuration: const Duration(milliseconds: 300),
                curve: Curves.bounceIn,
                inactiveElementScale: .5,
                onChanged: (value) {

                },
                onChangeWaitForAnimation: true,
                // Other parameters
              ),


                  SizedBox(height: 20),
                  // Text Field for Feedback
                  TextField(
                    controller: _feedbackController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Write your feedback here...',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.secondaryColor)),
                      focusedBorder: UnderlineInputBorder( borderSide: BorderSide(color: AppColors.secondaryColor)),
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: SizedBox(
                      width: 194.w,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.send, color: AppColors.whiteColor),
                        label: Text('Send', style: TextStyle(color: AppColors.whiteColor)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
