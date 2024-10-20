import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/controllers/goal_controller.dart';
import 'package:flutter_frontend/pages/home/goal_tracking/goal_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ListAllGoals extends StatelessWidget {
  const ListAllGoals({super.key});

  int getRandomNumber(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  String getRandomImagePath() {
    int randomNumber = getRandomNumber(1, 10);
    return "assets/image$randomNumber.jpg";
  }

  @override
  Widget build(BuildContext context) {
    final GoalController goalController = Get.put(GoalController());
    return Obx(() => Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: double.infinity,
          margin: const EdgeInsets.only(
            top: 10,
          ),
          child: ListView.builder(
            itemCount: goalController.allGoals.length,
            itemBuilder: (context, index) {
              var goal = goalController.allGoals[index];
              return Dismissible(
                key: Key(goal.id.toString()),
                onDismissed: (direction) {
                  goalController.deleteGoal(goal.id);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: overlayColor,
                    border: Border.all(color: overlayColor, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => GoalMap(
                            targetDate: goal.targetDate,
                            pendingAmount: double.parse(goal.goalAmount),
                            interval: "Monthly",
                            timeFrame: 12,
                            goalTracks: [
                              {"month": "Jan", "amount": "1000"},
                              {"month": "Feb", "amount": "2000"},
                              {"month": "Mar", "amount": "3000"},
                              {"month": "Apr", "amount": "4000"},
                              {"month": "May", "amount": "5000"},
                              {"month": "Jun", "amount": "6000"},
                              {"month": "Jul", "amount": "7000"},
                              {"month": "Aug", "amount": "8000"},
                              {"month": "Sep", "amount": "9000"},
                              {"month": "Oct", "amount": "10000"},
                              {"month": "Nov", "amount": "11000"},
                              {"month": "Dec", "amount": "12000"},
                            ],
                            savingsNeeded: 1000,
                          ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 25,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                getRandomImagePath(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(goal.name,
                            style: const TextStyle(
                                color: primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(goal.goalAmount,
                                style: const TextStyle(
                                    color: subTextColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                            const FaIcon(FontAwesomeIcons.arrowRight,
                                color: subTextColor, size: 15),
                            Text(goal.targetDate,
                                style: const TextStyle(
                                    color: subTextColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
