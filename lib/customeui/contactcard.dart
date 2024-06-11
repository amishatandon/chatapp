import 'package:chatapp/model/contactmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contact}) : super(key: key);
  final ContactModel contact;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        child: SvgPicture.asset(
          "assets/persons.svg",
          color: Colors.white,
          height: 30,
          width: 30,
        ),
        backgroundColor: Colors.blueGrey[200],
      ),
      title: Text(
        contact.name,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        contact.status,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
