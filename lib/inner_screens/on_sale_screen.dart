import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grosaryapp/servises/utils.dart';
import 'package:grosaryapp/widgets/on_sele_widget.dart';

class InnerOnsaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";
  const InnerOnsaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    final Utils utils = Utils(context);
    final themeData = utils.getTheme;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(IconlyLight.arrowLeft2,color: color,),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Products on Sale",style: TextStyle(color: color, fontSize: 24,fontWeight: FontWeight.bold),),
      ),
      body:  Padding(
        padding: const EdgeInsets.only(left: 10),
        child: GridView.count(
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: size.width / (size.height * 0.45),
          children: List.generate(16, (index) {

            return OnSeleWidget();
          }),
        ),
      ),
    );
  }
}
