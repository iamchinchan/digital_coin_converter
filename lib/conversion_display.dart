import 'package:flutter/material.dart';
import 'rate_converter.dart';

class ConvertDisplay extends StatefulWidget {
  const ConvertDisplay(
      {required this.coinName, required this.currencyName, Key? key})
      : super(key: key);
  final String coinName;
  final String currencyName;

  @override
  State<ConvertDisplay> createState() => _ConvertDisplayState();
}

class _ConvertDisplayState extends State<ConvertDisplay> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    if (mounted) {
      super.setState(fn);
    }
  }

  String coinRate = '?';
  void getCorrespondingRate() async {
    dynamic rateData = await Convert()
        .getRateData(coin: widget.coinName, currency: widget.currencyName);
    if (rateData != null) {
      setState(() {
        coinRate = rateData;
      });
    }
  }

  @override
  void initState() {
    getCorrespondingRate();
    print(
        'creating a new state object or a new display so to say for conversion');
    super.initState();
  }

  @override
  void deactivate() {
    print('deactivating current state object');
    super.deactivate();
  }

  @override
  void dispose() {
    print('disposing current object');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 ${widget.coinName} = $coinRate ${widget.currencyName}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
