import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../model/model.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget(
      {super.key,
      required this.text,
      required this.chatMessageType,
      required this.s});
  final Size s;
  final String text;
  final ChatMessageType chatMessageType;

  @override
  Widget build(BuildContext context) {
    return chatMessageType == ChatMessageType.user
        ? Container(
            width: s.width * 0.8,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.green[400]!,
                      Colors.green.shade200,
                    ])),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Text(
                      text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person_4_rounded,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          )
        : Container(
            width: s.width * 0.8,
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blueGrey.shade700),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      Colors.grey.shade300,
                    ])),
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    child: Center(
                      child: Lottie.asset("lib/assets/chatbot2.json",
                          repeat: false, height: 200),
                    )),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(),
                    child: Text(
                      text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
