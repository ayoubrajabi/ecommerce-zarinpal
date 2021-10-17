import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BallLoadingWidget extends StatelessWidget {
  const BallLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitThreeBounce(
        duration: Duration(milliseconds: 1500),
        size: 40.0,
        color: Colors.amber,
      ),
    );
  }
}
