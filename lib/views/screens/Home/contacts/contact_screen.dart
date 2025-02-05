import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:thera_track_app/controller/clientController/clientController.dart';
import 'package:thera_track_app/helpers/route.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';

class ContactsScreen extends StatefulWidget {
  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {

ClientController _clientController=Get.put(ClientController());

  @override
  void initState() {

WidgetsBinding.instance.addPostFrameCallback((_){
  _clientController.clientAnimalList();
 // _clientController.getClientWithAnimal('Cat');
});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts',style: AppStyles.fontSize16()),
        centerTitle: true,
      ),
      body: Obx((){
        return ListView.builder(
          itemCount: _clientController.animalList.length,
          itemBuilder: (context, index) {
            var animalName = _clientController.animalList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.contactSearchScreen,
                        parameters: {
                          "animalName": "$animalName",
                        }
                      );
                    //  _clientController.getClientWithAnimal('$animalName');
                    },
                    leading: Icon(Icons.account_circle_outlined),
                    title: Text(animalName,style: AppStyles.fontSize16()),

                  ),
                  Divider(color: AppColors.secondaryColor),
                ],
              ),
            );
          },
        );
      })
    );
  }
}