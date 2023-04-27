import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopingapp/Providers/ProductsProvider.dart';
import 'package:shopingapp/Providers/UsersProvider.dart';

import 'Screens/HomeScreens.dart';
import 'Screens/ProductProviderScreens.dart';
import 'Screens/ProductWithDatabaseHandlerScreens.dart';
import 'Screens/ProductWithModel.dart';
import 'Screens/ProductwithDatabaseModelScreens.dart';
import 'Screens2/UsersApiScreens.dart';
import 'Screens2/UsersApiWithModel.dart';
import 'Screens2/UsersProviderScreens.dart';
import 'Screens2/UsersWithDatabaseHandlerScreens.dart';
import 'Screens2/UsersWithDatabaseModelScreens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UsersProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UsersProviderScreens(),
      ),
    );
  }
}
