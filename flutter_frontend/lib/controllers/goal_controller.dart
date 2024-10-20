import 'package:flutter/material.dart';
import 'package:flutter_frontend/models/goals_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GoalController extends GetxController {
  RxBool toggleAddGoal = false.obs;
  final TextEditingController createGoalController = TextEditingController();
  final TextEditingController goalAmountController = TextEditingController();
  final TextEditingController goalTimeController = TextEditingController();
  final TextEditingController goalNameController = TextEditingController();
  final TextEditingController savedAmountController = TextEditingController();

  final goalAmount = 0.0.obs;
  final goalName = ''.obs;
  final goalTime = 0.obs;
  RxBool sendLoanData = true.obs;
  RxBool sendTransactionData = true.obs;
  RxBool sendBalanceData = true.obs;
  RxBool showValidationField = false.obs;
  var selectedInvestmentStrategy = ''.obs;

  // Savings Account
  final TextEditingController monthlyIncomeController = TextEditingController();
  var monthlyIncome = 0.obs;

  RxBool processingCompleted = false.obs;

  // Static Data for Goals
  RxMap<String, dynamic> goalData = <String, dynamic>{}.obs;

  // Mock Data
  RxList<Goal> allGoals = <Goal>[].obs;

  @override
  void onInit() {
    super.onInit();
    initializeStaticData();
  }

  void initializeStaticData() {
    // Sample data for goals
    allGoals.addAll([
      Goal(id: 1, goalAmount: "5000.0", name: "New Car", targetDate: "01-12-2025"),
      Goal(id: 2, goalAmount: "10000.0", name: "Vacation", targetDate: "15-06-2024"),
      Goal(id: 3, goalAmount: "20000.0", name: "Home Renovation", targetDate: "30-09-2024"),
    ]);

    // Set initial values for other controllers
    createGoalController.text = "Buy House";
    goalAmountController.text = "30000.0";
    goalTimeController.text = "24"; // Months
    goalNameController.text = "New Home";
    monthlyIncomeController.text = "5000"; // Monthly income
    monthlyIncome.value = int.tryParse(monthlyIncomeController.text) ?? 0;

    // Set static goal data
    goalData.value = {
      "goal_amount": 30000.0,
      "time_frame": 24,
      "saving_needed_excluding_all": 15000.0,
      "interval": 12, // monthly savings
      "goal_name": "New Home",
    };
  }

  @override
  void onClose() {
    createGoalController.dispose();
    goalAmountController.dispose();
    goalTimeController.dispose();
    monthlyIncomeController.dispose();
    super.onClose();
  }

  void addGoal() {
    Goal newGoal = Goal(
      id: allGoals.length + 1, // Simple ID generation
      goalAmount: goalData["goal_amount"],
      name: goalName.value,
      targetDate: DateFormat('dd-MM-yyyy').format(DateTime.now().add(Duration(days: goalTime.value * 30))),
    );

    allGoals.add(newGoal);
    Get.snackbar("Success", "Goal added successfully");
    toggleAddGoal.value = false;
  }

  void updateGoal(String savedAmount) {
    // Implementation for updating the goal
  }

  void deleteGoal(int goalId) {
    allGoals.removeWhere((element) => element.id == goalId);
    Get.snackbar("Success", "Goal deleted successfully");
  }
}

