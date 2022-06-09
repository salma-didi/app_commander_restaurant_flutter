import 'package:cammander_flutter/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class DessertPage extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 13,
        title: "Macaron",
        price: 20.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/macaron.jpg?alt=media&token=0c4feff1-5f3e-4e74-9f90-6d7d23e61a0f",
        qty: 1),
    Product(
        id: 14,
        title: "Crème Chocloat",
        price: 40.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/creme_chocolat.jpeg?alt=media&token=209ad1cd-3a6b-4154-9e1d-e9b915291894",
        qty: 1),
    Product(
        id: 15,
        title: "Chocolat Fondu",
        price: 20.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/dessert.jpg?alt=media&token=1a39e855-0385-4ed3-ba02-be71e42e4da4",
        qty: 1),
    Product(
        id: 16,
        title: "Tiramisu",
        price: 40.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/tiramisu.webp?alt=media&token=0b910c82-4957-47bf-bf73-87ceb1adae8c",
        qty: 1),
    Product(
        id: 17,
        title: "Flan",
        price: 25.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/flan.jpeg?alt=media&token=ae622846-9d1c-4c92-9c87-1df6836ff12f",
        qty: 1),
    Product(
        id: 18,
        title: "Crèpe",
        price: 25.0,
        imgUrl: "https://firebasestorage.googleapis.com/v0/b/food-app-flutter-55d35.appspot.com/o/cr%C3%A8pe.jpeg?alt=media&token=bf3f5fe7-c000-4a17-b4ce-16e851ea43b0",
        qty: 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Dessert"),
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