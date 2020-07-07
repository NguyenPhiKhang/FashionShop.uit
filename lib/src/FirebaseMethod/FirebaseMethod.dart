




import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseMethod {
  uploadUserInfo(userMap)
  {
     Firestore.instance.collection("Users")
        .add(userMap);

  }

  CreateChatRoom(String chatRoomId,chatRoomMap)
  {
    Firestore.instance.collection("ChatRoom")
        .document(chatRoomId).setData(chatRoomMap).catchError((e)
        {
          print(e);
        });
  }




  addConservationMessages(String chatRoomId,messageMap)
  {
    Firestore.instance.collection("ChatRoom")
        .document(chatRoomId)
        .collection("chats")
        .add(messageMap).catchError((e){print(e);});
  }
  getConservationMessages(String chatRoomId) async
  {
    return await Firestore.instance.collection("ChatRoom")
        .document(chatRoomId)
        .collection("chats")
    .orderBy("time",descending: false)
        .snapshots();
  }

  getChatRoom(String userName) async{
    return await Firestore.instance.collection("ChatRoom")
        .where("users",arrayContains: userName)
        .snapshots();
  }

  addtoCart(String email,mapCartItem)
  {
    Firestore.instance.collection("Users")
        .document(email)
        .collection("Cart")
        .add(mapCartItem).catchError((e){print(e);});
  }
  getCartItem (String email)async
  {
   return await Firestore.instance.collection("Users")
        .document(email)
        .collection("Cart")
        .snapshots();
  }

  addFavorite (String email,mapFavoriteItem)
  {
    Firestore.instance.collection("Users")
        .document(email)
        .collection("Favorite")
        .add(mapFavoriteItem).catchError((e){print(e);});
  }



}