import 'package:flutter/material.dart';
import './coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'conversion_display.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);
  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[0];

  DropdownButton getCurrencyDropDown() {
    return DropdownButton(
        value: selectedCurrency,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
          });
        },
        items: currenciesList
            .map<DropdownMenuItem<String>>(
                (currency) => DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    ))
            .toList());
  }

  CupertinoPicker getCurrencyPicker() {
    return CupertinoPicker(
        itemExtent: 25.0,
        onSelectedItemChanged: (value) {
          setState(() {
            selectedCurrency = currenciesList[value];
          });
        },
        children: currenciesList.map((currency) {
          return Text(currency);
        }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cryptoList
                .map((coin) => ConvertDisplay(
                    key: Key('$coin+$selectedCurrency'),
                    coinName: coin,
                    currencyName: selectedCurrency))
                .toList(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid
                ? getCurrencyPicker()
                : getCurrencyDropDown(),
          ),
        ],
      ),
    );
  }
}
