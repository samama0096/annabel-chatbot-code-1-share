// ignore_for_file: use_build_context_synchronously

import 'package:chatbot/views/ui/category_view.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoardingViewSP extends StatefulWidget {
  const BoardingViewSP({super.key});

  @override
  State<BoardingViewSP> createState() => _BoardingViewSPState();
}

class _BoardingViewSPState extends State<BoardingViewSP> {
  TextEditingController namecont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      // drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 5,
              width: 60,
              child: Lottie.asset("lib/assets/chatbot3.json", height: 5),
            ),
          ),
          //       Icon(Icons.lightbulb_circle_sharp),
          //       SizedBox(
          //         width: 10,
          //       )
        ],
        backgroundColor: Colors.green.shade400,
        //  centerTitle: true,
        title: const Text("Hi from Annabel 👋"),
      ),
      body: Container(
        decoration: const BoxDecoration(),
        //  color: const Color(0xff314755),
        height: s.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: s.height * 0.2,
                child: Lottie.asset("lib/assets/chatbot.json"),
              ),
              Center(
                child: SizedBox(
                  height: s.height * 0.15,
                  width: s.width * 0.75,
                  child: Center(
                    child: TextFormField(
                      maxLength: 10,
                      controller: namecont,
                      style: const TextStyle(color: Colors.black87),
                      decoration: InputDecoration(
                          hintText: "Enter your nick name",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: Colors.black87,
                          helperStyle: const TextStyle(color: Colors.black45),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: MaterialButton(
                    shape: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent)),
                    color: Colors.green[300],
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Meet ChatBot   ",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Icon(Icons.chat_bubble_outline_rounded,
                                size: 15, color: Colors.white),
                          ]),
                    ),
                    onPressed: () async {
                      if (namecont.text.isNotEmpty) {
                        var id = namecont.text;

                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        await sharedPreferences.setString("userid", id);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CategoryView()),
                            ((route) => false));
                      }
                    }),
              )
            ]),
      ),
    );
  }
}
