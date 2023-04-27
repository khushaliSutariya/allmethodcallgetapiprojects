import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopingapp/resources/URLResources.dart';
import 'package:http/http.dart' as http;

class UsersApiScreens extends StatefulWidget {
  const UsersApiScreens({Key key}) : super(key: key);

  @override
  State<UsersApiScreens> createState() => _UsersApiScreensState();
}

class _UsersApiScreensState extends State<UsersApiScreens> {
  Future<List> allusers;
  Future<List> getusers() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/users");
    var response = await http.get(url);
    print("========");
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      return json;
    }
    print("=======dvc");
    return [];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      allusers = getusers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UsersApi"),
      ),
      body: FutureBuilder(
        future: allusers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Center(child: Text("No Data Found"));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      color: Colors.greenAccent.shade100,
                      height: 60.0,
                      child: Column(
                        children: [
                          Text(snapshot.data[index]["name"].toString()),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data[index]["avatar"].toString()),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
