import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:thera_track_app/controller/clientController/clientController.dart';
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
  ClientController _clientController=Get.put(ClientController());

  var parameter = Get.parameters;

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_){
       _clientController.getAllClientInfo();
    });
    // TODO: implement initState
    super.initState();
  }
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
              Obx((){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _clientController.getClientInfoModel.length,
                      itemBuilder: (context, index) {
                        var displayData =  _clientController.getClientInfoModel[index];
                        return Column(
                          children: [
                            ListTile(
                              title: Text('${displayData.name}'),
                              trailing: SvgPicture.asset(AppIcons.rightArrow),
                              onTap: () {

                                // Navigate based on the type (human or animal)
                              if (displayData.humanClient == true) {
                                Get.toNamed(AppRoutes.clientsContactDetailsScreen,
                                parameters: {
                                  "clientId": '${displayData.id}',
                                }
                                );
                              } else if ((displayData.humanClient == false)) {
                                Get.toNamed(AppRoutes.animalListScreen,
                                    parameters: {
                                      "clientId": '${displayData.id}',
                                    }
                                );
                              }
                              },
                            ),
                            Divider(color: AppColors.secondaryColor),
                          ],
                        );
                      },
                    ),
                  ],
                );
              }),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
