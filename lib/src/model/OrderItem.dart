import 'Product.dart';

class OrderItem
{
  String productName;
  String productImgURL;
  int productPrice;
  int count;
  String Size;
  String Color;

  OrderItem(String n,String imgURL,int Price,int c,String size,String color)
  {
    productName =n;
    productImgURL=imgURL;
    productPrice=Price;
    count =c;
    Size = size;
    Color = color;
  }
}