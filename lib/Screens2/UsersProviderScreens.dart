import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopingapp/Providers/UsersProvider.dart';

class UsersProviderScreens extends StatefulWidget {
  const UsersProviderScreens({Key key}) : super(key: key);

  @override
  State<UsersProviderScreens> createState() => _UsersProviderScreensState();
}

class _UsersProviderScreensState extends State<UsersProviderScreens> {
  UsersProvider provider;
  getusers() async {
    await provider.Viewusers();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<UsersProvider>(context, listen: false);
    getusers();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<UsersProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("UsersProvider"),
      ),
      body: (provider.isloading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
        itemCount: provider.allusers.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    color: Colors.amberAccent.shade100,
                    height: 50.0,
                    child: Column(
                      children: [
                        Text(provider.allusers[index].name.toString()),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
