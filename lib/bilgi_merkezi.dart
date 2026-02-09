import 'package:flutter/material.dart';

class BilgiMerkeziSayfasi extends StatelessWidget {
  final String baslik;
  final String icerik;

  const BilgiMerkeziSayfasi({
    super.key,
    required this.baslik,
    required this.icerik,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(baslik, style: const TextStyle(color: Color(0xFFFFB300))),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Text(
          icerik,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}
