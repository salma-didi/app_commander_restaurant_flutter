import 'package:cammander_flutter/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class EntreePage extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 1,
        title: "Entrée spéciale",
        price: 20.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/entree.jpeg?alt=media&token=0e536b40-de76-4322-9989-5f70590b3f5b",
        qty: 1),
    Product(
        id: 2,
        title: "salade de mer",
        price: 40.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/salade%20de%20la%20mer.jpg?alt=media&token=08210ee0-9ded-4463-800d-80d295f33877",
        qty: 1),
    Product(
        id: 3,
        title: "salade de concombre",
        price: 20.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/salade%20de%20concombre%20au%20ch%C3%A8vre%20et%20olives.webp?alt=media&token=625471c9-ce28-42f0-8856-152023ad2396",
        qty: 1),
    Product(
        id: 4,
        title: "tomates crème fraiche",
        price: 40.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/tomates%20cr%C3%A8me%20fraiche.jpg?alt=media&token=f99da238-d290-4c29-8b07-867616fea0d2",
        qty: 1),
    Product(
        id: 5,
        title: "crevettes en salade",
        price: 25.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/coupelles-de-crevettes-en-salade.jpeg?alt=media&token=be7c20c4-4cca-499f-a674-1692af2bc90d",
        qty: 1),
    Product(
        id: 6,
        title: "salade exotique",
        price: 20.0,
        qty: 1,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/salade%20exotique.jpg?alt=media&token=fee29cd9-37ba-4eb4-bbb9-3370ccc31c27")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Entrée"),
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