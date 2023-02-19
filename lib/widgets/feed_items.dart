import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grosaryapp/servises/utils.dart';
import 'package:grosaryapp/widgets/heart_btn_widget.dart';
import 'package:grosaryapp/widgets/price_widget.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({Key? key}) : super(key: key);

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    _quantityController.text = "1";
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              FancyShimmerImage(
                imageUrl:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Granny_smith_and_cross_section.jpg/800px-Granny_smith_and_cross_section.jpg",
                height: size.width * 0.18,
                width: size.width * 0.2,
                boxFit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Title",
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    HeartBtnWidget()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex:2,
                      child: PriceWidget(
                        isOnSale: true,
                        price: 4.5,
                        salePrice: 2.99,
                        textPrice: _quantityController.text,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          FittedBox(
                              child: Text(
                            "KG",
                            style: TextStyle(
                                color: color,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                              child: TextFormField(
                            controller: _quantityController,
                            key: ValueKey("10\$"),
                            style: TextStyle(color: color, fontSize: 18),
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            cursorColor: Colors.green,

                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9.]")),
                            ],
                                onChanged: (value){
                              setState(() {
                                if(value.isEmpty){
                                  _quantityController.text="1";
                                }
                                else{

                                }
                              });
                                },
                                onSaved: (value){},
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Add to Cart",
                      style: TextStyle(fontSize: 20, color: color)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Theme.of(context).cardColor),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12))))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
