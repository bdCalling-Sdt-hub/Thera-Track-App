import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:thera_track_app/controller/wallet/wallet_controller.dart';
import 'package:thera_track_app/service/api_constants.dart';
import 'package:thera_track_app/utils/app_colors.dart';
import 'package:thera_track_app/utils/style.dart';
import 'package:thera_track_app/views/screens/Home/wallet/innerWidget/costDetailsWidget.dart';

class CostDetailsScreen extends StatefulWidget {
  @override
  State<CostDetailsScreen> createState() => _CostDetailsScreenState();
}

class _CostDetailsScreenState extends State<CostDetailsScreen> {
  TextEditingController emailController = TextEditingController();
  WalletController walletController = Get.put(WalletController());

  Future<void> _generateAndSendPDF() async {final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text("Cost Review", style: pw.TextStyle(fontSize: 24)),
              pw.SizedBox(height: 10),
              _buildCostDetailsPdf(),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/cost_details.pdf");
    await file.writeAsBytes(await pdf.save());

    await _sendEmailWithPDF(file.path);
  }

  pw.Widget _buildCostDetailsPdf() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text("Departure: Rangpur 2"),
        pw.Text("Destination: Dhaka"),
        pw.Text("Distance: 200 Km"),
        pw.Text("Food: 200 \$"),
        pw.Text("Gas: 200 \$"),
        pw.Text("Other: 200 \$"),
      ],
    );
  }

  Future<void> _sendEmailWithPDF(String filePath) async {
    final Email email = Email(
      body: 'Attached is your cost details.',
      subject: 'Cost Details PDF',
      recipients: [emailController.text],
      attachmentPaths: [filePath],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Mail Done")));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Mail Failed: $error")));
      print("Mail Failed===================>>>: $error");
    }
  }
  var travelID = Get.arguments;

  @override
  void initState() {
    super.initState();
    walletController.getOneCostDetails(travelID);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text('Cost', style: AppStyles.fontSize16(color: AppColors.color575757)),
        centerTitle: true,
      ),
      body: Obx(() {
      return walletController.isLoading.value
          ? Center(child: CupertinoActivityIndicator(radius: 32.r, color: CupertinoColors.activeBlue))
          :  Obx(() {
        var displayData = walletController.getOnelWalletDetails.value;

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CostDetailsWidget(title: 'Departure', value: displayData.departure ?? 'N/A'),
                CostDetailsWidget(title: 'Destination', value: displayData.destination.toString() ?? 'N/A'),
                CostDetailsWidget(title: 'Distance', value: displayData.distance.toString() ?? 'N/A'),
                CostDetailsWidget(title: 'Food',value: displayData.food.toString() ?? 'N/A'),
                CostDetailsWidget(title: 'Gas', value: displayData.gas.toString() ?? 'N/A'),
                CostDetailsWidget(title: 'Other', value: displayData.other.toString() ?? 'N/A'),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.w),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 250.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: CachedNetworkImage(
                          imageUrl: (displayData.receiptImages != null)
                              ? "${ApiConstants.imageBaseUrl}${displayData.receiptImages}"
                              : 'assets/images/image_placeHolder.png',
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Image.asset('assets/images/image_placeHolder.png'),
                        ),
                      ),
                    )
                  ),
                ),
                _buildEmailInputSection(),
              ],
            ),
          )
      );
    });
  })

  );
}
  Widget _buildEmailInputSection() {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: AppColors.secondaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Enter email here',
              hintStyle: AppStyles.fontSize14(color: AppColors.greyColor),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text('Data will be sent to the email above.', style: TextStyle(color: AppColors.blackColor)),
          SizedBox(height: 16.h),
          Center(
            child: SizedBox(
              width: 194.w,
              child: ElevatedButton.icon(
                onPressed: _generateAndSendPDF,
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
    );
  }
}
