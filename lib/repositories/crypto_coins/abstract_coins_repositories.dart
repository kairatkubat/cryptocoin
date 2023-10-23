import 'package:crypto/repositories/crypto_coins/models/crypto_coin.dart';

abstract class AbstractCoinsRepositories{
 Future<List<CryptoCoin>> getCoinsList();
 }