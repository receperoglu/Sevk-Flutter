import 'package:com_hello_world/size.dart';
import 'package:flutter/material.dart';

class GallerySample extends StatefulWidget {
  const GallerySample({Key? key}) : super(key: key);

  @override
  State<GallerySample> createState() => _GallerySampleState();
}

class _GallerySampleState extends State<GallerySample> {
  var liste = [
    "https://denemek.com/images/products/10x15-Klasik-Fotograf-Baski---15-Adet09130.jpg",
    "https://denemek.com/images/products/10x15-Klasik-Fotograf-Baski---15-Adet17109.JPG",
    "https://denemek.com/images/products/10x15-Klasik-Fotograf-Baski---15-Adet21688.jpg"
  ];
  var liste2 = [
    {"title": "1. Foto", "id": 1},
    {"title": "2.Foto", "id": 2},
    {"id": 3, "title": "3.Foto"}
  ];
  var controller = PageController(initialPage: 0, keepPage: false);
  var currentIndex = 1;

  @override
  void didChangeDependencies() {
    SizeConfig().init(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: liste.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) => Image(
              image: NetworkImage(liste[index]),
              fit: BoxFit.cover,
              width: SizeConfig.width,
              height: SizeConfig.height,
            ),
          ),
          Positioned(
              top: 100,
              child: DropdownButton(
                items: liste2
                    .map((m) => DropdownMenuItem(
                          value: m["id"],
                          child: Text(m["title"].toString()),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    currentIndex = int.parse(value.toString());
                    controller.jumpToPage(currentIndex);
                  });
                },
                value: currentIndex,
              )),
          Positioned.fill(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: liste
                  .map((e) => AnimatedContainer(
                        margin: const EdgeInsets.only(right: 8),
                        duration: const Duration(milliseconds: 2),
                        height: 10,
                        width: currentIndex == liste.indexOf(e) ? 20 : 10,
                        decoration: BoxDecoration(
                            color: currentIndex == liste.indexOf(e)
                                ? Colors.grey
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
