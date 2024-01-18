import 'package:flutter/material.dart';
import 'package:foodapp/data.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.data});

  final ContainerDataClass data;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final ContainerDataClass data = widget.data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: data.colors,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [headImage],
      ),
    );
  }

  get headImage {
    return Center(
      child: Hero(
        flightShuttleBuilder:
            (context, anim, direction, fromContext, toContext) {
          final Hero toHero = toContext.widget as Hero;
          if (direction == HeroFlightDirection.pop) {
            return FadeTransition(
              opacity: const AlwaysStoppedAnimation(0),
              child: toHero.child,
            );
          } else {
            return toHero.child;
          }
        },
        transitionOnUserGestures: false,
        tag: data.title,
        child: CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage(
            data.image,
          ),
        ),
      ),
    );
  }

  get contoain {
    return Center(
      child: Hero(
        tag: "1",
        child: CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage(
            data.image,
          ),
        ),
      ),
    );
  }
}

class DetailPage1 extends StatefulWidget {
  const DetailPage1({
    super.key,
  });

  @override
  State<DetailPage1> createState() => _DetailPageState1();
}

class _DetailPageState1 extends State<DetailPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [contoain],
      ),
    );
  }

  get contoain {
    return Center(
      child: Hero(
        tag: "0",
        child: Container(
          width: 100,
          height: 200,
          color: Colors.amber,
        ),
      ),
    );
  }
}
