import 'dart:async';

import 'package:crypto/features/crypto_coins/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto/features/crypto_coins/crypto_list/crypto_list.dart';
import 'package:crypto/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoConinsList extends StatefulWidget {
  const CryptoConinsList({super.key});

  @override
  State<CryptoConinsList> createState() => _CryptoConinsListState();
}

class _CryptoConinsListState extends State<CryptoConinsList> {
  List<CryptoCoin>? _cryptoCoinsList;
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepositories>());
  // Future<void> _cryptoCoinLoad() async {
  //    _cryptoCoinsList = await GetIt.instance<AbstractCoinsRepositories>().getCoinsList();
  //   setState(() {
  //   });
  // }
  @override
  void initState() {
    //  _cryptoCoinLoad();
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('CryptoCoins')),
        body: RefreshIndicator(
          onRefresh: () async{
            final completer = Completer();  
             _cryptoListBloc.add(LoadCryptoList(completer: completer));
            return   completer.future; 
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 20),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.coinsList.length,
                  itemBuilder: (context, i) {
                    final coin = state.coinsList[i];
                    return CryptoCoinTile(
                      coin: coin,
                    );
                  },
                );
              }
              if(state is CryptoListLoadingFalure){
                 return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Center(child: Text("Something went wrong"),),
                     const SizedBox(height: 50,),
                     TextButton(onPressed: (){
                       _cryptoListBloc.add(LoadCryptoList());
                     }, child: const Text('Try again'))
                   ],
                 );
              }
              return  const Center(child: CircularProgressIndicator());
            },
            
          ),
        ));
  }
}

// (_cryptoCoinsList == null)? const Center(
//       child: CircularProgressIndicator(),
//      ) :
//      