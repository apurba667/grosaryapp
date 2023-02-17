import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grosaryapp/provider/dark_theme_provider.dart';
import 'package:grosaryapp/screens/cart_screen.dart';
import 'package:grosaryapp/screens/categoris_screen.dart';
import 'package:grosaryapp/screens/home_page.dart';
import 'package:grosaryapp/screens/user_screen.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages=[
    {'page': const HomePage(), 'title': "Home Screen"},
    {'page': const CategoriesScreen(), 'title': "Categories Screen"},
    {'page': const CartScreen(), 'title': "Cart Screen"},
    {'page': const UserScreen(), 'title': "User Screen"},

  ];
  void _selectedPage(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;
    return  Scaffold(
      // appBar: AppBar(
      //
      //   title: Text(_pages[_selectedIndex]['title']),
      // ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: themeState.getDarkTheme ?Theme.of(context).cardColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        unselectedItemColor: isDark? Colors.white10:Colors.black12,
        selectedItemColor: isDark? Colors.lightBlue[200]:Colors.black87,
        onTap: _selectedPage,
        items:<BottomNavigationBarItem> [
        BottomNavigationBarItem(icon: Icon(_selectedIndex == 0 ? IconlyBold.home:IconlyLight.home),
        label: "Home"),
        BottomNavigationBarItem( icon:  Icon(_selectedIndex == 1 ? IconlyBold.category: IconlyLight.category),
            label: "Category"),
          BottomNavigationBarItem(icon: Icon(_selectedIndex == 2 ? IconlyBold.buy: IconlyLight.buy),
              label: "Cart"),
          BottomNavigationBarItem(icon: Icon(_selectedIndex == 3 ? IconlyBold.user2: IconlyLight.user2),
              label: "Profire"),
      ],),
    );
  }
}
