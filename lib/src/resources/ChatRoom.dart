import 'package:fashionshop/src/FirebaseMethod/FirebaseMethod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Conversation_Screen.dart';


class ChatRoom extends StatefulWidget {
  final String MyName;

  const ChatRoom({this.MyName});
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

Stream chatRoomsStream;
Widget chatRoomList (){
  return StreamBuilder(
    stream: chatRoomsStream,
    builder: (context,snapshot)
    {
      return snapshot.hasData? ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: snapshot.data.documents.length,
          itemBuilder: (context,index)
          { return  ChatRoomTile(
            widget.MyName,
            snapshot.data.documents[index].data["chatroomId"]
                .toString().replaceAll("_", "")
                .replaceAll(widget.MyName, ""),
              snapshot.data.documents[index].data["chatroomId"]
          );
            
          }
      ):Container();
    },
  );
}
  @override
  void initState() {
    FireBaseMethod().getChatRoom(widget.MyName).then((value)
    { setState(() {
      chatRoomsStream=value;
    });

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(

        backgroundColor: Color(0xFF4ab3b5),
        title: Center(
          child: Text(
            "ChatRoom",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body:chatRoomList() ,
    );
  }
}


class ChatRoomTile extends StatelessWidget {
  final String MyName;
  final String userName;
final String chatRoomId;
  ChatRoomTile( this.MyName,this.userName,this.chatRoomId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(
          builder: (context) => ConversationScreen(chatRoomId: chatRoomId,Myname: MyName,chattingWithname: userName,)
        ));
      },
      child: Container(
       // height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
        child: Row(
          children: <Widget>[
            Container(

              alignment: Alignment.center,
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(40),

              ),
              child: Text("${userName.substring(0,1).toUpperCase()}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),),
            ),
            SizedBox(width: 8,),
            Text(userName,style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500),),
          ],
        ),
      ),
    );
  }
}
