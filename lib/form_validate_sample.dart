import 'package:flutter/material.dart';

class FormKontrol extends StatefulWidget {
  const FormKontrol({Key? key}) : super(key: key);

  @override
  State<FormKontrol> createState() => _FormKontrolState();
}

class _FormKontrolState extends State<FormKontrol> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(bottom: size.height * 0.1),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                ),
                child: const Text(
                  " Üye Ol",
                  style: TextStyle(color: Colors.white),
                )),
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: const Text(
                  "Giriş Yap",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      )),
    );
  }
}
