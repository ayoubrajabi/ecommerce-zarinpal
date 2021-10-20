import 'package:beamer/beamer.dart';
import 'package:ecommerce_zarinpal/ui/screens/screens.dart';
import 'package:flutter/material.dart';

class CartLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey(CartScreen.path),
          type: BeamPageType.sharedAxisTransion,
          child: CartScreen(),
        ),
      ];

  @override
  List get pathBlueprints => [CartScreen.path];
}
