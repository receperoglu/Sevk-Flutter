import 'package:flutter/material.dart';
import 'package:simple_image_cropper/simple_image_cropper.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<ImagePickerScreen> {
  late ImageProvider _image;
  final GlobalKey<SimpleImageCropperState> cropKey = GlobalKey();

  @override
  void initState() {
    _image = const NetworkImage(
        'https://google.com/images/home_sliders/mobile2.jpg');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.crop),
          onPressed: () async {
            Image? image = await cropKey.currentState?.cropImage();
            if (image != null) {
              setState(() => _image = image.image);
            }
          },
        ),
        body: SizedBox(
            height: size.height,
            width: size.width,
            child: SimpleImageCropper(
              key: cropKey,
              height: size.height,
              width: size.width,
              image: _image,
            )));
  }
}
