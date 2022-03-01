import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/utils/utils.dart';
import '/screens/history_screen.dart';
import 'providers/providers.dart';
import '/widgets.dart/widgets.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  List<Widget> pages = [
    HistoryScreen(),
    Container(),
    Container(),
    Container(),
  ];

  List<String> titles = [
    'History',
    'Explore',
    'Notifications',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    final tabManager = Provider.of<TabManager>(context);
    final histories = Provider.of<HistoryProvider>(context);
    return Scaffold(
      backgroundColor: kScafoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          titles[tabManager.selectedTab],
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              histories.fetchHistory();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                children: [
                  const Icon(Icons.settings_input_component),
                  const SizedBox(width: 5),
                  Text(
                    'Sort/Filter',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: IndexedStack(
        index: tabManager.selectedTab,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabManager.selectedTab,
          onTap: (index) => tabManager.goToTab(index),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.language_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconWithBadge(
                  child: Icon(Icons.notifications_outlined), value: '13'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '',
            )
          ]),
    );
  }
}
