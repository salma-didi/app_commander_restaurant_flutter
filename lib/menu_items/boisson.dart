import 'package:cammander_flutter/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class BoissonPage extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 19,
        title: "Coca Cola",
        price: 20.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/boisson.jpg?alt=media&token=a12b9ea3-7721-4b88-b894-c11d885e83c9",
        qty: 1),
    Product(
        id: 20,
        title: "Jus d'Orange",
        price: 40.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/jus-dorange-scaled.webp?alt=media&token=b8a90923-e945-4040-8e96-313e9b273188",
        qty: 1),
    Product(
        id: 21,
        title: "Jus d'Avocat",
        price: 20.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/Jus-d-avocat-aux-fruits-secs-Oreo-et-Kitkat.jpg?alt=media&token=36a59331-fa93-4b2c-b314-5ff2eec88fd1",
        qty: 1),
    Product(
        id: 22,
        title: "Thé marocain",
        price: 40.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/the%20marocain.jpg?alt=media&token=a3efb886-90fc-4e44-a394-351155445745",
        qty: 1),
    Product(
        id: 23,
        title: "Café Macchiato",
        price: 25.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/macchiato.jpeg?alt=media&token=9cdfe5a2-09dc-4b8c-afd8-885fed48a377",
        qty: 1),
    Product(
        id: 24,
        title: "Mochito",
        price: 25.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/mochito.jpg?alt=media&token=23611ad6-7285-4ce0-9033-67f79d45c15c",
        qty: 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Boisson"),
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