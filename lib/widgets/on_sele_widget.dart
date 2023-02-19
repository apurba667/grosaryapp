import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grosaryapp/servises/utils.dart';
import 'package:grosaryapp/widgets/price_widget.dart';

class OnSeleWidget extends StatefulWidget {
  const OnSeleWidget({Key? key}) : super(key: key);

  @override
  State<OnSeleWidget> createState() => _OnSeleWidgetState();
}

class _OnSeleWidgetState extends State<OnSeleWidget> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final theme = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Material(
      color: Theme.of(context).cardColor.withOpacity(0.9),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FancyShimmerImage(
                    imageUrl:
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Granny_smith_and_cross_section.jpg/800px-Granny_smith_and_cross_section.jpg",
                    height: size.width * 0.22,
                    width: size.width*0.22,
                    boxFit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      Text("1kG",
                          style: TextStyle(
                              color: color,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              IconlyLight.bag2,
                              size: 22,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              IconlyLight.heart,
                              size: 22,
                              color: color,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              PriceWidget(isOnSale: true,
                price: 4.5,
                salePrice: 2.99,
                textPrice: "1",),
              SizedBox(
                height: 5,
              ),
              Text(
                "Product Title ",
                style: TextStyle(
                    color: color, fontSize: 16, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
