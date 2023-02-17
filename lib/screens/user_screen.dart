import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  @override
  Widget build(BuildContext context) {

    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            RichText(
                text: TextSpan(
                    text: "Hi,  ",
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: "My name",style: TextStyle(
                      color: isDark? Colors.white:Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.normal

                  ),
                    recognizer: TapGestureRecognizer()..onTap = (){
                      print("My name is pressed");
                    }
                  )
                ]
                )),
            SizedBox(
              height: 5,
            ),
            Text("apurba@gmail.com",style: TextStyle( color: isDark? Colors.white:Colors.black87,),),

            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 2,
            ),
            _listTiles(
                title: "Address",
                subtitle: "My subtitle",
                icon: IconlyLight.profile,
                onPressed: () {}),
            _listTiles(title: "Orders", icon: IconlyLight.bag, onPressed: () {}),
            _listTiles(
                title: "Wishlist", icon: IconlyLight.show, onPressed: () {}),
            _listTiles(
                title: "Viewed", icon: IconlyLight.heart, onPressed: () {}),
            _listTiles(
                title: "Forget Password",
                icon: IconlyLight.lock,
                onPressed: () {}),
            SwitchListTile(
              title: Text(
                'Theme',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
              ),
              secondary: Icon(themeState.getDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onChanged: (bool value) {
                setState(() {
                  themeState.setDarkTheme = value;
                });
              },
              value: themeState.getDarkTheme,
            ),
            _listTiles(
                title: "Logout", icon: IconlyLight.logout, onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _listTiles(
      {required String title,
      String? subtitle,
      required IconData icon,
      required Function onPressed}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle == null ? "" : subtitle),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
