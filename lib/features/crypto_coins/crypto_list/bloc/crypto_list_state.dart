  part of 'crypto_list_bloc.dart';

  abstract class CryptoListState extends Equatable {}

  class CryptListInitial extends CryptoListState{
  @override

  List<Object?> get props => [];
  }

  class CryptoListLoading extends CryptoListState{
  @override
 
  List<Object?> get props => []; 
    
  }

  class CryptoListLoaded extends CryptoListState{
      CryptoListLoaded({required this.coinsList});

    final List<CryptoCoin> coinsList;
    
      @override  
      List<Object?> get props => [coinsList];
 
  }

class CryptoListLoadingFalure extends CryptoListState{
   CryptoListLoadingFalure({required this.exeptions}); 
  final Object?  exeptions;
  
  @override
  
  List<Object?> get props => [exeptions];

 
}