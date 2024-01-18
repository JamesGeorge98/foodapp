import 'package:flutter/material.dart';
import 'package:foodapp/controller.dart';
import 'package:foodapp/data.dart';
import 'package:foodapp/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var getData = LocalData().cate;
  var getProduct = LocalData().product;

  final ScrollController controller = ScrollController();
  final SettingsController settingController = SettingsController();

  late final Animation<Offset> animation;

  late final AnimationController animationController;

  @override
  void initState() {
    controller.addListener(() {
      settingController.updateIndex(controller.offset);
    });

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    animation =
        Tween(begin: const Offset(0.0, 0.0), end: const Offset(0.0, -20.0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  50.height,
                  searchbar,
                  10.height,
                  listOfFood,
                  10.height,
                  header,
                  40.height,
                ],
              ),
            ),
            listOfproduct
          ],
        ),
      ),
    );
  }

  get searchbar {
    return TextFormField(
      decoration: InputDecoration(
          filled: true,
          contentPadding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(maxHeight: 40),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.transparent)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.transparent)),
          fillColor: const Color.fromARGB(255, 196, 196, 195),
          hintText: "Search your favuriote food",
          prefixIcon: const Icon(Icons.search)),
    );
  }

  get listOfFood {
    return SizedBox(
      height: 70,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Map data = getData[index];

            return SizedBox(
              width: 80,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(data['icon']), Text(data['name'])]),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => index == 0
              ? const SizedBox()
              : const SizedBox(
                  width: 10,
                ),
          itemCount: getData.length),
    );
  }

  get header {
    return RichText(
      text: const TextSpan(children: [
        TextSpan(
            text: "Most\n",
            style: TextStyle(color: Colors.black, fontSize: 30)),
        TextSpan(
            text: "Popular Food",
            style: TextStyle(color: Colors.grey, fontSize: 30))
      ]),
    );
  }

  get listOfproduct {
    return Expanded(
      child: ListView.separated(
          padding: const EdgeInsets.only(right: 150, left: 20), //

          shrinkWrap: true,
          controller: controller,
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListenableBuilder(
                    listenable: settingController,
                    builder: (context, child) {
                      return InkWell(
                          onTap: () {
                            // if (settingController.currentIndex != index) {
                            //   if (settingController.currentIndex < index) {
                            //     controller.animateTo(controller.offset + 150,
                            //         duration: const Duration(milliseconds: 500),
                            //         curve: Curves.easeInOut);
                            //   } else {
                            //     controller.animateTo(controller.offset - 150,
                            //         duration: const Duration(milliseconds: 500),
                            //         curve: Curves.easeInOut);
                            //   }
                            // }
                          },
                          child: Hero(
                            tag: index,
                            child: InkWell(
                              onTap: () {
                                animationController.forward();
                                print(animationController.value);
                              },
                              child: Transform.translate(
                                offset: const Offset(1, 0),
                                child: Container(
                                  width: 100,
                                  height: 200,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          )

                          // FoodContainer(
                          //   data: getProduct[index],
                          //   isActive: settingController.currentIndex == index,
                          // ),
                          );
                    }),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: getProduct.length),
    );
  }
}

class FoodContainer extends StatefulWidget {
  const FoodContainer({super.key, required this.data, required this.isActive});

  final ContainerDataClass data;

  final bool isActive;

  @override
  State<FoodContainer> createState() => _FoodContainerState();
}

class _FoodContainerState extends State<FoodContainer>
    with TickerProviderStateMixin {
  late final ContainerDataClass data = widget.data;

  late final AnimationController _controller;
  late final AnimationController _jcontroller;

  late Animation<double> animation;
  late Animation<double> ranimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _jcontroller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    animation = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    ranimation = Tween(begin: 0.0, end: 3.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  double finalAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    if (widget.isActive) {
      _controller.forward();
      _jcontroller.forward();
    } else {
      _controller.reverse();
      _jcontroller.reset();
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 170,
      height: widget.isActive ? 310 : 300,
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((20.0)),
        color: data.colors,
      ),
      child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                0.0,
                -(animation.value * 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headImage,
                  star,
                  header,
                  // subTitle,
                  price,
                  addToCartButton
                ],
              ),
            );
          }),
    );
  }

  get star {
    return const Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
        ),
        Icon(Icons.star, size: 15),
        Icon(Icons.star, size: 15),
        Icon(Icons.star, size: 15),
        Icon(Icons.star, size: 15)
      ],
    );
  }

  get headImage {
    return AnimatedBuilder(
      animation: ranimation,
      builder: (context, child) {
        return ScaleTransition(
          scale: Tween(begin: 1.0, end: 1.2).animate(
              CurvedAnimation(parent: _jcontroller, curve: Curves.elasticOut)),
          child: Transform.rotate(
            angle: ranimation.value,
            child: Hero(
              tag: data.title,
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(
                  data.image,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  get header {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: data.title,
            style: const TextStyle(color: Colors.black, fontSize: 24)),
      ]),
    );
  }

  get subTitle {
    return Visibility(
      visible: widget.isActive,
      child: Text(
        data.subTitle,
      ),
    );
  }

  get price {
    return Text(
      data.price,
    );
  }

  get addToCartButton {
    return Visibility(
      visible: widget.isActive,
      child: TextButton.icon(
        icon: const Icon(Icons.shopping_bag_outlined),
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => DetailPage(data: data),
          //     ));
        },
        label: const Text(
          "Add to buy",
        ),
      ),
    );
  }
}
