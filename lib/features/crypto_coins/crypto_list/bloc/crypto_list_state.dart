  part of 'crypto_list_bloc.dart';

  class CryptoListState{}

  class CryptListInitial extends CryptoListState{}

  class CryptoListLoading extends CryptoListState{
    
  }

  class CryptoListLoaded extends CryptoListState{
      CryptoListLoaded({required this.coinsList});

    final List<CryptoCoin> coinsList; 

 
  }

class CryptoListLoadingFalure extends CryptoListState{
   CryptoListLoadingFalure({required this.exeptions}); 
  final Object?  exeptions;

 
}