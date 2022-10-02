import 'package:com_hello_world/sevk/models/OrderFiles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ModalPicture extends StatelessWidget {
  final OrderFiles pictureUrl;
  final baseUrl = "https://recep.space/abi/dosyalar/";
  final documentViewerUrl =
      "https://view.officeapps.live.com/op/embed.aspx?src=";
  const ModalPicture({Key? key, required this.pictureUrl}) : super(key: key);

  checkFileType(item, url) {
    if (item.fileType == "Picture") {
      return Image.network(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    var url = baseUrl + pictureUrl.path.toString();
    if (pictureUrl.fileType == "Document") {
      if ((pictureUrl.ext == ".pdf") || (pictureUrl.ext == ".txt")) {
        launchUrl(Uri.parse(url));
      } else {
        launchUrl(Uri.parse(documentViewerUrl + url));
      }
      Navigator.pop(context);
      return Container();
    }
    return checkFileType(pictureUrl, url);
  }
}
