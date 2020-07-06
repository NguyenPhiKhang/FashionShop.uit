import 'package:fashionshop/src/FirebaseMethod/FirebaseMethod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  final String chatRoomId;
  final String Myname;

  const ConversationScreen({ this.chatRoomId,this.Myname}) ;
  @override
  _ConservationScreenState createState() => _ConservationScreenState();
}

class _ConservationScreenState extends State<ConversationScreen> {

TextEditingController messageController = TextEditingController();
Stream  chatMessageStream;
  Widget ChatMessageList(){
         return StreamBuilder(
           stream: chatMessageStream,
           builder: (context,snapshot)
           { return snapshot.hasData? ListView.builder(
             itemCount: snapshot.data.documents.length,
             itemBuilder: (context,index)
             {
               return MessageTile(snapshot.data.documents[index].data["message"],
                   snapshot.data.documents[index].data["sendBy"]==widget.Myname
               );
             },
           ):Container();


           },
         );
  }

  sendMessage(){
    if(messageController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messageController.text,
        "sendBy" : widget.Myname,
        "time" : DateTime.now().millisecondsSinceEpoch
      };
      FireBaseMethod().addConservationMessages(widget.chatRoomId, messageMap);
      messageController.text ="";
    }
  }

  @override
  void initState() {
    FireBaseMethod().getConservationMessages(widget.chatRoomId).then((value)
    {    setState(() {
      chatMessageStream =value;
    });

    }
    );
    super.initState();

  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.blue,
            size: 30,
          ),
        ),
        backgroundColor: Colors.red,
        title: Text(
          "Chat",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.black.withOpacity(0.85),
        child: Stack(
          children: <Widget>[
            ChatMessageList(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(

                      child: TextField(
                        controller: messageController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Nhập tin nhắn...",
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none
                        ),
                      )
                    ),
                    GestureDetector(
                      onTap: (){
                        sendMessage();
                      },
                      child:  Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0x36FFFFFF),
                              const Color(0x0FFFFFFF)
                            ]
                          ),
                          borderRadius: BorderRadius.circular(40)
                        ),
                        padding: EdgeInsets.all(12),
                        child: Icon(Icons.send,color: Colors.white,size: 20,),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
  


class MessageTile extends StatelessWidget {
  final String message;
  final bool isSendByMe;
  const MessageTile( this.message,this.isSendByMe);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width,
      alignment: isSendByMe? Alignment.centerRight:Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSendByMe? [
              const Color(0xff007EF4),
              const Color(0xff2A75BC)
            ] :
                [
                  const Color(0x1AFFFFFF),
                  const Color(0x1AFFFFFF)
                ]
          )
        ),
          child: Text(message, style: TextStyle(fontSize: 12,color: Colors.white),)
      ),
    );
  }
}
