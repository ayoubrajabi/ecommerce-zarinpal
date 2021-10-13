import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../widgets.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: _theme.scaffoldBackgroundColor,
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
            margin: const EdgeInsets.only(left: 10.0),
          );
        },
      ),
      leading: AppBarCustomButton(
        icon: IconlyBold.category,
        color: _theme.primaryColor,
        iconColor: Colors.white,
        margin: const EdgeInsets.only(right: 10.0),
      ),
      bottom: const PreferredSize(
        preferredSize: Size(double.infinity, 50.0),
        child: ItemsRailBar(),
      ),
    );
  }
}
