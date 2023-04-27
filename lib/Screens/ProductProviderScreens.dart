import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopingapp/Providers/ProductsProvider.dart';

class ProductProviderScreens extends StatefulWidget {
  const ProductProviderScreens({Key key}) : super(key: key);

  @override
  State<ProductProviderScreens> createState() => _ProductProviderScreensState();
}

class _ProductProviderScreensState extends State<ProductProviderScreens> {
  ProductsProvider provider;
  getproduct() async {
    await provider.Viewproduct();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductsProvider>(context, listen: false);
    getproduct();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductsProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(title: Text("ProductProvider")),
        body: (provider.loading)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: provider.allproducts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      color: Colors.redAccent.shade100,
                      height: 50.0,
                      child: Column(
                        children: [
                          Text(provider.allproducts[index].name.toString()),
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
