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
  final TextEditingController _addressTextController = TextEditingController();

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;

    //function for show dialog
    Future<void> _showAddressDialog()async{
       await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Update"),
              content: TextField(
                onChanged: (value) {
                  //print(_addressTextController.text);
                },
                controller: _addressTextController,
                maxLines: 3,
                decoration:
                InputDecoration(hintText: "Your Address"),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    }, child: Text("Cancel",style: TextStyle(color: Colors.cyan),)),
                TextButton(
                    onPressed: () {}, child: Text("Update"))
              ],
            );
          });

    }
    //function for show dialog
    Future<void> _showLogoutDialog()async{
       await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Row(children: [
                Image.asset("lib/assets/images/warning.png",height: 20,width: 20,fit: BoxFit.fill,),
                SizedBox(width: 20,),
                Text("Sign out")
              ],),
              content: const Text("Do you want to sign  out?"),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("Cancel",style: TextStyle(color: Colors.cyan),)),
                TextButton(onPressed: (){}, child: Text("Sign out",style: TextStyle(color: Colors.red),))
              ],
            );
          });

    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 65,
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
                        text: "My name",
                        style: TextStyle(
                            color: isDark ? Colors.white : Colors.black87,
                            fontSize: 25,
                            fontWeight: FontWeight.normal),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {

                          })
                  ])),
              SizedBox(
                height: 5,
              ),
              Text(
                "apurba@gmail.com",
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2,
              ),

              // for address
              _listTiles(
                  title: "Address",
                  subtitle: "My subtitle",
                  icon: IconlyLight.profile,
                  onPressed: () async {
                    await _showAddressDialog();
                  }),

              // for Orders
              _listTiles(
                  title: "Orders", icon: IconlyLight.bag, onPressed: () {}),

              // for Wishlist
              _listTiles(
                  title: "Wishlist", icon: IconlyLight.show, onPressed: () {}),

              //for views
              _listTiles(
                  title: "Viewed", icon: IconlyLight.heart, onPressed: () {}),

              //for forger password
              _listTiles(
                  title: "Forget Password",
                  icon: IconlyLight.lock,
                  onPressed: () {}),

              //for the theme
              SwitchListTile(
                title: Text(
                  'Theme',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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

              // for logout button
              _listTiles(
                  title: "Logout", icon: IconlyLight.logout, onPressed: () {
                _showLogoutDialog();
              }),
            ],
          ),
        ),
      ),
    );
  }

  //function for all listtiles
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
