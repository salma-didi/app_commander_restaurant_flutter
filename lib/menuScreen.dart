
import 'package:cammander_flutter/widgets/colors.dart';
import 'package:cammander_flutter/widgets/utils/helper.dart';
import 'package:cammander_flutter/widgets/custom_diamond_shape.dart';
import 'package:cammander_flutter/widgets/custom_triangle_shape.dart';
import 'package:cammander_flutter/widgets/menu-card.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = "/menuScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          )
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: Helper.getScreenHeight(context) * 0.8,
                    width: Helper.getScreenWidth(context),
                    child: Stack(
                      children: [
                        Container(
                          height: double.infinity,
                          width: 100,
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                              ),
                              color: AppColor.orange),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/entree');
                                },
                                child: MenuCard(
                                  imageShape: ClipOval(
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      child: Image.asset(
                                        Helper.getAssetName("bakery.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  name: "Entree",
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/platPrincipal');
                                },
                                child: MenuCard(
                                  imageShape: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      child: Image.asset(
                                        Helper.getAssetName("western2.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  name: "Plat principal",
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/dessert');
                                },
                                child: MenuCard(
                                  imageShape: ClipPath(
                                    clipper: CustomTriangle(),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      child: Image.asset(
                                        Helper.getAssetName("dessert.jpg",),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  name: "Desserts",
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/boisson');
                                },
                                child: MenuCard(
                                  imageShape: ClipPath(
                                    clipper: CustomDiamond(),
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      child: Image.asset(
                                        Helper.getAssetName("coffee.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  name: "Boisson",
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),

        ],
      ),
    );
  }
}





