import 'package:fashionshop/src/FirebaseMethod/FirebaseMethod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  final String chatRoomId;
  final String Myname;
  final String chattingWithname;

  const ConversationScreen({ this.chatRoomId,this.Myname,this.chattingWithname}) ;
  @override
  _ConservationScreenState createState() => _ConservationScreenState();
}

class _ConservationScreenState extends State<ConversationScreen> {
ScrollController scrollController=ScrollController();
TextEditingController messageController = TextEditingController();
Stream  chatMessageStream;
  Widget ChatMessageList(){
         return StreamBuilder(
           stream: chatMessageStream,

           builder: (context,snapshot)
           {
             WidgetsBinding.instance.addPostFrameCallback((_) {
               try {
                 scrollController.animateTo(
                   scrollController.position.maxScrollExtent,
                   curve: Curves.easeOut,
                   duration: const Duration(milliseconds: 300),
                 );
               }catch(e){}
             });

             return snapshot.hasData? Container(
             margin: EdgeInsets.only(bottom: 70),
             child: ListView.builder(

               controller: scrollController,
               scrollDirection: Axis.vertical,
               itemCount: snapshot.data.documents.length,
               itemBuilder: (context,index)
               {
                 return MessageTile(snapshot.data.documents[index].data["message"],
                     snapshot.data.documents[index].data["sendBy"]==widget.Myname
                 );
               },
             ),
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
            color: Colors.white,
            size: 30,
          ),
        ),
        backgroundColor: Color(0xFF4ab3b5),
        title: Text(
          widget.chattingWithname,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Color(0xffffffff),
        child: Stack(
          children: <Widget>[
            ChatMessageList(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
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
                              const Color(0xffFFFFFF),
                              const Color(0xffFFFFFF)
                            ]
                          ),
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.white)
                        ),
                        padding: EdgeInsets.all(12),
                        child: Icon(Icons.send,color: Colors.blue,size: 20,),
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
                  const Color(0xffF1F0F0),
                  const Color(0xffF1F0F0)
                ]
          ),
          borderRadius: BorderRadius.circular(12)
        ),
          child: Text(message, style: TextStyle(fontSize: 12, color: isSendByMe?Colors.white:Colors.black),)
      ),
    );
  }
}
