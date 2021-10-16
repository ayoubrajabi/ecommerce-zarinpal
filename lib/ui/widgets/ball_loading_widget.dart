import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BallLoadingWidget extends StatelessWidget {
  const BallLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        duration: const Duration(milliseconds: 1500),
        size: 50.0,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
