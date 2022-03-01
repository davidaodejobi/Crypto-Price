import 'dart:math';

import 'package:crypto_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets.dart/history_card.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key}) : super(key: key);

  Future<void> _refresh(BuildContext context) async {
    await Provider.of<HistoryProvider>(context, listen: false).fetchHistory();
  }

  List<String> requestStatus = [
    'Received',
    'Sent',
  ];

  String _getRandomRequestStatus() {
    return requestStatus[Random().nextInt(requestStatus.length)];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            Provider.of<HistoryProvider>(context, listen: false).fetchHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.error != null) {
              return Center(
                child: Text(
                  'An error occurred!',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () => _refresh(context),
                child: Consumer<HistoryProvider>(
                  builder: (context, historyServices, child) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: historyServices.history.length,
                      itemBuilder: (context, index) {
                        return HistoryCard(
                          imageUrl: historyServices.history[index].image,
                          status: _getRandomRequestStatus(),
                          date: historyServices.history[index].athDate,
                          marketCap: historyServices.history[index].marketCap,
                          dollarAmount:
                              historyServices.history[index].currentPrice,
                          name: historyServices.history[index].name,
                        );
                      },
                    );
                  },
                ),
              );
            }
          }
        });
  }
}
