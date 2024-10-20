
import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/pages/home/goal_tracking/body.dart';
import 'package:flutter_frontend/pages/home/goal_tracking/header.dart';

class SpitGoalTracking extends StatelessWidget {
  const SpitGoalTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GoalsHeader(),
              GoalsBody()
            ],
          ),
        ),
      ),
    );
  }
}
