import 'package:flutter/material.dart';
import 'package:grosaryapp/servises/utils.dart';
import 'package:grosaryapp/widgets/categories_widget.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({Key? key}) : super(key: key);


  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List <Map<String, dynamic>> catInfo = [
    {'imgPath': "lib/assets/images/categories/grains.png", "catText": "Grains"},
    {'imgPath': "lib/assets/images/categories/nuts.png", "catText": "Nuts"},
    {'imgPath': "lib/assets/images/categories/spices.png", "catText": "Spices"},
    {
      'imgPath': "lib/assets/images/categories/spinach.png",
      "catText": "Spinach"
    },
    {'imgPath': "lib/assets/images/categories/veg.png", "catText": "Veg"},
    {'imgPath': "lib/assets/images/categories/grains.png", "catText": "Grains"}
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          "Categories",
          style: TextStyle(color: color),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 220/230,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(6, (index) {
            return CategoriesWidget(
              catText: catInfo[index]['catText'],
              color: Colors.amber,
              imgPath: catInfo[index]['imgPath'],
            );
          }),
        ),
      ),
    );
  }
}
