import 'package:crypto_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets.dart/history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryServices>(
      builder: (context, historyServices, child) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: historyServices.history.length,
          itemBuilder: (context, index) {
            return HistoryCard(
              imageUrl: historyServices.history[index].image,
              status: 'Recieved',
              date: historyServices.history[index].atlDate,
              cryptoAmount: historyServices.history[index].atlDate,
              dollarAmount: historyServices.history[index].atlDate,
            );
          },
        );
      },
    );
  }
}
