import 'package:com_hello_world/sevk/const/baseUrl.dart';
import 'package:com_hello_world/sevk/models/OrderFiles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ModalPicture extends StatelessWidget {
  final OrderFiles pictureUrl;

  final documentViewerUrl =
      "https://view.officeapps.live.com/op/embed.aspx?src=";
  final pdfUrl = "https://docs.google.com/viewer?url=";
  const ModalPicture({Key? key, required this.pictureUrl}) : super(key: key);

  checkFileType(item, url) {
    if (item.type == "Picture") {
      return Image.network(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    var url = "${BaseUrl().baseDomain}public/files/${pictureUrl.path}";

    if (pictureUrl.type == "Document") {
      if ((pictureUrl.ext == "pdf") || (pictureUrl.ext == "txt")) {
        launchUrl(Uri.parse(pdfUrl + url));
      } else {
        launchUrl(Uri.parse(documentViewerUrl + url));
      }
      Navigator.pop(context);
      return Container();
    }
    return checkFileType(pictureUrl, url);
  }
}
