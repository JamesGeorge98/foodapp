import 'package:flutter/material.dart';
import 'package:foodapp/data.dart';
import 'package:foodapp/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var getData = LocalData().cate;
  var getProduct = LocalData().product;

  final ScrollController controller = ScrollController();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.height,
              searchbar,
              10.height,
              listOfFood,
              10.height,
              header,
              10.height,
              listOfproduct
            ],
          ),
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
      child: StatefulBuilder(
        builder: (context, setState) => ListView.separated(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              ContainerDataClass data = getProduct[index];

              return FoodContainer(
                key: UniqueKey(),
                data: data,
                controller: controller,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
            itemCount: getProduct.length),
      ),
    );
  }
}

class FoodContainer extends StatefulWidget {
  const FoodContainer(
      {super.key, required this.data, required this.controller});

  final ContainerDataClass data;

  final ScrollController controller;

  @override
  State<FoodContainer> createState() => _FoodContainerState();
}

class _FoodContainerState extends State<FoodContainer> {
  late final ContainerDataClass data = widget.data;

  late ScrollController controller = widget.controller;

  double finalAngle = 0.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((50.0)),
        color: data.colors,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [headImage, star, header, subTitle, price, addToCartButton],
      ),
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
    controller.addListener(() {
      finalAngle = controller.offset;
      setState(() {});
    });
    return StatefulBuilder(builder: (context, setState) {
      return Transform.rotate(
        angle: finalAngle,
        child: CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage(
            data.image,
          ),
        ),
      );
    });
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
    return Text(
      data.subTitle,
    );
  }

  get price {
    return Text(
      data.price,
    );
  }

  get addToCartButton {
    return TextButton.icon(
      icon: const Icon(Icons.shopping_bag_outlined),
      onPressed: () {},
      label: const Text(
        "Add to buy",
      ),
    );
  }
}
