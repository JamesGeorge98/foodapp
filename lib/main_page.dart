import 'package:flutter/material.dart';
import 'package:foodapp/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person,
                    size: 30,
                  )),
            ],
          ),
        ),
        body: const HomePage());
  }
}
