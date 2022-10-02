import 'package:flutter/material.dart';

class FruitList extends StatefulWidget {
  const FruitList({Key? key}) : super(key: key);
  @override
  State<FruitList> createState() => _State();
}

class _State extends State<FruitList> {
  late List data = [
    {"id": "1", "title": "Çilek"},
    {"id": "2", "title": "Muz"},
    {"id": "3", "title": "Karpuz"},
    {"id": "4", "title": "Kavun"}
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            centerTitle: false,
            actions: [
              IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.add_circle_sharp))
            ],
            title: const Text("Fruits"),
            titleTextStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            backgroundColor: Colors.purple),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.0, color: const Color(0xFFCDCDCD)),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFF2F2F2),
                        spreadRadius: 1,
                        offset: Offset(0, 3)),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                            data[index]["id"] + ". " + data[index]["title"])),
                    IconButton(
                        onPressed: () => {},
                        icon: const Icon(Icons.keyboard_arrow_right))
                  ],
                ),
              ),
            );
          },
        ),
      );
}
