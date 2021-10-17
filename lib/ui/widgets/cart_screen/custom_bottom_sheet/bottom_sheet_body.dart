import 'package:ecommerce_zarinpal/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets.dart';

class CustomBottomSheetBody extends StatefulWidget {
  const CustomBottomSheetBody({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheetBody> createState() => _CustomBottomSheetBodyState();
}

class _CustomBottomSheetBodyState extends State<CustomBottomSheetBody> {
  int? selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      width: double.infinity,
      color: _theme.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'روش پرداخت',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11.0,
            ),
          ),
          SizedBox(
            height: 270.0,
            width: double.infinity,
            child: ListView.builder(
              itemCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final imageUrl = [
                  'assets/images/zarinpal.png',
                  'assets/images/idpay.png',
                ];

                return CustomPaymentButton(
                  color: index == 2 ? Colors.white10 : Colors.white,
                  onPressed: () {
                    if (index != 2) {
                      setState(() {
                        selectedIndex = index;
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: index != 2
                        ? [
                            const SizedBox(
                              width: 15.0,
                            ),
                            Opacity(
                              opacity: selectedIndex == index ? 1.0 : 0.4,
                              child: Image.asset(
                                imageUrl[index],
                                width: 260.0,
                              ),
                            ),
                            if (selectedIndex == index)
                              const Icon(
                                Icons.check_circle,
                                color: Colors.amber,
                              )
                            else
                              const SizedBox(
                                width: 24.0,
                              ),
                          ]
                        : [
                            const Text(
                              'افزودن روش پرداخت',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.0,
                              ),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ],
                  ),
                );
              },
            ),
          ),
          const Divider(
            color: Colors.white12,
            endIndent: 30.0,
            indent: 30.0,
            height: 5.0,
          ),
          BlocBuilder<StartPaymentBloc, StartPaymentState>(
            builder: (context, state) {
              if (state is PaymentIsLoading) {
                return CustomPaymentButton(
                  color: Colors.amber.shade100.withAlpha(50),
                  child: const BallLoadingWidget(),
                  onPressed: () {},
                );
              }
              if (state is PaymentNotStarted) {
                return CustomPaymentButton(
                  color: Colors.amber.shade100.withAlpha(50),
                  child: const Text(
                    'پرداخت',
                    style: TextStyle(color: Colors.amber),
                  ),
                  onPressed: () async {
                    Payment _payment = Payment();
                    _payment.start(context);
                  },
                );
              } else if (state is PaymentIsLoaded) {
                launchUrl() async {
                  await canLaunch(state.url!)
                      ? await launch(state.url!)
                      : throw 'Could not launch url';
                }

                launchUrl();

                context.read<StartPaymentBloc>().add(Refresh());
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
