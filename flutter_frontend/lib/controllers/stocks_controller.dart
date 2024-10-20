
import 'package:flutter_frontend/models/stocks_model.dart';
import 'package:get/get.dart';

class StocksController extends GetxController {
  RxList<StocksModel> investedStocks = <StocksModel>[
    StocksModel(
      id: 1,
      symbolName: 'AAPL',
      purchasedPrice: '150.50',
      quantity: 10,
      stockName: 'Apple Inc.',
      currentPrice: 155.00, // Static current price for testing
    ),
    StocksModel(
      id: 2,
      symbolName: 'TSLA',
      purchasedPrice: '720.00',
      quantity: 5,
      stockName: 'Tesla Inc.',
      currentPrice: 730.00,
    ),
    StocksModel(
      id: 3,
      symbolName: 'GOOGL',
      purchasedPrice: '2800.00',
      quantity: 3,
      stockName: 'Alphabet Inc.',
      currentPrice: 2850.00,
    ),
    StocksModel(
      id: 4,
      symbolName: 'MSFT',
      purchasedPrice: '290.00',
      quantity: 15,
      stockName: 'Microsoft Corporation',
      currentPrice: 300.00,
    ),
    StocksModel(
      id: 5,
      symbolName: 'AMZN',
      purchasedPrice: '3400.00',
      quantity: 4,
      stockName: 'Amazon.com Inc.',
      currentPrice: 3450.00,
    ),
  ].obs;

  final stockData = <Map<String, dynamic>>[
    {
      'symbol': 'AAPL',
      'open': 150.00,
      'high': 157.00,
      'low': 149.00,
      'close': 155.00,
      'volume': 1000000,
    },
    {
      'symbol': 'TSLA',
      'open': 720.00,
      'high': 735.00,
      'low': 710.00,
      'close': 730.00,
      'volume': 800000,
    },
    {
      'symbol': 'GOOGL',
      'open': 2800.00,
      'high': 2855.00,
      'low': 2785.00,
      'close': 2850.00,
      'volume': 500000,
    },
    {
      'symbol': 'MSFT',
      'open': 290.00,
      'high': 305.00,
      'low': 288.00,
      'close': 300.00,
      'volume': 1200000,
    },
    {
      'symbol': 'AMZN',
      'open': 3400.00,
      'high': 3475.00,
      'low': 3380.00,
      'close': 3450.00,
      'volume': 600000,
    },
  ].obs;

  final stocksInvestment = {
    'totalInvestment': 50000.00,
    'currentValue': 52000.00,
  }.obs;

  final stockNews = {
    'AAPL': 'Apple launches new iPhone with cutting-edge features.',
    'TSLA': 'Tesla to expand production facilities in Europe.',
    'GOOGL': 'Alphabet announces partnership with AI firms.',
    'MSFT': 'Microsoft releases new version of Windows.',
    'AMZN': 'Amazon plans to enter the healthcare market.',
  }.obs;

  final stockAnalyis = 'The tech sector is showing strong growth, with Apple and Microsoft leading the charge.'.obs;
}