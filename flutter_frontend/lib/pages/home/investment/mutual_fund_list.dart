
import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/controllers/investment_controller.dart';
import 'package:flutter_frontend/pages/widgets/mutual_fund_tile.dart';
import 'package:get/get.dart';

class MutualFundsList extends StatelessWidget {
  MutualFundsList({super.key});

  final MutualFundsController mutualFundsController =
      Get.put(MutualFundsController());

  @override
  Widget build(BuildContext context) {
    return mutualFundsController.searchType.value == "amc"
        ? Expanded(
                child: ListView.builder(
                  itemCount: mutualFundsController.mutualFunds.length,
                  itemBuilder: (context, index) {
                    var fund = mutualFundsController.mutualFunds[index];
                    return MutualFundsTile(
                      fund: fund,
                    );
                  },
                ),
              )
        : mutualFundsController.mutualFunds.isEmpty &&
                mutualFundsController.mutualFundInfoMessage.isEmpty
            ? const Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "GenerativeAI",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: subTextColor),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Invest In Future With Generative AI",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: subTextColor),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Risk",
                              style: TextStyle(
                                  color: subTextColor,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 20),
                          Text("Invest",
                              style: TextStyle(
                                  color: subTextColor,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(width: 20),
                          Text(
                            "Return",
                            style: TextStyle(
                                color: subTextColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            : mutualFundsController.mutualFundInfoMessage.isNotEmpty
                ? Expanded(
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: overlayColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          mutualFundsController.mutualFundInfoMessage.value,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: subTextColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: mutualFundsController.mutualFunds.length,
                      itemBuilder: (context, index) {
                        var fund = mutualFundsController.mutualFunds[index];
                        return Column(
                          children: [
                            MutualFundsTile(
                              fund: fund,
                            ),
                          ],
                        );
                      },
                    ),
                  );
  }
}
