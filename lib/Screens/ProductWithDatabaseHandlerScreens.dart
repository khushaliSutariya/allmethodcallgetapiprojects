import 'package:flutter/material.dart';
import 'package:shopingapp/resources/URLResources.dart';
import 'package:shopingapp/utility/ApiHandler.dart';

import '../utility/ErrorHandler.dart';
class ProductWithDatabaseHandlerScreens extends StatefulWidget {
  const ProductWithDatabaseHandlerScreens({Key key}) : super(key: key);

  @override
  State<ProductWithDatabaseHandlerScreens> createState() => _ProductWithDatabaseHandlerScreensState();
}

class _ProductWithDatabaseHandlerScreensState extends State<ProductWithDatabaseHandlerScreens> {
  List<dynamic> allproducts;

  getdata() async {
    print("Method Call");
    await ApiHandler.getCall(URLResources.VIEW_PRODUCTS).then((json) {
      setState(() {
        allproducts = json;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
        ),
        body: (allproducts!=null)?ListView.builder(
          itemCount: allproducts.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.lightGreen.shade100,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.network(allproducts[index]["image"].toString(),height: 60.0),
                        SizedBox(width: 10.0,),
                        Text(
                          "Name:-" +
                              allproducts[index]["name"]
                                  .toString(),
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ):Center(
          child: CircularProgressIndicator(),
        )
    );



  }
}
