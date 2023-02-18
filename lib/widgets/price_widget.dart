import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grosaryapp/servises/utils.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return FittedBox(
      child: Row(
        children: [
          Text(
            "1.59\$",
            style: TextStyle(color: Colors.green, fontSize: 22),
          ),
          SizedBox(width: 6,),
          Text("2.50\$",style: TextStyle(fontSize: 15,color: color,decoration: TextDecoration.lineThrough),)
        ],
      ),
    );
  }
}
