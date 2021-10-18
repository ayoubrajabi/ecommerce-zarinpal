import 'package:beamer/beamer.dart';
import 'package:ecommerce_zarinpal/ui/screens/screens.dart';
import 'package:flutter/material.dart';

class NavLocation extends BeamLocation<BeamState> {
  NavLocation({this.beamerKey});

  final GlobalKey<BeamerState>? beamerKey;
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey(NavScreen.path),
          type: BeamPageType.sharedAxisTransion,
          child: NavScreen(
            beamerKey: beamerKey,
          ),
        ),
      ];

  @override
  List get pathBlueprints => [NavScreen.path];
}
