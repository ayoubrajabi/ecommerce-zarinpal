import 'package:ecommerce_zarinpal/data/data.dart';
import 'package:ecommerce_zarinpal/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String path = 'main-screen';

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        controller: ScrollController(),
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: itemRailData.length * 445.0,
              width: double.infinity,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio: 1.0,
                  mainAxisExtent: 350.0,
                ),
                itemCount: tshirtData.length,
                itemBuilder: (context, index) {
                  final tshirtInfo = tshirtData[index];
                  return TshirtCardWidget(
                    tshirtInfo: tshirtInfo,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
