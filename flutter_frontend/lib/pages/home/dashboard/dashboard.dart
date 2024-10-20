import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/controllers/summary_controller.dart';
import 'package:flutter_frontend/controllers/transaction_controller.dart';
import 'package:flutter_frontend/pages/home/dashboard/balance.dart';
import 'package:flutter_frontend/pages/home/dashboard/chat_bot.dart';
import 'package:flutter_frontend/pages/home/dashboard/header.dart';
import 'package:flutter_frontend/pages/home/dashboard/linked_accounts.dart';
import 'package:flutter_frontend/pages/home/dashboard/overall_investment.dart';
import 'package:flutter_frontend/pages/home/dashboard/portfolio_summary.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:get/get.dart';

class SpitDashboard extends StatefulWidget {
  const SpitDashboard({super.key});

  @override
  State<SpitDashboard> createState() => _SpitDashboardState();
}

class _SpitDashboardState extends State<SpitDashboard> {
  final ChartsController chartsController = Get.put(ChartsController());
  final SummaryController summaryController = Get.put(SummaryController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpitHeader(),
          const SizedBox(
            height: 30,
          ),
          LinkedAccounts(),
          const SizedBox(
            height: 30,
          ),
          YourBalance(),
          const SizedBox(
            height: 30,
          ),
          OverallInvestment(),
          const SizedBox(
            height: 30,
          ),
          Gauge(),
          const SizedBox(
            height: 30,
          ),
          const ChatBot(),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              onPressed: () {
                Get.to(() => PortfolioSummary());
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: const Text(
                  "Generate Portfolio Summary",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            indent: MediaQuery.of(context).size.width * 0.05,
            endIndent: MediaQuery.of(context).size.width * 0.05,
            color: Colors.grey,
            thickness: 0.5,
          ),
          Container(
            alignment: Alignment.center,
            child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    ));
  }
}

class Gauge extends StatelessWidget {
  const Gauge({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 120,
      child: AnimatedRadialGauge(
        duration: Duration(seconds: 1),
        curve: Curves.elasticOut,
        radius: 100,
        value: 80,
        axis: GaugeAxis(
          min: 0,
          max: 100,
          degrees: 180,
          style: GaugeAxisStyle(
            thickness: 20,
            background: Color(0xFFDFE2EC),
            segmentSpacing: 4,
          ),
          pointer: GaugePointer.needle(
            width: 16,
            borderRadius: 16,
            color: primaryColor,
            height: 16,
          ),
          progressBar: GaugeProgressBar.rounded(
            color: Color(0xFFB4C2F8),
          ),
          segments: [
            GaugeSegment(
              from: 0,
              to: 33.3,
              color: Color(0xFFD9DEEB),
              cornerRadius: Radius.zero,
            ),
            GaugeSegment(
              from: 33.3,
              to: 66.6,
              color: Color(0xFFD9DEEB),
              cornerRadius: Radius.zero,
            ),
            GaugeSegment(
              from: 66.6,
              to: 100,
              color: Color(0xFFD9DEEB),
              cornerRadius: Radius.zero,
            ),
          ],
        ),
      ),
    );
  }
}
