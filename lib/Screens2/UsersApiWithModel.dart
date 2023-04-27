import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopingapp/models/Users.dart';
import 'package:shopingapp/resources/URLResources.dart';
import 'package:http/http.dart' as http;

class UsersApiWithModel extends StatefulWidget {
  const UsersApiWithModel({Key key}) : super(key: key);

  @override
  State<UsersApiWithModel> createState() => _UsersApiWithModelState();
}

class _UsersApiWithModelState extends State<UsersApiWithModel> {
  List<Users> allusers;
  bool isloding = false;
  getusers() async {
    setState(() {
      isloding = true;
    });
    Uri url = Uri.parse(URLResources.USERS_ACCOUNT);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      setState(() {
        allusers = json.map<Users>((obj)=> Users.fromJson(obj)).toList();
        isloding = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getusers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("UsersApiWithModel"),
        ),
        body: (isloding)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: allusers.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      color: Colors.amber.shade50,
                      height: 50.0,
                      child: Column(
                        children: [
                          Text(allusers[index].name.toString()),
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
