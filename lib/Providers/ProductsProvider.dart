
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shopingapp/models/Products.dart';
import 'package:shopingapp/resources/URLResources.dart';
import 'package:shopingapp/utility/ApiHandler.dart';

class ProductsProvider with ChangeNotifier {
  List<Products> allproducts;
  bool loading = false;
  Viewproduct() async {
    loading = true;
    await ApiHandler.getCall(URLResources.USERS_ACCOUNT).then((json) {
      allproducts =
          json.map<Products>((obj)=>Products.fromJson(obj)).toList();
      notifyListeners();
      loading = false;
    });
  }
}
