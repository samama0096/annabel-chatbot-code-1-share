import 'package:chatbot/views/ui/boarding_view.dart';
import 'package:chatbot/views/ui/category_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  AnimationController? controller;
  bool c = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    getData();

    controller!.addListener(() {
      if (controller!.isCompleted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    c ? const CategoryView() : const BoardingViewSP()),
            (route) => false);
      }
    });
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      c = sharedPreferences.containsKey("userid");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: s.height,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: s.height * 0.2,
          child: Lottie.asset("lib/assets/chatbot2.json",
              controller: controller, onLoaded: (v) {
            controller!.duration = v.duration;
            controller!.forward();
          }),
        )
      ]),
    );
  }
}
