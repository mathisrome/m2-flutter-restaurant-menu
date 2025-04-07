import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const RestaurantMenu(),
    );
  }
}

class RestaurantMenu extends StatefulWidget {
  const RestaurantMenu({super.key});

  @override
  State<RestaurantMenu> createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu> {
  String? _value = "starters";

  @override
  Widget build(BuildContext context) {
    List<Food> foods = [
      Food(
        type: "starters",
        title: "Salade de lentilles au chèvre et noisettes.",
        imageFilepath: "assets/images/profile.png",
        price: 20.00,
        description:
            "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.",
      ),
      Food(
        type: "starters",
        title: "Brick au thon et au fromage.",
        imageFilepath: "assets/images/profile.png",
        price: 20.00,
        description:
            "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.",
      ),
      Food(
        type: "starters",
        title: "Petits artichauts violets à l'italienne.",
        imageFilepath: "assets/images/profile.png",
        price: 20.00,
        description:
            "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.",
      ),
      Food(
        type: "starters",
        title: "Salade croquante au quinoa.",
        imageFilepath: "assets/images/profile.png",
        price: 20.00,
        description:
            "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.",
      ),
      Food(
        type: "plates",
        title: "Pizza Regina.",
        imageFilepath: "assets/images/profile.png",
        price: 20.00,
        description:
        "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.",
      ),
      Food(
        type: "plates",
        title: "Pâtes à la carbonara.",
        imageFilepath: "assets/images/profile.png",
        price: 20.00,
        description:
        "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.",
      ),
      Food(
        type: "desserts",
        title: "Fondant au chocolat.",
        imageFilepath: "assets/images/profile.png",
        price: 20.00,
        description:
        "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.",
      ),
      Food(
        type: "desserts",
        title: "Glace.",
        imageFilepath: "assets/images/profile.png",
        price: 20.00,
        description:
        "Lorem ipsum dolor sit amet consectetur adipiscing elit. Dolor sit amet consectetur adipiscing elit quisque faucibus.",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Menu du restaurant"),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Row(
              spacing: 10,
              children: [
                ChoiceChip(
                  label: Text("Entrées"),
                  selected: _value == "starters",
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? "starters" : null;
                    });
                  },
                ),
                ChoiceChip(
                  label: Text("Plats"),
                  selected: _value == "plates",
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? "plates" : null;
                    });
                  },
                ),
                ChoiceChip(
                  label: Text("Desserts"),
                  selected: _value == "desserts",
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? "desserts" : null;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: ListView.builder(
                      itemCount: foods.length,
                      itemBuilder: (context, index) {
                        print(foods[index].title );
                        if (foods[index].type == _value ) {
                          return Card(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(foods[index].title),
                                  SizedBox(height: 10),
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                      foods[index].imageFilepath,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text("Prix : ${foods[index].price} €"),
                                  SizedBox(height: 10),
                                  Text(
                                    "Description : \n${foods[index].description}",
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class Food {
  String title = "";
  String imageFilepath = "";
  double price = 0;
  String description = "";
  String type = "";

  Food({
    required this.title,
    required this.imageFilepath,
    required this.price,
    required this.description,
    required this.type,
  });
}
