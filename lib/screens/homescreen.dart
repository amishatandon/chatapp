import 'package:chatapp/pages/camerapage.dart';
import 'package:chatapp/pages/chatpage.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHAT APP'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  child: Text('New Group'),
                  value: 'New Group',
                ),
                PopupMenuItem<String>(
                  child: Text('New Broadcast'),
                  value: 'New Broadcast',
                ),
                PopupMenuItem<String>(
                  child: Text('WhatsApp Web'),
                  value: 'WhatsApp Web',
                ),
                PopupMenuItem<String>(
                  child: Text('Starred Message'),
                  value: 'Starred Message',
                ),
                PopupMenuItem<String>(
                  child: Text('Settings'),
                  value: 'Settings',
                ),
              ];
            },
          )
        ],
        bottom: TabBar(
            indicatorColor: Colors.white,
            controller: _controller,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'STATUS',
              ),
              Tab(
                text: 'CALLS',
              ),
            ]),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          CameraPage(),
          ChatPage(),
          Text('status'),
          Text('calls'),
        ],
      ),
    );
  }
}
