import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/pages/home/goal_tracking/goal_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample static data
    final Map<String, dynamic> goalData = {
      "goal_amount": 100000,
      "time_frame": 365,
      "bank_balance": 50000,
      "pending_loan": 15000,
      "month_income": 30000,
      "net_savings": 20000,
      "interval": "monthly",
      "saving_needed_excluding_all": 5000,
      "saving_needed_considering_all": 6000,
      "message": "You are on track to achieve your goal!"
    };

    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: overlayColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Summary",
                      style: TextStyle(
                          color: subTextColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Target Amount",
                              style: TextStyle(
                                  color: subTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "₹ ${goalData["goal_amount"]}",
                              style: const TextStyle(
                                  color: subTextColor, fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.18),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Timeframe",
                              style: TextStyle(
                                  color: subTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              goalData["monthly_savings_needed"] == null
                                  ? "${goalData["time_frame"]} Days"
                                  : "${goalData["time_frame"] ~/ 365} Years",
                              style: const TextStyle(
                                  color: subTextColor, fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Bank Balance",
                              style: TextStyle(
                                  color: subTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "₹ ${goalData["bank_balance"]}",
                              style: const TextStyle(
                                  color: subTextColor, fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Pending Loan",
                              style: TextStyle(
                                  color: subTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "₹ ${goalData["pending_loan"]}",
                              style: const TextStyle(
                                  color: subTextColor, fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Monthly Income",
                              style: TextStyle(
                                  color: subTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "₹ ${goalData["month_income"]}",
                              style: const TextStyle(
                                  color: subTextColor, fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Net Savings",
                              style: TextStyle(
                                  color: subTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "₹ ${goalData["net_savings"]}",
                              style: const TextStyle(
                                  color: subTextColor, fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Goal Amount",
                              style: TextStyle(
                                  color: subTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              goalData['interval'] == "monthly"
                                  ? "₹ ${goalData["saving_needed_excluding_all"]}/pm"
                                  : "₹ ${goalData["saving_needed_excluding_all"]}/day",
                              style: const TextStyle(
                                  color: subTextColor, fontSize: 15),
                            ),
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Savings Analysis",
                              style: TextStyle(
                                  color: subTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "₹ ${goalData["saving_needed_considering_all"]}",
                              style: const TextStyle(
                                  color: subTextColor, fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(goalData["message"],
                  style: const TextStyle(color: subTextColor, fontSize: 15)),
              const SizedBox(height: 20),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      // Action for changing goal
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "Change Goal",
                      style: TextStyle(color: primaryColor, fontSize: 15),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      // Action for creating a goal (show dialog)
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Give your goal a name",
                                    style: TextStyle(
                                        color: subTextColor,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    alignment: Alignment.center,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 1),
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: overlayColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      // Sample static controller
                                      controller: TextEditingController(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: TextButton.icon(
                                      onPressed: () {
                                        Get.to(() => const GoalMap(
                                              targetDate: "2022-12-31",
                                              pendingAmount: 10000,
                                              interval: "Monthly",
                                              timeFrame: 12,
                                              goalTracks: [
                                                {
                                                  "month": "Jan",
                                                  "amount": "1000"
                                                },
                                                {
                                                  "month": "Feb",
                                                  "amount": "2000"
                                                },
                                                {
                                                  "month": "Mar",
                                                  "amount": "3000"
                                                },
                                                {
                                                  "month": "Apr",
                                                  "amount": "4000"
                                                },
                                                {
                                                  "month": "May",
                                                  "amount": "5000"
                                                },
                                                {
                                                  "month": "Jun",
                                                  "amount": "6000"
                                                },
                                                {
                                                  "month": "Jul",
                                                  "amount": "7000"
                                                },
                                                {
                                                  "month": "Aug",
                                                  "amount": "8000"
                                                },
                                                {
                                                  "month": "Sep",
                                                  "amount": "9000"
                                                },
                                                {
                                                  "month": "Oct",
                                                  "amount": "10000"
                                                },
                                                {
                                                  "month": "Nov",
                                                  "amount": "11000"
                                                },
                                                {
                                                  "month": "Dec",
                                                  "amount": "12000"
                                                },
                                              ],
                                              savingsNeeded: 1000,
                                            ));
                                      },
                                      icon: const FaIcon(FontAwesomeIcons.plus,
                                          size: 17, color: primaryColor),
                                      label: const Text(
                                        "Generate Map",
                                        style: TextStyle(
                                            color: primaryColor, fontSize: 15),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Create Goal",
                      style: TextStyle(color: primaryColor, fontSize: 15),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
