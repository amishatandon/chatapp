import 'package:chatapp/model/chatmodel.dart';
import 'package:chatapp/screens/individualpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chatModel1}) : super(key: key);
  final ChatModel1 chatModel1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) =>
                    IndividualPage(chatModel1: chatModel1))));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                chatModel1.isGroup ? 'assets/groups.svg' : 'assets/persons.svg',
                color: Colors.white,
                height: 37,
                width: 37,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(
              chatModel1.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  chatModel1.currentMessage,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            trailing: Text(chatModel1.time),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 30),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
