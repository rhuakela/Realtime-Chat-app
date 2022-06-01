import 'package:flutter/material.dart';
import 'package:skapp/helper/authenticate.dart';
import 'package:skapp/services/auth.dart';
import 'package:skapp/views/search.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  AuthMethods authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:[
          GestureDetector(
            onTap: (){
              authMethods.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => const Authenticate()
              ));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Icon(Icons.exit_to_app)),
          )
        ],
        centerTitle: true,
        title: Column(
          children: const <Widget>[
            CircleAvatar(
              radius: 28.0,
              backgroundImage: AssetImage( 'assets/images/SK.jpg',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          Navigator.push(context, MaterialPageRoute(
            builder: (context) =>  const SearchScreen()
          ));
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
