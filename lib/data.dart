import 'package:flutter/material.dart';

class LocalData {
  List<Map<String, dynamic>> cate = [
    {"name": "Pizzs", "icon": Icons.local_pizza_sharp},
    {"name": "Burgers", "icon": Icons.bug_report_rounded}
  ];

  List<ContainerDataClass> product = [
    ContainerDataClass(
      colors: Colors.orange,
      image: "assets/1.jpg",
      price: "\$12",
      subTitle: "Best egs in the matret to nbuyb",
      title: "Egg",
    ),
    ContainerDataClass(
      colors: Colors.green,
      image: "assets/2.jpg",
      price: "\$12",
      subTitle: "Best egs in the matret to nbuyb",
      title: "Egg",
    ),
    ContainerDataClass(
      colors: Colors.green,
      image: "assets/3.jpg",
      price: "\$12",
      subTitle: "Best egs in the matret to nbuyb",
      title: "Egg",
    ),
    ContainerDataClass(
      colors: Colors.green,
      image: "assets/1.jpg",
      price: "\$12",
      subTitle: "Best egs in the matret to nbuyb",
      title: "Egg",
    ),
  ];
}

class ContainerDataClass {
  final Color colors;

  final String title;

  final String subTitle;

  final String price;

  final String image;

  ContainerDataClass(
      {required this.colors,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.image});
}
