import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptocurrency_listing/Modules/Home/Models/CryptoData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/CachedNetworkSVG.dart';

class CurrencyDetailScreen extends StatelessWidget {
  const CurrencyDetailScreen({Key? key, required this.cryptoData}) : super(key: key);
  final CryptoData cryptoData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cryptoData.name ?? '', style: const TextStyle(fontSize: 16)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: (cryptoData.image ?? '').contains('svg')
                          ? CachedNetworkSVG(
                              logoUrl: cryptoData.image ?? '',
                              semanticsLabel: cryptoData.name ?? '',
                            )
                          : CachedNetworkImage(
                              height: 80,
                              width: 80,
                              imageUrl: cryptoData.image ?? '',
                              placeholder: (context, url) => const CupertinoActivityIndicator(),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(cryptoData.currency.toString(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  //     const SizedBox(height: 14),
                  //     LabelWidget(label: '1 Yr(%): ', value: cryptoData.yearly?.priceChangePct),
                  //     const SizedBox(height: 14),
                  //     LabelWidget(label: '1 Mo(%): ', value: cryptoData.monthly?.priceChangePct),
                  //   ],
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            const Text('Other Details', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            // LabelWidget(label: 'Price: ', value: cryptoData.price),
            // LabelWidget(label: 'Market Cap: ', value: cryptoData.marketCap),
            // LabelWidget(label: 'High: ', value: cryptoData.high),
            // LabelWidget(label: 'Number Exchanges: ', value: cryptoData.numExchanges),
            // LabelWidget(label: 'Circulating Supply: ', value: cryptoData.circulatingSupply),
            // LabelWidget(label: 'Market Cap Dominance: ', value: cryptoData.marketCapDominance),
          ],
        ),
      ),
    );
  }
}

class LabelWidget extends StatelessWidget {
  const LabelWidget({
    Key? key,
    this.label,
    this.value,
  }) : super(key: key);

  final String? label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 14),
        Row(
          children: [
            Text(label!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(value ?? '-', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ],
    );
  }
}
