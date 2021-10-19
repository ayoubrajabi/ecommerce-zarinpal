import 'package:beamer/beamer.dart';
import 'package:ecommerce_zarinpal/constants/constants.dart';
import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:ecommerce_zarinpal/ui/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VerifySucsses extends StatelessWidget {
  const VerifySucsses({
    Key? key,
    this.beamerKey,
    this.verifyState,
    this.authority,
  }) : super(key: key);
  final GlobalKey<BeamerState>? beamerKey;
  final VerifyIsLoded? verifyState;
  final String? authority;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              height: 150.0,
              width: double.infinity,
              child: Lottie.asset(
                LottieAssets.checkMarkSuccess!,
                repeat: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'پرداخت اینترنتی شما با موفقیت انجام شد\n و با شماره ${authority!.replaceRange(0, 30, '')} در سیستم ذخیره گردید',
              textAlign: TextAlign.right,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('تاریخ:    1400/07/20'),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      CupertinoIcons.calendar,
                      color: Colors.amber,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('مبلغ:     ${verifyState!.amount} تومان'),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Icon(
                      CupertinoIcons.creditcard,
                      color: Colors.amber,
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            endIndent: 30.0,
            indent: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('کد رهگیری:  ${verifyState!.refID}'),
                const Icon(
                  Icons.card_membership,
                  color: Colors.amber,
                )
              ],
            ),
          ),
          const Divider(
            endIndent: 30.0,
            indent: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('شناسه پرداخت:  ${authority!.replaceRange(0, 30, '')}'),
                const Icon(
                  Icons.verified,
                  color: Colors.amber,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40.0,
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
          const Spacer(),
        ],
      ),
    );
  }
}
