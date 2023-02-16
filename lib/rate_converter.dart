import 'network.dart';
import 'keys.dart';

class Convert {
  Future<dynamic> getRateData(
      {required String coin, required String currency}) async {
    dynamic rateData = await Network(
      domain: 'rest.coinapi.io',
      unencodedPath: '/v1/exchangerate/$coin/$currency',
      queryparameters: {
        'apikey': apikey3,
      },
    ).getRequest();
    if (rateData == null) {
      return null;
    } else {
      print(rateData['rate'].toStringAsFixed(2));
      return rateData['rate'].toStringAsFixed(2);
    }
  }
}
