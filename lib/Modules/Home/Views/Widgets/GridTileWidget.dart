import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Constants/Constants.dart';
import '../../Models/Crypto.dart';
import '../Screens/CurrencyDetailScreen.dart';
import 'CachedNetworkSVG.dart';

class GridTileWidget extends StatelessWidget {
  const GridTileWidget({
    Key? key,
    required this.cryptoData,
  }) : super(key: key);

  final CryptoModel cryptoData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CurrencyDetailScreen(cryptoData: cryptoData),
          ),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        child: GridTile(
          footer: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(cryptoData.name, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          child: Center(
            child: getFileExtension(cryptoData.logoUrl) == 'svg'
                ? CachedNetworkSVG(
                    logoUrl: cryptoData.logoUrl,
                    semanticsLabel: cryptoData.name,
                  )
                : CachedNetworkImage(
                    height: 80,
                    width: 80,
                    imageUrl: cryptoData.logoUrl,
                    placeholder: (context, url) => const CupertinoActivityIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
          ),
        ),
      ),
    );
  }
}
