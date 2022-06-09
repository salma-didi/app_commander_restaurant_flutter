import 'package:cammander_flutter/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class PlatPage extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 7,
        title: "Pizza",
        price: 80.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/pizza.jpg?alt=media&token=97299969-2be3-4637-b851-fc9fae61521f",
        qty: 1),
    Product(
        id: 8,
        title: "Viande",
        price: 40.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/plat_principal.jpg?alt=media&token=293224cb-386f-4a22-8f28-9576fb748489",
        qty: 1),
    Product(
        id: 9,
        title: "Hamberger",
        price: 40.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/hamburger.jpeg?alt=media&token=8bc10650-8c92-4cb0-93f5-b47076ca98d0",
        qty: 1),
    Product(
        id: 10,
        title: "Poulet au citron",
        price: 60.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/poulet%20au%20citron.jpeg?alt=media&token=a54a328e-fd4d-4178-8882-a19f8904ac29",
        qty: 1),
    Product(
        id: 11,
        title: "Salamon",
        price: 70.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/salmon.jpg?alt=media&token=b4616782-1de3-49d4-afbd-3ead3f760000",
        qty: 1),
    Product(
        id: 12,
        title: "tartiflette",
        price: 40.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/tartiflette.webp?alt=media&token=193f4323-038e-4ef6-81fd-023e8957a0c2",
        qty: 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Plat Principal"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          )
        ],
      ),
      body:
      GridView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: _products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 0.8),
        itemBuilder: (context, index){
          return ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
                return Card( child: Column( children: <Widget>[
                  Image.network(_products[index].imgUrl, height: 120, width: 120,),
                  Text(_products[index].title, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("\$"+_products[index].price.toString()),
                  //OutlinedButtonTheme(
                  //child: Text("Add"),
                  RaisedButton(
                      child: Text("Add"),
                      onPressed: () => model.addProduct(_products[index]))
                  //)
                ]));
              });
        },
      ),


    );
  }
}