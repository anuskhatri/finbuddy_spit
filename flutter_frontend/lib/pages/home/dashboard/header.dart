
import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:flutter_frontend/controllers/investment_controller.dart';
import 'package:flutter_frontend/pages/home/dashboard/recent_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SpitHeader extends StatelessWidget {
  SpitHeader({super.key});

  final InvestmentController investmentController =
      Get.put(InvestmentController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: overlayColor, borderRadius: BorderRadius.circular(13)),
            child: Center(
              child: Text(
                'JB',
                style: const TextStyle(
                    color: Color.fromARGB(255, 174, 174, 174),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Jainam Barbhaya",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () => Get.to(() => RecentNotifications()),
              icon: FaIcon(
                size: 20,
                FontAwesomeIcons.bell,
                color: Colors.grey[500],
              ))
        ],
      ),
    );
  }
}
