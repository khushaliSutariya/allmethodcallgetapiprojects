import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopingapp/resources/URLResources.dart';

import '../utility/ApiHandler.dart';
class UsersWithDatabaseHandlerScreens extends StatefulWidget {
  const UsersWithDatabaseHandlerScreens({Key key}) : super(key: key);

  @override
  State<UsersWithDatabaseHandlerScreens> createState() => _UsersWithDatabaseHandlerScreensState();
}

class _UsersWithDatabaseHandlerScreensState extends State<UsersWithDatabaseHandlerScreens> {
  List<dynamic> allusers;
  getdata()async{
    ApiHandler.getCall(URLResources.USERS_ACCOUNT).then((json) {
      setState(() {
        allusers = json;
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
        title: Text("UsersWithDatabaseHandler"),
      ),
      body: (allusers!=null)?ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: Container(
            color: Colors.cyanAccent.shade100,
            height: 50.0,
            child: Column(children: [
              Text(allusers[index]["name"].toString()),
            ],),
          ),
        );
      },):Center(
        child: CircularProgressIndicator(),
      )
      
    );
  }
}
