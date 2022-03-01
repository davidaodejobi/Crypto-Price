import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/utils/theme.dart';
import '/providers/providers.dart';
import 'home.dart';

void main() {
  runApp(const CryptoPriceApp());
}

class CryptoPriceApp extends StatelessWidget {
  const CryptoPriceApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabManager()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
      ],
      child: Consumer<ThemeModel>(
        builder: (context, themeModel, child) => MaterialApp(
          title: 'Crypto Price',
          debugShowCheckedModeBanner: false,
          themeMode: themeModel.mode,
          theme: CryptoAppTheme.light(),
          darkTheme: CryptoAppTheme.dark(),
          home: Home(),
        ),
      ),
    );
  }
}
