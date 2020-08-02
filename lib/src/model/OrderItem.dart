import 'Product.dart';

class OrderItem
{
  String id;
  String productName;
  String productImgURL;
  int productPrice;
  int count;
  String Size;
  String Color;
  bool isChosen= true;

  OrderItem(String id,String n,String imgURL,int Price,int c,String size,String color)
  { this.id =id;
    productName =n;
    productImgURL=imgURL;
    productPrice=Price;
    count =c;
    Size = size;
    Color = color;
  }
}