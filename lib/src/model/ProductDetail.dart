



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


class ProductDetail
{ String id;
  String name;
  List<String> images;
  String description;
  int price;
  int promotion_percent;
  int final_price;
  double rating;
  bool stock_status;
  List<Attribute> list_Attribute;
  List<OptionAmount> list_optionAmount;
  bool isFavorite;

  bool record_status;

  ProductDetail(String Id,String Name,List<String> Images,String Des,int Price,int Promotion_percent,int Final_price,double Rating,bool Stock_status,List<Attribute> List_Attribute,List<OptionAmount> list_OptionAmount, bool Record_status,bool isfavorite)
  {
    id =Id;
    name = Name;
    images = Images;
  description=Des;
  price=Price;
  promotion_percent =Promotion_percent;
  final_price= Final_price;
  rating= Rating;
  stock_status= Stock_status;
  list_Attribute = List_Attribute;
  list_optionAmount = list_OptionAmount;
 record_status =Record_status;
  isFavorite= isfavorite;
  }
}



class Attribute
{
  String name;
  List<AttributeValue> values;
  Attribute(String Name,List<AttributeValue> Values)
  {
    name =Name;
    values= Values;
  }
}

class AttributeValue {
  String id;
  String name;
  AttributeValue(String Id,String Name)
  {
    id =Id;
    name =Name;

  }
}


class OptionAmount
{
  String id;
  String option_size;
  String option_color;
  int amount;

  OptionAmount(String Id,String Option_size,String Option_color,int Amount)
  { id =Id;
    option_size= Option_size;
    option_color =Option_color;
    amount = Amount;
  }
}