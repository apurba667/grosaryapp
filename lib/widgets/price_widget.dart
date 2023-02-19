import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grosaryapp/servises/utils.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {Key? key,
      required this.isOnSale,
      required this.price,
      required this.salePrice,
      required this.textPrice})
      : super(key: key);
  final double salePrice, price;
  final String textPrice;
  final bool isOnSale;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    double usedPrice = isOnSale? salePrice :price;
    return FittedBox(
      child: Row(
        children: [
          Text(
            "\$${(usedPrice * int.parse(textPrice)).toStringAsFixed(2)}",
            style: TextStyle(color: Colors.green, fontSize: 22),
          ),
          SizedBox(
            width: 6,
          ),
          Visibility(
            visible: isOnSale?true:false,
            child: Text(
              "\$${(price * int.parse(textPrice)).toStringAsFixed(2)}",
              style: TextStyle(
                  fontSize: 15,
                  color: color,
                  decoration: TextDecoration.lineThrough),
            ),
          )
        ],
      ),
    );
  }
}
