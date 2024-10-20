
import 'package:flutter/widgets.dart';
import 'package:flutter_frontend/controllers/investment_controller.dart';
import 'package:flutter_frontend/pages/widgets/mutual_fund_tile.dart';
import 'package:get/get.dart';

class MutualFundsInvestments extends StatelessWidget {
  MutualFundsInvestments({super.key});
  final InvestmentController investmentController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: investmentController.investedMutualFundsList.length,
        itemBuilder: (context, index) {
          var fund = investmentController.investedMutualFundsList[index];
          return InvestedMutualFundTile(
            fund: fund,
          );
        },
      ),
    );
  }
}
