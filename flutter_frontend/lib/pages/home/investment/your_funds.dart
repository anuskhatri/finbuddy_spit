
import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/controllers/investment_controller.dart';
import 'package:flutter_frontend/pages/home/investment/invested_mutual_funds.dart';
import 'package:flutter_frontend/pages/home/investment/invested_stocks.dart';
import 'package:flutter_frontend/pages/home/investment/profit_loss.dart';
import 'package:get/get.dart';

class YourFunds extends StatelessWidget {
  const YourFunds({super.key});

  @override
  Widget build(BuildContext context) {
    final InvestmentController investmentController = Get.find();
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            PAndL(),
            const SizedBox(
              height: 5,
            ),
            Obx(() {
              String selectedInvestmentType =
                  investmentController.selectedInvestment.value;

              return selectedInvestmentType == "Stock"
                  ? StocksInvestment()
                  : MutualFundsInvestments();
            }),
          ],
        ),
      ),
    );
  }
}
