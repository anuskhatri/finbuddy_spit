
import 'package:dio/dio.dart';
import 'package:flutter_frontend/controllers/transaction_controller.dart';
import 'package:get/get.dart';

class SummaryController extends GetxController {
  final profileSummary = ''.obs;
  final loading = false.obs; // Add this line
  final ChartsController chartsController = Get.put(ChartsController());

  @override
  void onClose() {
    super.onClose();
    profileSummary.value = '';
    chartsController.dispose();
  }

 
}
