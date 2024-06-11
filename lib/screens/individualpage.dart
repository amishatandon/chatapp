import 'package:chatapp/model/chatmodel.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IndividualPage extends StatefulWidget {
  final ChatModel1 chatModel1;

  IndividualPage({Key? key, required this.chatModel1}) : super(key: key);
  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.arrow_back,
              size: 24,
            ),
            CircleAvatar(
              child: SvgPicture.asset(
                widget.chatModel1.isGroup
                    ? 'assets/groups.svg'
                    : 'assets/persons.svg',
                color: Colors.white,
                height: 37,
                width: 37,
              ),
              radius: 20,
              backgroundColor: Colors.blueGrey,
            )
          ]),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel1.name,
                  style: TextStyle(
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'last seen today ar 12:08',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.call),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  child: Text('View Contact'),
                  value: 'View Contact',
                ),
                PopupMenuItem<String>(
                  child: Text('Media, Links and Doc'),
                  value: 'Media, Links and Doc',
                ),
                PopupMenuItem<String>(
                  child: Text('Block Contact'),
                  value: 'Block Contact',
                ),
                PopupMenuItem<String>(
                  child: Text('Search'),
                  value: 'Search',
                ),
                PopupMenuItem<String>(
                  child: Text('Mute Notifications'),
                  value: 'Mute Notifications',
                ),
                PopupMenuItem<String>(
                  child: Text('Wallpaper'),
                  value: 'Wallpaper',
                ),
              ];
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 55,
                          child: Card(
                              margin: EdgeInsets.only(
                                left: 2,
                                right: 2,
                                bottom: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextFormField(
                                controller: _controller,
                                focusNode: focusNode,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "type a message",
                                    prefixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          show = !show;
                                          if (show) {
                                            focusNode.unfocus();
                                          } else {
                                            focusNode.canRequestFocus = false;
                                            FocusScope.of(context)
                                                .requestFocus(focusNode);
                                          }
                                        });
                                      },
                                      child: Icon(Icons.emoji_emotions),
                                    ),
                                    suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (Builder) =>
                                                        bottomsheet());
                                              },
                                              icon: Icon(Icons.attach_file)),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.camera_alt)),
                                        ]),
                                    contentPadding: EdgeInsets.all(5)),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8, right: 5),
                          child: CircleAvatar(
                            radius: 25,
                            child: IconButton(
                                onPressed: () {}, icon: Icon(Icons.mic)),
                          ),
                        )
                      ],
                    ),
                    show ? emojiSelect() : Container(),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Card(
          margin: EdgeInsets.all(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 30,
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.location_pin, Colors.pink, "Location"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.person, Colors.blue, "Contacts"),
                ],
              ),
            ]),
          )),
    );
  }

  Widget iconcreation(IconData icon, Color color, String text) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon(
            icon,
            size: 29,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }

  Widget emojiSelect() {
    return Expanded(
      child: Container(
        height: 300,
        width: double.infinity,
        child: EmojiPicker(
          onEmojiSelected: (category, emoji) {
            setState(() {
              _controller.text = _controller.text + emoji.emoji;
              _controller.selection = TextSelection.fromPosition(
                TextPosition(offset: _controller.text.length),
              );
            });
          },
          config: const Config(columns: 7),
        ),
      ),
    );
  }
}
