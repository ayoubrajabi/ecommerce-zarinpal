import 'package:ecommerce_zarinpal/ui/screens/nav_screen.dart';
import 'package:ecommerce_zarinpal/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links/uni_links.dart';
import 'package:zarinpal/zarinpal.dart';

import 'logic/logic.dart';

void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  EcommerceApp({Key? key}) : super(key: key);

  final AppTheme _appTheme = AppTheme();
  final BlocProvidersList _blocProvidersList = BlocProvidersList();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _blocProvidersList.blocProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _appTheme.theme(),
        home: StreamBuilder(
          stream: uriLinkStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              Uri uri = snapshot.data;
              // final list = uri.queryParametersAll.entries.toList();
              final status = uri.queryParameters['Status'];
              final authority = uri.queryParameters['Authority'];

              return SafeArea(
                child: Scaffold(
                    body: Center(
                        child: Column(
                  children: [
                    Text('status of payment is:  $status'),
                    Text('authority of payment is:  $authority'),
                    ElevatedButton(
                      onPressed: () {
                        PaymentRequest _paymentRequest = PaymentRequest();
                        _paymentRequest.setIsSandBox(true);
                        _paymentRequest.setAmount(10000);
                        _paymentRequest.setMerchantID(
                            "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx");
                        _paymentRequest.setAuthority(authority);

                        ZarinPal().verificationPayment(
                            status!, authority!, _paymentRequest,
                            (isSucsses, refID, paymentRequest) {
                          print(refID);
                          print(isSucsses);
                        });
                      },
                      child: Text('test'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(status);
                        print(authority);
                      },
                      child: Text('test2'),
                    ),
                  ],
                ))),
              );
            } else {
              return const NavScreen();
            }
          },
        ),
      ),
    );
  }
}
