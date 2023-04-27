import 'package:flutter/material.dart';
import 'package:shopingapp/models/Users.dart';
import 'package:shopingapp/resources/URLResources.dart';
import 'package:shopingapp/utility/ApiHandler.dart';

class UsersWithDatabaseModelScreens extends StatefulWidget {
  const UsersWithDatabaseModelScreens({Key key}) : super(key: key);

  @override
  State<UsersWithDatabaseModelScreens> createState() =>
      _UsersWithDatabaseModelScreensState();
}

class _UsersWithDatabaseModelScreensState
    extends State<UsersWithDatabaseModelScreens> {
  List<Users> allusers;
  bool loading = false;
  getdata() async {
    setState(() {
      loading = true;
    });
    await ApiHandler.getCall(URLResources.USERS_ACCOUNT).then((json) {
      setState(() {
        allusers = json.map<Users>((obj) => Users.fromJson(obj)).toList();
        loading = false;
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
          title: Text("UsersWithDatabaseModel"),
        ),
        body: (loading)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: allusers.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      color: Colors.green.shade50,
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
