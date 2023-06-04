import 'package:chatbot/views/model/model.dart';
import 'package:chatbot/views/ui/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/chat_repository.dart';

class ChatViewSP extends StatefulWidget {
  const ChatViewSP({super.key, required this.topic});
  final String topic;
  @override
  State<ChatViewSP> createState() => _ChatViewSPState();
}

class _ChatViewSPState extends State<ChatViewSP> {
  TextEditingController messageController = TextEditingController();
  List<String> _chats = [];
  final _scrollController = ScrollController();
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _loadChats();
  }

  void _loadChats() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("chats")) {
      setState(() {
        isLoading = true;
        _chats = prefs.getStringList('chats') ?? [];
      });
      Future.delayed(const Duration(milliseconds: 50))
          .then((_) => _scrollDown());
    }

    setState(() {
      _chats.add("Lets discuss about ${widget.topic}¬¬user");
      _saveChats();
    });
    Future.delayed(const Duration(milliseconds: 50)).then((_) => _scrollDown());
    await generateResponse("Lets discuss about ${widget.topic}", widget.topic)
        .then((value) async {
      setState(() {
        _chats.add("$value¬¬bot");
        _saveChats();
        isLoading = false;
      });
    }).then((value) => _scrollDown());
  }

  void _saveChats() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('chats', _chats);

    Future.delayed(const Duration(milliseconds: 50)).then((_) => _scrollDown());
  }

  void _sendMessage() async {
    if (messageController.text.isNotEmpty) {
      _chats.add("${messageController.text}¬¬user");

      setState(() {
        isLoading = true;
        Future.delayed(const Duration(milliseconds: 50))
            .then((_) => _scrollDown());
      });
      print(messageController.text);
      await generateResponse2(
        messageController.text,
      ).then((value) async {
        setState(() {
          _chats.add("$value¬¬bot");

          isLoading = false;
        });
      });
      _saveChats();
      Future.delayed(const Duration(milliseconds: 50))
          .then((_) => _scrollDown());
      setState(() {
        _scrollDown();
        messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        title: const Text('Chat App'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.blueGrey.shade200,
              Colors.white,
              Colors.blueGrey.shade300,
            ])),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _chats != []
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          controller: _scrollController,
                          physics: const BouncingScrollPhysics(),
                          itemCount: _chats.length,
                          itemBuilder: (context, index) {
                            var e = _chats[index].split("¬¬").last;
                            return ChatMessageWidget(
                                text: _chats[index].split("¬¬").first,
                                chatMessageType: e == "user"
                                    ? ChatMessageType.user
                                    : ChatMessageType.bot,
                                s: s);
                          },
                        ),
                      ),
                    )
                  : const Center(
                      child: SizedBox(
                        height: 30,
                        child: Text("Start conversation..."),
                      ),
                    ),
              const Divider(),
              Visibility(
                visible: isLoading,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      height: 40,
                      width: 60,
                      child: Row(
                        children: [
                          Lottie.asset("lib/assets/chatbot3.json", height: 20),
                          const Text(
                            "typing...",
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    _buildInput(messageController),
                    IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white70,
                      ),
                      onPressed: _sendMessage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _scrollDown() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }
}

Expanded _buildInput(TextEditingController textController) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white54, borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: TextFormField(
          textCapitalization: TextCapitalization.sentences,
          style: const TextStyle(color: Colors.black87),
          controller: textController,
          decoration: const InputDecoration(
            filled: true, hintText: "Type...",
            border: InputBorder.none,
            //  focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    ),
  );
}
