import 'package:ecommerce_zarinpal/data/data.dart';
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
          SliverAppBar(
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
              preferredSize: Size(double.infinity, 60.0),
              child: ItemsRailBar(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 2000.0,
              width: double.infinity,
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

class ItemsRailBar extends StatefulWidget {
  const ItemsRailBar({Key? key}) : super(key: key);

  @override
  State<ItemsRailBar> createState() => _ItemsRailBarState();
}

class _ItemsRailBarState extends State<ItemsRailBar> {
  int? indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: double.infinity,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        itemCount: itemRailData.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final _info = itemRailData[index];
          return GestureDetector(
            onTap: () => setState(() {
              indexSelected = index;
            }),
            child: Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                color: _info.name == itemRailData[indexSelected!].name
                    ? const Color(0xfffaeccd)
                    : const Color(0xfff7f7f7),
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Center(
                  child: Text(
                _info.name!,
                style: TextStyle(
                  color: _info.name == itemRailData[indexSelected!].name
                      ? Colors.orange
                      : Colors.grey.shade400,
                ),
              )),
            ),
          );
        },
      ),
    );
  }
}
