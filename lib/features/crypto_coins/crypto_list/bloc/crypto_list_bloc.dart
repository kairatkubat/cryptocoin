import 'package:crypto/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepositories) : super(CryptListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        emit(CryptoListLoading());
        final cryptoCoins = await coinsRepositories.getCoinsList();
        emit(CryptoListLoaded(coinsList: cryptoCoins));
      }  catch (e) {
        emit(CryptoListLoadingFalure(exeptions: e)); 
      }
    });
  }

  final AbstractCoinsRepositories coinsRepositories;
}
