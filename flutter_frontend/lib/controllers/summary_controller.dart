
import 'package:flutter_frontend/controllers/transaction_controller.dart';
import 'package:get/get.dart';

class SummaryController extends GetxController {
  final profileSummary = '''
The financial portfolio presents a diversified strategy aimed at achieving long-term growth and stability, comprising 60% equities, 30% fixed income, and 10% alternative investments. The equity segment, which includes a mix of domestic and international stocks across various sectors, has delivered a year-to-date return of 12%. The fixed income portion, consisting mainly of high-quality corporate and government bonds, offers an average yield of 4%, ensuring steady income and capital preservation. Additionally, the alternative investments, including real estate investment trusts (REITs) and commodities, have yielded an 8% return, providing further diversification and inflation protection. Overall, the portfolio's total return stands at 10% for the year, outperforming the benchmark by 2%, with plans to continue reallocating resources to capitalize on emerging market trends and maintain alignment with financial goals.
'''.obs;
  final ChartsController chartsController = Get.put(ChartsController());

  @override
  void onClose() {
    super.onClose();
    profileSummary.value = '';
    chartsController.dispose();
  }

 
}
