import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CachedNetworkSVG extends StatelessWidget {
  const CachedNetworkSVG({
    Key? key,
    required this.logoUrl,
    required this.semanticsLabel,
  }) : super(key: key);

  final String logoUrl;
  final String semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return SvgPicture(
      AdvancedNetworkSvg(
        logoUrl,
        useDiskCache: true,
        (theme) => (bytes, colorFilter, key) {
          return svg.svgPictureDecoder(
            bytes ?? Uint8List.fromList(const []),
            false,
            colorFilter,
            key,
            theme: const SvgTheme(xHeight: 20),
          );
        },
        loadFailedCallback: () {
          return Icon(Icons.error);
        },
      ),
      height: 80,
      width: 80,
      placeholderBuilder: (BuildContext context) => CupertinoActivityIndicator(),
      semanticsLabel: semanticsLabel,
    );
  }
}
