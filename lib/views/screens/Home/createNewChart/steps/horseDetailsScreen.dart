import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/controller/clientController/clientController.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/base/custom_button.dart';
import 'package:thera_track_app/views/base/custom_text_field.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/innerWidget/animalAdd_row.dart';
import 'package:thera_track_app/views/screens/Home/createNewChart/innerWidget/detailsRow_widget.dart';

class HorseDetailsScreen extends StatefulWidget {
  @override
  State<HorseDetailsScreen> createState() => _HorseDetailsScreenState();
}

class _HorseDetailsScreenState extends State<HorseDetailsScreen> {
  final ClientController _clientController = Get.put(ClientController());

  TextEditingController _addAnimalController = TextEditingController();
  int? selectedIndex;

  void _addAnimal() {
    setState(() {
      if (_addAnimalController.text.isNotEmpty) {
        _clientController.animals.add(_addAnimalController.text);
        _addAnimalController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text('Horse Details', style: AppStyles.fontSize16()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Horse Details
              AnimalAddDetailsRow(titelText: 'Age', controller: _clientController.age),
              AnimalAddDetailsRow(titelText: 'Breed', controller: _clientController.breed),
              AnimalAddDetailsRow(titelText: 'Gender', controller: _clientController.gender),
              AnimalAddDetailsRow(titelText: 'Height', controller: _clientController.height),
              AnimalAddDetailsRow(titelText: 'Color', controller: _clientController.color),

              // Selection Animal
              SizedBox(height: 20.h),
              Text('Select animal', style: AppStyles.fontSize16(fontWeight: FontWeight.w700)),
              SizedBox(height: 8.h),

              // Grid View for Animals (2 items per row)
            Container(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,  // 2 items per row
                  crossAxisSpacing: 2.w,
                  mainAxisSpacing: 2.h,
                  childAspectRatio: 3,
                ),
                itemCount: _clientController.animals.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedIndex = null;
                            _clientController.selectedAnimal.value = '';
                          } else {
                            selectedIndex = index;
                            _clientController.selectedAnimal.value = _clientController.animals[index]; // Update selection
                          }
                          print('Selected Animal==================>>> ${_clientController.selectedAnimal.value}');
                        });
                      },
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 1, // Border width
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _clientController.animals[index],
                            style: AppStyles.fontSize16(
                              color: isSelected ? AppColors.whiteColor : AppColors.primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),



              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextField(controller: _addAnimalController),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    height: 60.h,
                    width: 80.w,
                    child: CustomButton(onTap: _addAnimal, text: 'Add'),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // Done Button
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.createNewChartStepFourScreen);
                },
                text: 'Done',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
