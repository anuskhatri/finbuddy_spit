import 'package:bobhack/constants.dart';
import 'package:bobhack/controllers/login_controller.dart';
import 'package:bobhack/controllers/stocks_controller.dart';
import 'package:bobhack/models/mutual_funds_modal.dart';
import 'package:bobhack/pages/home/investment/your_funds.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class InvestmentController extends GetxController {
  var selectedInvestment = 'Mutual Fund'.obs;

  final StocksController stocksController = Get.put(StocksController());
  
  // Personal Details
  final personalDetails = {
    'name': 'John Doe',
    'age': 35,
    'email': 'john.doe@example.com',
  }.obs;
  
  final overallInvestment = {
    'totalAmount': 25000.0,
    'totalGrowth': 10.5, // Percentage
  }.obs;

  final name = 'John Doe'.obs;

  // Invested mutual funds
  final investedMutualFundsList = <InvestedMutualFundModel>[
    InvestedMutualFundModel(
      investmentAmount: 5000.0,
      currentValue: 5200.0, 
      unitsPurchased: '50',
      fundName: 'Axis Bluechip Fund',
    ),
    InvestedMutualFundModel(
      investmentAmount: 7000.0,
      currentValue: 7400.0,
      unitsPurchased: '70',
      fundName: 'HDFC Midcap Opportunities Fund',
    ),
    InvestedMutualFundModel(
      investmentAmount: 3000.0,
      currentValue: 3100.0,
      unitsPurchased: '30',
      fundName: 'SBI Small Cap Fund',
    ),
  ].obs;

  final mutualFundInvestment = {
    'totalInvestment': 15000.0,
    'totalCurrentValue': 15700.0,
  }.obs;

  final stockFundInvestment = {
    'totalInvestment': 10000.0,
    'totalCurrentValue': 11000.0,
  }.obs;

  void changeSelectedInvestment(String newInvestment) {
    selectedInvestment.value = newInvestment;
  }
}

class MutualFundsController extends GetxController {
  List<MutualFunds> mutualFunds = [
    MutualFunds(
      name: 'Axis Bluechip Fund',
      age: '10', // Age of the fund in years
      category: 'Large Cap',
      size: '5000', // Size in Crores
    ),
    MutualFunds(
      name: 'HDFC Midcap Opportunities Fund',
      age: '12',
      category: 'Mid Cap',
      size: '8000',
    ),
    MutualFunds(
      name: 'SBI Small Cap Fund',
      age: '8',
      category: 'Small Cap',
      size: '3500',
    ),
    MutualFunds(
      name: 'ICICI Prudential Equity & Debt Fund',
      age: '15',
      category: 'Hybrid',
      size: '12000',
    ),
    MutualFunds(
      name: 'Kotak Emerging Equity Fund',
      age: '7',
      category: 'Mid Cap',
      size: '4000',
    ),
    MutualFunds(
      name: 'UTI Nifty Index Fund',
      age: '5',
      category: 'Index Fund',
      size: '3000',
    ),
    MutualFunds(
      name: 'Mirae Asset Tax Saver Fund',
      age: '9',
      category: 'ELSS',
      size: '2500',
    ),
    MutualFunds(
      name: 'Franklin India Flexi Cap Fund',
      age: '14',
      category: 'Flexi Cap',
      size: '6000',
    ),
    MutualFunds(
      name: 'Aditya Birla Sun Life Frontline Equity Fund',
      age: '11',
      category: 'Large Cap',
      size: '7500',
    ),
    MutualFunds(
      name: 'DSP Natural Resources & New Energy Fund',
      age: '6',
      category: 'Sectoral/Thematic',
      size: '2000',
    ),
  ];

  final TextEditingController mutualFundSearchController =
      TextEditingController();
  
  RxString mutualFundInfoMessage = ''.obs;
  final searchType = 'genai'.obs;

  var term = ''.obs;
  var risk = ''.obs;
  var returns = ''.obs;

  void toggleSearchType() {
    searchType.value = searchType.value == 'genai' ? 'amc' : 'genai';
    if (searchType.value == 'genai') {
      mutualFunds.clear();
    }
  }

  void searchMutualFunds(String query) {
    if (query.isEmpty) {
      mutualFundInfoMessage.value = 'Please enter a valid search query';
    } else {
      mutualFunds.assignAll(
        mutualFunds.where((fund) {
          return fund.name.toLowerCase().contains(query.toLowerCase());
        }).toList(),
      );
    }
  }
}