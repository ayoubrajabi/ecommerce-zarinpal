import 'package:beamer/beamer.dart';
import 'package:ecommerce_zarinpal/ui/screens/screens.dart';
import 'package:flutter/material.dart';

class UserLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey(UserScreen.path),
          type: BeamPageType.noTransition,
          child: UserScreen(),
        ),
      ];

  @override
  List get pathBlueprints => [UserScreen.path];
}
