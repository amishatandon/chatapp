import 'package:chatapp/customeui/avtarcard.dart';
import 'package:chatapp/customeui/groupcard.dart';
import 'package:chatapp/model/chatmodel.dart';
import 'package:chatapp/model/contactmodel.dart';
import 'package:chatapp/model/groupmodel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<GroupModel> names = [
    GroupModel(name: "Swarnim", status: "live a life you'll remember"),
    GroupModel(name: "Agrani", status: "C'est la vie"),
    GroupModel(name: "Aarya", status: "on the way to god knows where!"),
    GroupModel(
        name: "Adeeb", status: "tears, fears and years will teach you.."),
    GroupModel(name: "Sneh", status: "Hustle!!"),
    GroupModel(name: "Nitin", status: "Bussyyyy!!!"),
    GroupModel(name: "Harsh", status: "so far so good!"),
    GroupModel(name: "Abhinav", status: "Happiness"),
    GroupModel(name: "Priya", status: "please leave message"),
  ];
  List<GroupModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Group',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              'Add Participants',
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 26,
              )),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: names.length + 1,
            itemBuilder: ((context, index) {
              if (index == 0) {
                return Container(
                  height: groups.length > 0 ? 90 : 10,
                );
              }
              return InkWell(
                onTap: () {
                  if (names[index - 1].select == false) {
                    setState(() {
                      names[index - 1].select = true;
                      groups.add(names[index - 1]);
                    });
                  } else {
                    setState(
                      () {
                        names[index - 1].select = false;
                        groups.remove(names[index - 1]);
                      },
                    );
                  }
                },
                child: GroupCard(
                  names: names[index - 1],
                ),
              );
            }),
          ),
          groups.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 70,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: names.length,
                          itemBuilder: (context, index) {
                            if (names[index].select == true) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    names[index].select = false;
                                    groups.remove(names[index]);
                                  });
                                },
                                child: AvatarCard(
                                  names: names[index],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    Divider(
                      thickness: 1,
                    )
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
