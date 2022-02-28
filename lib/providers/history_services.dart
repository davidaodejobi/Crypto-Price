// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:crypto_app/models/history.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HistoryServices with ChangeNotifier {
  // ignore: prefer_final_fields
  List<History> _history = [];

  List<History> get history {
    return [..._history];
  }

  Future<void> fetchHistory() async {
    final url = Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body);

        List<History> listOfHistory = [];
        for (var hist in extractedData) {
          History history = History.fromJson(hist);
          listOfHistory.add(history);
        }

        _history = listOfHistory;

        notifyListeners();
        // return listOfHistory;
      } else {
        throw Exception('Failed to load history data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

        // print(extractedData);
        // HistoryList historyList = HistoryList.fromJson(extractedData);
        // final List<History> loadedHistory = [];
        // historyList.forEach((element) {
        //   loadedHistory.add(History(
        //     id: element.id,
        //     name: element.name,
        //     symbol: element.symbol,
        //     image: element.image,
        //     athDate: element.athDate,
        //     atlDate: element.atlDate,
        //     lastUpdated: element.lastUpdated,
        //   ));
        // });
        // _history = loadedHistory.reversed.toList();
        // print('History loaded $_history');

        // return historyData;