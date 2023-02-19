import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grosaryapp/inner_screens/on_sale_screen.dart';
import 'package:grosaryapp/servises/global_methods.dart';
import 'package:grosaryapp/servises/utils.dart';
import 'package:grosaryapp/widgets/feed_items.dart';
import 'package:grosaryapp/widgets/on_sele_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SharedPreferences.setMockInitialValues({});
    final List<String> _offerImages = [
      'lib/assets/images/offers/offers1.png',
      'lib/assets/images/offers/offers2.png',
      'lib/assets/images/offers/offers3.png',
      'lib/assets/images/offers/offres4.png',
      'lib/assets/images/offers/offers2.png'
    ];
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    final Utils utils = Utils(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _offerImages[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: _offerImages.length,
                pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.red)),
                // control: SwiperControl(color: Colors.green),
              ),
            ),
            TextButton(
                onPressed: () {
                  GlobalMethods.navigateTo(context: context, routeName: InnerOnsaleScreen.routeName);
                },
                child: Text(
                  "View All",
                  style: TextStyle(fontSize: 20),
                )),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      Text(
                        "On sele".toUpperCase(),
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Container(
                    height: size.height * 0.24,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return OnSeleWidget();
                          }),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Our Products",
                    style: TextStyle(
                        fontSize: 22, color: color, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Browse All",
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
            ),
            GridView.count(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.58),
              children: List.generate(4, (index) {
                return FeedsWidget();
              }),
            )
          ],
        ),
      ),
    );
  }
}
