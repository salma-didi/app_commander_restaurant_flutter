
import 'package:cammander_flutter/menu_items/boisson.dart';
import 'package:cammander_flutter/cartmodel.dart';
import 'package:cammander_flutter/cartpage.dart';
import 'package:cammander_flutter/menu_items/dessert.dart';
import 'package:cammander_flutter/menu_items/entree.dart';
import 'package:cammander_flutter/menuScreen.dart';
import 'package:cammander_flutter/menu_items/platPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel<CartModel>(
      model: CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping Cart',
        home: MenuScreen(),
        routes: {'/cart': (context) => CartPage(),
          '/entree': (context) => EntreePage(),
          '/platPrincipal': (context) => PlatPage(),
          '/dessert': (context) => DessertPage(),
          '/boisson': (context) => BoissonPage(),

        },
      ),
    );
  }
}