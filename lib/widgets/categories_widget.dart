import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grosaryapp/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {Key? key,
      required this.color,
      required this.catText,
      required this.imgPath})
      : super(key: key);
  final String catText, imgPath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    final thekeState = Provider.of<DarkThemeProvider>(context);
    final Color color = thekeState.getDarkTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: () {

      },
      child: Container(
        height: _screenWidth * 0.6,
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.7), width: 2),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              // Container for the image
              child: Container(
                height: _screenWidth * 0.3,
                width: _screenWidth * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage(imgPath),
                        fit: BoxFit.fill)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                catText,
                style: TextStyle(
                    color: color, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
