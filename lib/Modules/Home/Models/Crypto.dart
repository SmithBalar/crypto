import 'dart:convert';

/// Json Encoded String to Crypto Model List
List<CryptoModel> cryptoFromJson(String str) => List<CryptoModel>.from(json.decode(str).map((x) => CryptoModel.fromJson(x)));

/// Crypto Model List to Json Encoded with String
String cryptoToJson(List<CryptoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// Model Class for Crypto currency Listing API With Change Notifier
class CryptoModel {
  final String? id;
  final String? currency;
  final String? symbol;
  final String name;
  final String logoUrl;
  final String? status;
  final String? platformCurrency;
  final String? price;
  final String? priceDate;
  final String? priceTimestamp;
  final String? circulatingSupply;
  final String? marketCap;
  final String? marketCapDominance;
  final String? numExchanges;
  final String? numPairs;
  final String? numPairsUnmapped;
  final String? firstCandle;
  final String? firstTrade;
  final String? firstOrderBook;
  final String? rank;
  final String? rankDelta;
  final String? high;
  final String? highTimestamp;
  final Yearly? yearly;
  final Monthly? monthly;

  CryptoModel({
    this.id,
    this.currency,
    this.symbol,
    required this.name,
    required this.logoUrl,
    this.status,
    this.platformCurrency,
    this.price,
    this.priceDate,
    this.priceTimestamp,
    this.circulatingSupply,
    this.marketCap,
    this.marketCapDominance,
    this.numExchanges,
    this.numPairs,
    this.numPairsUnmapped,
    this.firstCandle,
    this.firstTrade,
    this.firstOrderBook,
    this.rank,
    this.rankDelta,
    this.high,
    this.highTimestamp,
    this.yearly,
    this.monthly,
  });

  CryptoModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        currency = json['currency'] as String?,
        symbol = json['symbol'] as String?,
        name = json['name'] as String,
        logoUrl = json['logo_url'] as String,
        status = json['status'] as String?,
        platformCurrency = json['platform_currency'] as String?,
        price = json['price'] as String?,
        priceDate = json['price_date'] as String?,
        priceTimestamp = json['price_timestamp'] as String?,
        circulatingSupply = json['circulating_supply'] as String?,
        marketCap = json['market_cap'] as String?,
        marketCapDominance = json['market_cap_dominance'] as String?,
        numExchanges = json['num_exchanges'] as String?,
        numPairs = json['num_pairs'] as String?,
        numPairsUnmapped = json['num_pairs_unmapped'] as String?,
        firstCandle = json['first_candle'] as String?,
        firstTrade = json['first_trade'] as String?,
        firstOrderBook = json['first_order_book'] as String?,
        rank = json['rank'] as String?,
        rankDelta = json['rank_delta'] as String?,
        high = json['high'] as String?,
        highTimestamp = json['high_timestamp'] as String?,
        yearly = (json['365d'] as Map<String, dynamic>?) != null ? Yearly.fromJson(json['365d'] as Map<String, dynamic>) : null,
        monthly = (json['30d'] as Map<String, dynamic>?) != null ? Monthly.fromJson(json['30d'] as Map<String, dynamic>) : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'currency': currency,
        'symbol': symbol,
        'name': name,
        'logo_url': logoUrl,
        'status': status,
        'platform_currency': platformCurrency,
        'price': price,
        'price_date': priceDate,
        'price_timestamp': priceTimestamp,
        'circulating_supply': circulatingSupply,
        'market_cap': marketCap,
        'market_cap_dominance': marketCapDominance,
        'num_exchanges': numExchanges,
        'num_pairs': numPairs,
        'num_pairs_unmapped': numPairsUnmapped,
        'first_candle': firstCandle,
        'first_trade': firstTrade,
        'first_order_book': firstOrderBook,
        'rank': rank,
        'rank_delta': rankDelta,
        'high': high,
        'high_timestamp': highTimestamp,
        '365d': yearly?.toJson(),
        '30d': monthly?.toJson(),
      };

  /// String Conversion of Model Class
  @override
  String toString() {
    return 'CryptoModel{id: $id, currency: $currency, symbol: $symbol, name: $name, '
        'logoUrl: $logoUrl, status: $status, platformCurrency: $platformCurrency, '
        'price: $price, priceDate: $priceDate, priceTimestamp: $priceTimestamp, '
        'circulatingSupply: $circulatingSupply, marketCap: $marketCap, '
        'marketCapDominance: $marketCapDominance, numExchanges: $numExchanges, '
        'numPairs: $numPairs, numPairsUnmapped: $numPairsUnmapped, '
        'firstCandle: $firstCandle, firstTrade: $firstTrade, firstOrderBook: $firstOrderBook, '
        'rank: $rank, rankDelta: $rankDelta, high: $high, highTimestamp: $highTimestamp, '
        'yearly: $yearly, monthly: $monthly}';
  }
}

class Monthly {
  final String? volume;
  final String? priceChange;
  final String? priceChangePct;
  final String? volumeChange;
  final String? volumeChangePct;
  final String? marketCapChange;
  final String? marketCapChangePct;

  Monthly({
    this.volume,
    this.priceChange,
    this.priceChangePct,
    this.volumeChange,
    this.volumeChangePct,
    this.marketCapChange,
    this.marketCapChangePct,
  });

  Monthly.fromJson(Map<String, dynamic> json)
      : volume = json['volume'] as String?,
        priceChange = json['price_change'] as String?,
        priceChangePct = json['price_change_pct'] as String?,
        volumeChange = json['volume_change'] as String?,
        volumeChangePct = json['volume_change_pct'] as String?,
        marketCapChange = json['market_cap_change'] as String?,
        marketCapChangePct = json['market_cap_change_pct'] as String?;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'volume': volume,
        'price_change': priceChange,
        'price_change_pct': priceChangePct,
        'volume_change': volumeChange,
        'volume_change_pct': volumeChangePct,
        'market_cap_change': marketCapChange,
        'market_cap_change_pct': marketCapChangePct,
      };
}

class Yearly {
  final String? volume;
  final String? priceChange;
  final String? priceChangePct;
  final String? volumeChange;
  final String? volumeChangePct;
  final String? marketCapChange;
  final String? marketCapChangePct;

  Yearly({
    this.volume,
    this.priceChange,
    this.priceChangePct,
    this.volumeChange,
    this.volumeChangePct,
    this.marketCapChange,
    this.marketCapChangePct,
  });

  Yearly.fromJson(Map<String, dynamic> json)
      : volume = json['volume'] as String?,
        priceChange = json['price_change'] as String?,
        priceChangePct = json['price_change_pct'] as String?,
        volumeChange = json['volume_change'] as String?,
        volumeChangePct = json['volume_change_pct'] as String?,
        marketCapChange = json['market_cap_change'] as String?,
        marketCapChangePct = json['market_cap_change_pct'] as String?;

  Map<String, dynamic> toJson() => {
        'volume': volume,
        'price_change': priceChange,
        'price_change_pct': priceChangePct,
        'volume_change': volumeChange,
        'volume_change_pct': volumeChangePct,
        'market_cap_change': marketCapChange,
        'market_cap_change_pct': marketCapChangePct
      };
}
