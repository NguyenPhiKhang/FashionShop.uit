
//class Product {
//String ID;
//int product_code;
//String name;
//String img_url;
//List<String> images;
//double price;
//double final_price;
//double promotion_percent;
//String description;
//int total_review;
//int order_count;
//double weight;
//String short_description;
import 'package:fashionshop/src/model/Category.dart';

////rating star
//
//bool stock_status;
////review
//  bool is_freeship;
//  //attribute
//  String category_id;
//  //categories
//  Product(){}
//}

//
//class Product
//{ String id;
//  String name;
//  String imgUrl;
//  List<String> images;
//  String description;
//  int price;
//  int promotion_percent;
//  int final_price;
//  double rating;
//  bool stock_status;
//  bool is_freeship;
//  List<Attribute> list_Attribute;
//  List<OptionAmount> list_optionAmount;
//
//  bool record_status;
//
//  Product(String Id,String Name,String ImgUrl,List<String> Images,String Des,int Price,int Promotion_percent,int Final_price,double Rating,bool Stock_status,bool Is_freeship,List<Attribute> List_Attribute,List<OptionAmount> list_OptionAmount, bool Record_status)
//  {
//    id =Id;
//    name = Name;
//    imgUrl =ImgUrl;
//    images = Images;
//  description=Des;
//  price=Price;
//  promotion_percent =Promotion_percent;
//  final_price= Final_price;
//  rating= Rating;
//  stock_status= Stock_status;
//  is_freeship = Is_freeship;
//  list_Attribute = List_Attribute;
//  list_optionAmount = list_OptionAmount;
// record_status =Record_status;
//  }
//}
//
//
//
//class Attribute
//{
//  String name;
//  List<AttributeValue> values;
//  Attribute(String Name,List<AttributeValue> Values)
//  {
//    name =Name;
//    values= Values;
//  }
//}
//
//class AttributeValue {
//  String id;
//  String name;
//  AttributeValue(String Id,String Name)
//  {
//    id =Id;
//    name =Name;
//
//  }
//}
//
//
//class OptionAmount
//{
//  String id;
//  String option_size;
//  String option_color;
//  int amount;
//
//  OptionAmount(String Id,String Option_size,String Option_color,int Amount)
//  { id =Id;
//    option_size= Option_size;
//    option_color =Option_color;
//    amount = Amount;
//  }
//}


class Product
{ String id;
  String name;
  String imgUrl;

  int price;
  int promotion_percent;
  int final_price;
  double rating;
  bool stock_status;

  bool record_status;

  Product(String Id,String Name,String ImgUrl,int Price,int Promotion_percent,int Final_price,double Rating,bool Stock_status, bool Record_status)
  {
    id =Id;
    name = Name;
    imgUrl =ImgUrl;

  price=Price;
  promotion_percent =Promotion_percent;
  final_price= Final_price;
  rating= Rating;
  stock_status= Stock_status;

 record_status =Record_status;
  }
}