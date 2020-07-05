import 'Product.dart';

class OrderItem
{
  Product product;
  int count;
  String Size;
  String Color;

  OrderItem(Product pro,int c,String size,String color)
  {
    product= pro;
    count =c;
    Size = size;
    Color = color;
  }
}