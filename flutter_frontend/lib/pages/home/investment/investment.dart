
import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/pages/home/investment/explore_funds.dart';
import 'package:flutter_frontend/pages/home/investment/mutual_fund_list.dart';

class SpitInvestment extends StatelessWidget {
  const SpitInvestment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExploreFunds(),
            const SizedBox(height: 10),
            MutualFundsList()
          ],
        ),
      ),
    );
  }
}
