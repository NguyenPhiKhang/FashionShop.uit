


class Filter {
  int level_code;
  List<String> colorID;
  List<String> sizeID;
  double min_price;
  double max_price;
  Filter(int Level_code,List<String>colors, List<String> sizes, double Min_price,double Max_price)
  {
    level_code = Level_code;
    colorID =colors;
    sizeID = sizes;
    min_price = Min_price;
    max_price = Max_price;
  }
 }