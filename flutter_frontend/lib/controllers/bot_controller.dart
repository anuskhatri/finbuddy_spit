
import 'package:flutter/material.dart';
import 'package:flutter_frontend/models/bot_modal.dart';
import 'package:get/get.dart';

class FinBuddyBotController extends GetxController {
  final TextEditingController messageController = TextEditingController();

  RxList<FinBuddyBotModel> chatList = <FinBuddyBotModel>[].obs;

  var endUrl = "chat";
  RxBool showGuide = false.obs;

  void getBotResponse(String userMessage) {
    messageController.clear();

    if (userMessage.contains("@transaction")) {
      endUrl = "transaction";
      userMessage = userMessage.replaceAll("@transaction", "");
    } else if (userMessage.contains("@loans")) {
      endUrl = "loans";
      userMessage = userMessage.replaceAll("@loans", "");
    } else if (userMessage.contains("@investment")) {
      endUrl = "investment";
      userMessage = userMessage.replaceAll("@investment", "");
    } else {
      endUrl = "chat";
      userMessage = userMessage;
    }

    if (userMessage.isEmpty) {
      Get.snackbar(
        "Warning",
        "Please enter a message after @$endUrl",
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    chatList.add(
      FinBuddyBotModel(message: userMessage, isUser: true),
    );

    // Simulating static responses based on user input
    String botResponse = _getStaticResponse(endUrl, userMessage);
    
    chatList.add(
      FinBuddyBotModel(message: botResponse, isUser: false),
    );
  }

  String _getStaticResponse(String command, String userMessage) {
    // Static responses for testing
    switch (command) {
      case "transaction":
        return "Here are your recent transactions: Transaction A, Transaction B, Transaction C.";
      case "loans":
        return "You have the following loan options available: Personal Loan, Home Loan, Car Loan.";
      case "investment":
        return "You can invest in the following: Mutual Funds, Stocks, Bonds.";
      case "chat":
      default:
        return "I'm here to assist you! What would you like to know? Use @transaction, @loans, or @investment for specific inquiries.";
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}