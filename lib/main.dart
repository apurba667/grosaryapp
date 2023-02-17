import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grosaryapp/const/theme_data.dart';
import 'package:grosaryapp/provider/dark_theme_provider.dart';
import 'package:grosaryapp/screens/bottom_bar_screen.dart';
import 'package:grosaryapp/screens/categoris_screen.dart';
import 'package:grosaryapp/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(MyApp());
  });
}
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
    await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
      Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Grosary App',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: BottomBarScreen());
      }),
    );
  }
}