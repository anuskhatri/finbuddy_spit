import 'package:flutter/material.dart';
import 'package:flutter_frontend/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';

class GoalMap extends StatelessWidget {
  final String targetDate;
  final double pendingAmount;
  final String interval;
  final int timeFrame;
  final List<Map<String, dynamic>> goalTracks;
  final double savingsNeeded;

  const GoalMap({
    Key? key,
    required this.targetDate,
    required this.pendingAmount,
    required this.interval,
    required this.timeFrame,
    required this.goalTracks,
    required this.savingsNeeded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Target Date",
                        style: TextStyle(
                            color: subTextColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        targetDate,
                        style: const TextStyle(
                            color: subTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const FaIcon(FontAwesomeIcons.arrowRight,
                      color: subTextColor),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pending Amount",
                        style: TextStyle(
                            color: subTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "₹ $pendingAmount",
                        style: const TextStyle(
                            color: subTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: interval == "monthly" ? (timeFrame / 30).ceil() : timeFrame,
                itemBuilder: (context, index) {
                  return TimelineTile(
                    alignment: TimelineAlign.start,
                    isFirst: index == 0,
                    isLast: index == (interval == "monthly" ? (timeFrame / 30).ceil() - 1 : timeFrame - 1),
                    indicatorStyle: const IndicatorStyle(
                      drawGap: true,
                      width: 20,
                      color: subTextColor,
                      padding: EdgeInsets.all(6),
                    ),
                    endChild: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: overlayColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minHeight: 100,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            interval == "monthly"
                                ? "Month ${index + 1}"
                                : "Day ${index + 1}",
                            style: const TextStyle(
                                color: primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    interval == "monthly"
                                        ? "Target for this month"
                                        : "Target for this day",
                                    style: const TextStyle(
                                      color: subTextColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "₹ $savingsNeeded",
                                    style: const TextStyle(
                                        color: subTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              if (index < goalTracks.length)
                                Text(
                                  "₹ ${goalTracks[index]["saved_amount"]}",
                                  style: const TextStyle(
                                      color: subTextColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              else
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 1),
                                  width: 90,
                                  height: MediaQuery.of(context).size.height * 0.06,
                                  decoration: BoxDecoration(
                                    color: subTextColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    ),
                                    onFieldSubmitted: (value) {
                                      // Handle value submission
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
