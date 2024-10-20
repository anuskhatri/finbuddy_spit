
import 'package:d_chart/d_chart.dart';
import 'package:flutter_frontend/models/transactions_modal.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChartsController extends GetxController {
  RxList<OrdinalData> pieChartData = <OrdinalData>[
    OrdinalData(domain: 'Groceries', measure: 500.0),
    OrdinalData(domain: 'Utilities', measure: 300.0),
    OrdinalData(domain: 'Rent', measure: 1200.0),
  ].obs;

  RxList<DChartBarDataCustom> barChartData = <DChartBarDataCustom>[
    DChartBarDataCustom(label: 'Groceries', value: 500.0),
    DChartBarDataCustom(label: 'Utilities', value: 300.0),
    DChartBarDataCustom(label: 'Rent', value: 1200.0),
  ].obs;

  RxList<OrdinalData> loanPieChartData = <OrdinalData>[
    OrdinalData(domain: 'Home Loan', measure: 50000.0),
    OrdinalData(domain: 'Car Loan', measure: 20000.0),
    OrdinalData(domain: 'Personal Loan', measure: 15000.0),
  ].obs;

  RxBool toggleplot = false.obs;
}

class TransactionController extends GetxController {
  var transactions = <Transactions>[
    Transactions(
        description: 'Groceries',
        date: _formatDateTime('2024-09-18T14:20:00'),
        amount: "500.0",
        reciverName: 'Supermarket'),
    Transactions(
        description: 'Utilities',
        date: _formatDateTime('2024-09-17T10:00:00'),
        amount: "300.0",
        reciverName: 'Utility Company'),
    Transactions(
        description: 'Rent',
        date: _formatDateTime('2024-09-15T12:00:00'),
        amount: "1200.0",
        reciverName: 'Landlord'),
  ].obs;

  final ChartsController chartsController = Get.put(ChartsController());

  static String _formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat dateFormat = DateFormat('dd MMM yyyy, HH:mm');
    return dateFormat.format(dateTime);
  }
}
