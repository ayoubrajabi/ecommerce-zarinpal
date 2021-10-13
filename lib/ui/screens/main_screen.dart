import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      backgroundColor: _theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: SliverAppBar(
              floating: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              toolbarHeight: 90.0,
              actions: List<AppBarCustomButton>.generate(
                2,
                (i) {
                  final _icons = [
                    IconlyLight.search,
                    IconlyLight.filter,
                  ];
                  return AppBarCustomButton(
                    icon: _icons[i],
                    color: Colors.transparent,
                    iconColor: const Color(0xff58485b),
                    margin: const EdgeInsets.only(right: 10.0),
                  );
                },
              ),
              leading: AppBarCustomButton(
                icon: IconlyBold.category,
                color: _theme.primaryColor,
                iconColor: Colors.white,
                margin: const EdgeInsets.only(left: 10.0),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 2000.0,
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarCustomButton extends StatelessWidget {
  const AppBarCustomButton({
    Key? key,
    @required this.icon,
    @required this.color,
    @required this.iconColor,
    @required this.margin,
  }) : super(key: key);

  final IconData? icon;
  final Color? color;
  final Color? iconColor;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black12,
          )),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: iconColor,
          size: 20.0,
        ),
      ),
    );
  }
}
