import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
//import 'package:image_picker/image_picker.dart';

class UrlLauncherSample extends StatefulWidget {
  const UrlLauncherSample({Key? key}) : super(key: key);

  @override
  State<UrlLauncherSample> createState() => _UrlLauncherSampleState();
}

class _UrlLauncherSampleState extends State<UrlLauncherSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Url Launcher Sample")),
      body: Column(children: [
        ElevatedButton(
            onPressed: () async {
              if (await canLaunchUrlString("tel:-90 5555555555")) {
                await launchUrlString("tel:-90 5555555555");
              }
            },
            child: const Text("Arama yap")),
        ElevatedButton(
          onPressed: () {
            try {
              launchUrl(Uri.parse('sms2:+5555555555'));
            } catch (e) {
              print("hata $e");
            }
          },
          child: const Text("Sms Gönder"),
        ),
        ElevatedButton(
          onPressed: () {
            launchUrlString('https://google.com/');
          },
          child: const Text("google.com"),
        ),
        ElevatedButton(
          onPressed: () {
            try {
              launchUrl(Uri.parse('mailto:info@google.com?subject=sd&body=s'));
            } catch (e) {
              print("hata $e");
            }
          },
          child: const Text("Bize Ulaşın"),
        ),
        ElevatedButton(
          onPressed: () async {
            try {
              //final ImagePicker _picker = ImagePicker();
              //final img = await _picker.pickImage(source: ImageSource.gallery);

            } catch (e) {
              print("hata $e");
            }
          },
          child: const Text("Bize Ulaşın"),
        )
      ]),
    );
  }
}
