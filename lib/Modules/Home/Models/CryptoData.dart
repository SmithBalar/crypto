// Json Encoded String to Crypto Model List
import 'dart:convert';

/// Json Encoded String to CryptoData Model List
List<CryptoData> cryptoFromJson(String str) => List<CryptoData>.from(json.decode(str).map((x) => CryptoData.fromJson(x)));

/// CryptoData Model List to Json Encoded with String
String cryptoToJson(List<CryptoData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CryptoData {
  String? name;
  String? symbol;
  String? network;
  bool? hasExtraId;
  String? extraId;
  String? image;
  String? validationAddress;
  String? validationExtra;
  String? addressExplorer;
  String? txExplorer;
  String? confirmationsFrom;

  CryptoData(
      {this.name,
      this.symbol,
      this.network,
      this.hasExtraId,
      this.extraId,
      this.image,
      this.validationAddress,
      this.validationExtra,
      this.addressExplorer,
      this.txExplorer,
      this.confirmationsFrom});

  @override
  String toString() {
    return 'CryptoData{name: $name, symbol: $symbol, network: $network, hasExtraId: $hasExtraId,'
        ' extraId: $extraId, image: $image, validationAddress: $validationAddress,'
        ' validationExtra: $validationExtra, addressExplorer: $addressExplorer,'
        ' txExplorer: $txExplorer, confirmationsFrom: $confirmationsFrom}';
  }

  CryptoData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
    network = json['network'];
    hasExtraId = json['has_extra_id'];
    extraId = json['extra_id'];
    image = json['image'];
    validationAddress = json['validation_address'];
    validationExtra = json['validation_extra'];
    addressExplorer = json['address_explorer'];
    txExplorer = json['tx_explorer'];
    confirmationsFrom = json['confirmations_from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['symbol'] = symbol;
    data['network'] = network;
    data['has_extra_id'] = hasExtraId;
    data['extra_id'] = extraId;
    data['image'] = image;
    data['validation_address'] = validationAddress;
    data['validation_extra'] = validationExtra;
    data['address_explorer'] = addressExplorer;
    data['tx_explorer'] = txExplorer;
    data['confirmations_from'] = confirmationsFrom;
    return data;
  }
}
