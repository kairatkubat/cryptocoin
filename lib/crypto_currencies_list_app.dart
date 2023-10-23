
import 'package:crypto/features/crypto_coins/crypto_list/crypto_list.dart';
import 'package:crypto/theme/theme.dart';
import 'package:flutter/material.dart';

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      home: const CryptoConinsList(),
      
    );
  }
}