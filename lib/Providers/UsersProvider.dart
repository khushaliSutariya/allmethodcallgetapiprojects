
import 'package:flutter/cupertino.dart';
import 'package:shopingapp/resources/URLResources.dart';
import 'package:shopingapp/utility/ApiHandler.dart';

import '../models/Users.dart';

class UsersProvider with ChangeNotifier{
  List<Users> allusers;
  bool isloading = false;
  Viewusers(){
    isloading = true;
    ApiHandler.getCall(URLResources.USERS_ACCOUNT).then((json){
      allusers = json.map<Users>((obj)=>Users.fromJson(obj)).toList();
      notifyListeners();
      isloading = false;
    });
  }
}