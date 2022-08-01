
class ToUppCase {
  static String convert(String text){
    if (text.contains("_")) {
      final nameList = text.split("_");
      String name = "";
      for (var element in nameList) {
        name += element.replaceFirst(element[0], element[0].toUpperCase());
      }    
      return name;
    }
    return text.replaceFirst(text[0], text[0].toUpperCase());
  }
}