import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopingapp/models/Products.dart';
import 'package:shopingapp/resources/URLResources.dart';
import 'package:shopingapp/utility/ApiHandler.dart';

class ProductwithDatabaseModelScreens extends StatefulWidget {
  const ProductwithDatabaseModelScreens({Key key}) : super(key: key);

  @override
  State<ProductwithDatabaseModelScreens> createState() =>
      _ProductwithDatabaseModelScreensState();
}

class _ProductwithDatabaseModelScreensState
    extends State<ProductwithDatabaseModelScreens> {
  List<Products> allproducts;
  bool isloded = false;
  getdata() async {
    setState(() {
      isloded = true;
    });
     ApiHandler.getCall(URLResources.VIEW_PRODUCTS).then((json) {
      setState(() {
        allproducts =
            json.map<Products>((obj) => Products.fromJson(obj)).toList();
        isloded = false;
      });
      return json;
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
          title: Text("ProductwithDatabaseModel"),
        ),
        body: (isloded)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: allproducts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      height: 100.0,
                      color: Colors.brown.shade50,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(allproducts[index].image.toString(),height: 80.0,),
                              SizedBox(width: 10.0,),
                              Text(allproducts[index].name.toString()),
                            ],
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
