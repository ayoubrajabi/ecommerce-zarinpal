import 'package:beamer/beamer.dart';
import 'package:ecommerce_zarinpal/constants/constants.dart';
import 'package:ecommerce_zarinpal/ui/router/router.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VerifyErrorWidget extends StatelessWidget {
  const VerifyErrorWidget({
    Key? key,
    this.beamerKey,
  }) : super(key: key);
  final GlobalKey<BeamerState>? beamerKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              height: 150.0,
              width: double.infinity,
              child: Lottie.asset(
                LottieAssets.errorMark!,
                repeat: false,
              ),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40.0),
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            decoration: BoxDecoration(
                color: Colors.red.shade100.withAlpha(120),
                borderRadius: BorderRadius.circular(10.0)),
            child: Center(
              child: Text(
                'پرداخت اینترنتی شما با شکست مواجه شد',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.red.shade800,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 90.0,
          ),
          ElevatedButton(
            onPressed: () => context.beamTo(
              NavLocation(
                beamerKey: beamerKey,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.amber,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 20.0),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 8.0),
              child: Text('بازگشت به صفحه اصلی'),
            ),
          ),
        ],
      ),
    );
  }
}
