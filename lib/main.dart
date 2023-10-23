import 'package:crypto/crypto_currencies_list_app.dart';
import 'package:crypto/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart'; 

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepositories>(
    ()=> CryptoCoinsRepository(dio: Dio()));
  runApp(const CryptoCurrenciesListApp());
}




