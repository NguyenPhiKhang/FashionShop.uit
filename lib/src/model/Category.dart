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
  String imgUrl;
  String name;

  List<CategoryLevel3> listSub_cat;

  CategoryLevel2(String Img,String Name, List<CategoryLevel3> list)
  {

    imgUrl =Img;
    name = Name;
    listSub_cat =list;
  }
}



class CategoryLevel3{
  String IconUrl;

  String name;
  CategoryLevel3(String Icon,String Name)
  {
    IconUrl = Icon;

    name = Name;

  }
}
