import 'package:beamer/beamer.dart';
import 'package:ecommerce_zarinpal/data/data.dart';
import 'package:ecommerce_zarinpal/ui/screens/product_detail_screen.dart';
import 'package:ecommerce_zarinpal/ui/screens/screens.dart';
import 'package:flutter/material.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey(MainScreen.path),
          type: BeamPageType.sharedAxisTransion,
          child: MainScreen(),
        ),
        if (state.pathParameters.containsKey('name'))
          BeamPage(
            key: ValueKey(state.pathParameters.containsKey('name')),
            type: BeamPageType.sharedAxisTransion,
            title: tshirtData
                .firstWhere(
                    (tshirt) => tshirt.name == state.pathParameters['name'])
                .name,
            child: ProductDetailScreen(
              tshirtInfo: tshirtData.firstWhere(
                  (element) => element.name == state.pathParameters['name']),
            ),
          ),
      ];

  @override
  List get pathBlueprints => [MainScreen.path, 'product/:name'];
}
