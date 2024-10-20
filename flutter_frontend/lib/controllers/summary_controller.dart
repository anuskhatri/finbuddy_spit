
import 'package:flutter_frontend/controllers/transaction_controller.dart';
import 'package:get/get.dart';

class SummaryController extends GetxController {
  final profileSummary = ''.obs;
  final ChartsController chartsController = Get.put(ChartsController());

  @override
  void onClose() {
    super.onClose();
    profileSummary.value = '';
    chartsController.dispose();
  }

 
}
