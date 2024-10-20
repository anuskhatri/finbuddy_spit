
import 'package:flutter/material.dart';
import 'package:flutter_frontend/controllers/goal_controller.dart';
import 'package:flutter_frontend/pages/home/goal_tracking/create_goal.dart';
import 'package:flutter_frontend/pages/home/goal_tracking/list_all_goals.dart';
import 'package:flutter_frontend/pages/home/goal_tracking/no_goals.dart';
import 'package:get/get.dart';

class GoalsBody extends StatelessWidget {
  GoalsBody({super.key});

  final GoalController goalController = Get.put(GoalController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return goalController.toggleAddGoal.isTrue
            ? CreateGoal()
            : goalController.allGoals.isEmpty
                ? NoGoals()
                : const ListAllGoals();
      },
    );
  }
}