import 'package:com_hello_world/sevk/helperUi/blueColor.dart';
import 'package:com_hello_world/sevk/order_list.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blueColor,
          title: const Text("Sevkiyat"),
          leading: const Icon(
            Icons.list_alt_sharp,
          ),
          actions: [
            IconButton(
                onPressed: () => {}, icon: const Icon(Icons.add_circle_sharp))
          ],
        ),
        body:    OrderList()
      ),
    );
  }
}
