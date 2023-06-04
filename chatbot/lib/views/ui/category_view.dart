import 'package:chatbot/views/ui/chat_view.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => CcategoryState();
}

class CcategoryState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        centerTitle: false,
        title: const Text("Select a topic for Annabel "),
      ),
      body: Container(
        decoration: const BoxDecoration(),
        height: s.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const Text(
              "Select a topic to talk about 😄",
              style: TextStyle(color: Colors.black87),
            ),
            Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: topics.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          tileColor: Colors.blueGrey.shade100,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ChatViewSP(topic: topics[index])));
                            //          Navigator.pushAndRemoveUntil(
                            //              context,
                            //              CupertinoPageRoute(
                            //                  builder: (context) =>
                            //                      // ChatPage(topic: topics[index])),
                            //                      ChatView(topic: topics[index])),
                            //              (route) => false);
                          },
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2)),
                          trailing: const Text("🔥"),
                          leading: const Icon(
                            Icons.topic_rounded,
                            color: Colors.blueGrey,
                          ),
                          title: Text(
                            topics[index],
                            style: TextStyle(color: Colors.blueGrey.shade800),
                          ),
                        ),
                      );
                    }))
          ]),
        ),
      ),
    );
  }
}

List<String> topics = [
  "Travel and Adventure",
  "Food and Culinary Experiences",
  "Movies and TV Shows",
  "Books and Literature",
  "Sports and Athletics",
  "Music and Concerts",
  "Fashion and Style",
  "Current Events and News",
  "Personal Hobbies and Interests",
  "Relationships and Dating",
  "Technology and Gadgets",
  "Personal Growth and Development",
  "Pop Culture and Celebrities",
  "Parenting and Family Life",
  "Pets and Animals",
  "Outdoor Activities and Nature",
  "Art and Creativity",
  "Gaming and Video Games",
  "Home Decor and Interior Design",
  "Fitness and Health"
];
