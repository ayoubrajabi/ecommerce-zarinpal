import 'package:ecommerce_zarinpal/data/model/tshirt_model.dart';
import 'package:ecommerce_zarinpal/ui/widgets/main_screen/mainscreenwidgets.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    Key? key,
    @required this.tshirtInfo,
  }) : super(key: key);

  final TshirtModel? tshirtInfo;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with SingleTickerProviderStateMixin {
  int? tshirtSizeIndex = 0;

  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: _theme.scaffoldBackgroundColor,
        appBar: AppBar(
          leading: AppBarCustomButton(
            onPressed: () => Navigator.pop(context),
            color: const Color(0xff58485b),
            icon: IconlyLight.arrow_right_2,
            iconColor: Colors.white,
            margin: const EdgeInsets.only(right: 10.0),
          ),
          actions: const [
            AppBarCustomButton(
              color: Colors.white,
              icon: IconlyLight.bag,
              iconColor: Color(0xff58485b),
              margin: EdgeInsets.only(left: 10.0),
            ),
          ],
          toolbarHeight: 90.0,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Stack(
              children: [
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: widget.tshirtInfo!.imageUrl!,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                const Positioned(
                  bottom: 20.0,
                  left: 0.0,
                  child: AppBarCustomButton(
                    icon: IconlyLight.heart,
                    color: Colors.transparent,
                    iconColor: Color(0xff58485b),
                    margin: EdgeInsets.only(left: 10.0),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List<FittedBox>.generate(
                          2,
                          (i) => FittedBox(
                            child: Text(
                              i == 0
                                  ? widget.tshirtInfo!.name!
                                  : '${widget.tshirtInfo!.price!}  تومان',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text('انتخاب سایز'),
                    SizedBox(
                      height: 80.0,
                      width: double.infinity,
                      child: Row(
                        children: List<GestureDetector>.generate(
                          4,
                          (i) {
                            final tshirtSize = <String>['S', 'M', 'L', 'XL'];
                            return GestureDetector(
                              onTap: () => setState(() {
                                tshirtSizeIndex = i;
                              }),
                              child: Container(
                                width: 50.0,
                                height: 55.0,
                                margin: const EdgeInsets.only(
                                    left: 10.0, top: 20.0),
                                decoration: BoxDecoration(
                                  color: tshirtSizeIndex == i
                                      ? const Color(0xfffaeccd)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                    width: 0.8,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    tshirtSize[i],
                                    style: TextStyle(
                                      color: tshirtSizeIndex == i
                                          ? Colors.orange
                                          : Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    TabBar(
                      controller: _tabController,
                      padding: const EdgeInsets.only(left: 150.0, top: 15.0),
                      labelColor: Colors.orangeAccent,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: const TextStyle(
                        fontFamily: 'Shabnam',
                        fontSize: 14.0,
                      ),
                      indicatorColor: Colors.orangeAccent,
                      tabs: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('توضیجات'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('بررسی'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        height: 130.0,
                        width: double.infinity,
                        child: TabBarView(
                          controller: _tabController,
                          children: const [
                            Text(
                              'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. ',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              'کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد.',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xfff99c00),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 0.0, vertical: 30.0)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('افزودن به سبد خرید'),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(IconlyLight.bag),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
