import 'package:flutter/cupertino.dart';
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
    return SvgPicture.network(
      logoUrl,
      semanticsLabel: semanticsLabel,
      placeholderBuilder: (BuildContext context) => const CupertinoActivityIndicator(),
    );
  }
}
