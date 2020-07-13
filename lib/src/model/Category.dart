class CategoryLevel1 {

String name;
List<CategoryLevel2> listSub_cat;
CategoryLevel1(String Name,List<CategoryLevel2> list)
{

  name = Name;
  listSub_cat =list;
}


}

class CategoryLevel2{
  String icon;
  String imgUrl;
  String name;
   int level_code;
  List<CategoryLevel3> listSub_cat;

  CategoryLevel2(String Icon,String Img,String Name,int Level_code, List<CategoryLevel3> list,)
  {
     icon= Icon;
    imgUrl =Img;
    name = Name;
    level_code=Level_code;
    listSub_cat =list;
  }
}



class CategoryLevel3{
  String IconUrl;

  String name;
  int level_code;
  CategoryLevel3(String Icon,String Name,int Level_code)
  {
    IconUrl = Icon;

    name = Name;
    level_code = Level_code;

  }
}
