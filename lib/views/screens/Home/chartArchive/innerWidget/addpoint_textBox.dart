import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/app_icons.dart';

class TextBoxList extends StatefulWidget {
  @override
  _TextBoxListState createState() => _TextBoxListState();
}

class _TextBoxListState extends State<TextBoxList> {
  // List to store all TextBox widgets
  List<Widget> textBoxes = [];

  void addTextBox() {
    setState(() {
      int newIndex = textBoxes.length;
      textBoxes.add(TextBox(index: newIndex, onRemove: removeTextBox));
    });
  }

  // Function
  void removeTextBox(int index) {
    setState(() {
      textBoxes.removeAt(index);
      for (int i = 0; i < textBoxes.length; i++) {
        (textBoxes[i] as TextBox).setIndex(i);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with the "Add Point" button
          Container(
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,

            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Add Point'),
                  InkWell(
                    onTap: () {
                      addTextBox();
                    },
                    child: SvgPicture.asset(AppIcons.addIcon),
                  ),
                ],
              ),
            ),
          ),
          // Displaying the list of TextBox widgets
          Center(
            child: Column(
              children: textBoxes.isEmpty
                  ? [Text('No text point yet added')]
                  : textBoxes,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class TextBox extends StatefulWidget {
  final int index;
  final Function(int) onRemove;

  TextBox({required this.index, required this.onRemove});

  @override
  _TextBoxState createState() => _TextBoxState();

  void setIndex(int i) {}
}

class _TextBoxState extends State<TextBox> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = widget.index;
  }

  void setIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
    color: AppColors.secondaryColor
    ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: '${index + 1}. Text', // Hint text
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.whiteColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.whiteColor),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          widget.onRemove(index);
                        },
                        child: SvgPicture.asset(AppIcons.removeIcon),
                      ),
                    ),
                  ],
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
