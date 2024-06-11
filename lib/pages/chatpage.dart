import 'package:chatapp/customeui/customcard.dart';
import 'package:chatapp/model/chatmodel.dart';
import 'package:chatapp/pages/selectcontact.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel1> chats = [
    ChatModel1(
      name: "Swarnim",
      icon: "persons.svg",
      isGroup: false,
      time: "4:00",
      currentMessage: "hyy!!",
    ),
    ChatModel1(
      name: "Duniyadari",
      icon: "groups.svg",
      isGroup: true,
      time: "4:00",
      currentMessage: "that's not true at all.",
    ),
    ChatModel1(
      name: "Aarya",
      icon: "persons.svg",
      isGroup: false,
      time: "4:00",
      currentMessage: "us bro!!",
    ),
    ChatModel1(
      name: "Agrani",
      icon: "persons.svg",
      isGroup: false,
      time: "4:00",
      currentMessage: "I think we should meet soon ",
    ),
    ChatModel1(
      name: "adeeb",
      icon: "persons.svg",
      isGroup: false,
      time: "4:00",
      currentMessage: "how are you doing??",
    ),
    ChatModel1(
      name: "Sabka Sath Sabka Vikas",
      icon: "groups.svg",
      isGroup: true,
      time: "4:00",
      currentMessage: "are you guyss alive??",
    ),
    ChatModel1(
      name: "sneh",
      icon: "persons.svg",
      isGroup: false,
      time: "4:00",
      currentMessage: "you don't understand!",
    ),
    ChatModel1(
      name: "Sneh and Sakhis",
      icon: "groups.svg",
      isGroup: true,
      time: "4:00",
      currentMessage: "results are out ppl",
    ),
    ChatModel1(
      name: "Abhinav",
      icon: "persons.svg",
      isGroup: false,
      time: "4:00",
      currentMessage: "nothing much!",
    ),
    ChatModel1(
      name: "priya",
      icon: "persons.svg",
      isGroup: false,
      time: "4:00",
      currentMessage: "extraordinary you",
    ),
    ChatModel1(
      name: "Nitin",
      icon: "persons.svg",
      isGroup: false,
      time: "4:00",
      currentMessage: "be there on time",
    ),
    ChatModel1(
      name: "Harsh",
      icon: "persons.svg",
      isGroup: false,
      time: "4:00",
      currentMessage: "nah! its late now.",
    ),
    ChatModel1(
      name: "Himani",
      icon: "persons.svg",
      isGroup: false,
      time: "4:00",
      currentMessage: "yo bro missing you!!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          ChatModel1 chat = chats[index];
          String iconPath = chat.isGroup ? "groups.svg" : "persons.svg";

          return CustomCard(
            chatModel1: chat.copyWith(icon: iconPath),
          );
        },
      ),
    );
  }
}
