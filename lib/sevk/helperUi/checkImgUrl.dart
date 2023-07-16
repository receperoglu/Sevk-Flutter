import 'package:com_hello_world/sevk/const/baseUrl.dart';

checkImgUrl(item) {
  switch (item.ext) {
    case 'xlsx':
      return "https://spoprod-a.akamaihd.net/files/fabric-cdn-prod_20201207.001/assets/item-types/256/xlsx.png";
    case 'xls':
      return "https://spoprod-a.akamaihd.net/files/fabric-cdn-prod_20201207.001/assets/item-types/256/xlsx.png";
    case 'pdf':
      return "https://spoprod-a.akamaihd.net/files/fabric-cdn-prod_20201207.001/assets/item-types/256/pdf.png";
    case 'docx':
      return "https://spoprod-a.akamaihd.net/files/fabric-cdn-prod_20201207.001/assets/item-types/256/docx.png";
    case 'doc':
      return "https://spoprod-a.akamaihd.net/files/fabric-cdn-prod_20201207.001/assets/item-types/256/docx.png";
    case 'txt':
      return "https://spoprod-a.akamaihd.net/files/fabric-cdn-prod_20201207.001/assets/item-types/256/txt.png";
    default:
      return "${BaseUrl().baseDomain}/public/files/${item.path}";
  }
}
