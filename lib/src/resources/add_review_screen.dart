import 'dart:convert';
import 'dart:io';
import 'package:fashionshop/src/config/GraphQLConfiguration.dart';
import 'package:fashionshop/src/graphql/QueryMutation.dart';
import 'package:fashionshop/src/model/OrderItem.dart';
import 'package:fashionshop/src/resources/HomePage.dart';
import 'package:fashionshop/src/resources/HomeScreen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:fashionshop/src/model/upload_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:mime_type/mime_type.dart';
GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
class AddReviewScreen extends StatefulWidget {
  final String OrderItemId;

  const AddReviewScreen({ this.OrderItemId});
  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  GraphQLClient _client = graphQLConfiguration.clientToQuery();
  bool _isLoadingChoose = false;
  bool _isLoadingUpload = false;
  List<File> listFiles = new List<File>();
  double star = 0;
  TextEditingController controller =TextEditingController();
  UploadImage uploadImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
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
          actions: <Widget>[
          ],
          textTheme: TextTheme(),
          backgroundColor: Color(0xFF4ab3b5),
          title: Text(
            "Tạo Review",
            style: TextStyle(color: Colors.white),
          ),),
        body: Opacity(
          opacity: _isLoadingUpload==true?0.7:1,
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Color(0xffE7E7E7)
                ),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text("Mời đánh giá"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SmoothStarRating(
                        allowHalfRating: false,
                        starCount: 5,
                        size: 40,
                        rating: star,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        color: Colors.amber,
                        borderColor: Colors.grey,
                        spacing: 0.0,
                        onRatingChanged: (value) {
                          setState(() {
                            star = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      height: 200,
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                      padding: EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ], color: Colors.white),
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: 'Mời nhập đánh giá',
                          border: InputBorder.none,

                        ),
                        autofocus: false,
                        maxLines: null,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Wrap(spacing: 10, children: <Widget>[
                      Column(
                        children: <Widget>[
                          InkWell(
                            onTap: getImage,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color(0xffDB3022),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.image,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Thư Viện")
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          InkWell(
                            onTap: getImagebyCamera,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xffDB3022),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Chụp Ảnh")
                        ],
                      )
                    ]),
                    Expanded(
                      child: Container(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                        itemCount: listFiles.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 200,
                            margin: EdgeInsets.only(right: 15),
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Image.file(
                                  listFiles[index],
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: InkWell(onTap: (){
                                    showDialog(
                                      context: context,
                                      builder: (_) {
                                        // return object of type Dialog
                                        return AlertDialog(
                                          title: new Text("Lưu ý!"),
                                          content: new Text("Bạn có chắc muốn xóa sản phẩm này không?"),
                                          actions: <Widget>[
                                            // usually buttons at the bottom of the dialog
                                            new FlatButton(
                                              child: new Text("Có"),
                                              onPressed: () {

                                               setState(() {
                                                 listFiles.removeAt(index);
                                               });
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            new FlatButton(
                                              child: new Text("Hủy"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },child: Icon(Icons.cancel,color: Colors.grey,size: 30,)),
                                )
                              ],
                            ),
                          );
                        },
                      )),
                    ),
                    SizedBox(height: 30,),
                    Center(
                      child: InkWell(onTap: (){
                              uploadImages();
                      },
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(0xffDB3022),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                            child: Text("Gửi đánh giá",style: TextStyle(color: Colors.white,fontSize: 14,fontFamily: "Roboto",fontWeight: FontWeight.w500),),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
              if(_isLoadingUpload==true)Positioned(bottom: 50,right: MediaQuery.of(context).size.width/2-25,
              child: Center(child: Container(child: Center(child: CircularProgressIndicator(backgroundColor: Colors.red,)))),)
            ],
          ),
        ));
  }

  Future getImage() async {
    List<File> resultList = await FilePicker.getMultiFile(
      type: FileType.custom,
      allowedExtensions: ['jpeg', 'png'],
    );

    setState(() {
      _isLoadingChoose = true;

      listFiles.addAll(resultList);

    });
  }

  Future getImagebyCamera() async {

    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
        var result= File(pickedFile.path);
    setState(() {
      _isLoadingChoose = true;
      listFiles.add(result);
    });
  }

  Future<List<File>> getListImages() async {
    return listFiles;
  }

  Future<void> uploadImages() async {
    setState(() {
      _isLoadingUpload = true;
    });
    var request = http.MultipartRequest('POST',
        Uri.parse("https://fashionshopuit-server.azurewebsites.net/upload"));
  if(listFiles.length>0) {
    for (File fPath in listFiles) {
      List<String> typeImage = mime(fPath.path).split("/");
      request.files.add(await http.MultipartFile.fromPath(
          'multi-files', fPath.path,
          contentType: new MediaType(typeImage[0], typeImage[1])));
    }

    var res = await request.send();


    uploadImage =
        UploadImage.fromJson(json.decode(await res.stream.bytesToString()));
  }
    QueryResult result = await _client.mutate(
        MutationOptions(
            documentNode: gql(createReview),
            variables:
            {
              "cartItem_id": widget.OrderItemId,
              "data": controller.text,
              "images": listFiles.length>0?[uploadImage.images]:[],
              "star": star
            }
        )
    );
     if(!result.hasException)
       listFiles.clear();
       setState(() {

         _isLoadingUpload = false;
       });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Note!"),
          content: new Text(
              "Đã tạo đánh giá cho sản phẩm."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(
                    builder: (context)=> HomeScreen()
                    )
                );

              },
            ),

          ],
        );
      },
    );


  }

  Widget createListView(BuildContext context) {
//    if (snapshot.hasError) {
//      return Text("error createListView");
//    }
//
//    if (!snapshot.hasData) {
//      return Text("");
//    }



    return new ListView.builder(
        itemCount: listFiles.length,
        itemBuilder: (context, index) {
          return Image.file(
            listFiles[index],
            fit: BoxFit.fill,
            width: 300,
            height: 120,
            colorBlendMode: BlendMode.darken,
          );
        });
  }
}
