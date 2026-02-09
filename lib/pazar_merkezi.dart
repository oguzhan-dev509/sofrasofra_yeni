import 'package:flutter/material.dart';

class PazarMerkeziSayfasi extends StatelessWidget {
  const PazarMerkeziSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "DENEYİM PAZARI",
          style: TextStyle(color: Color(0xFFFFB300), letterSpacing: 2),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _pazarBaslik("ÖNE ÇIKAN DENEYİMLER"),
            const SizedBox(height: 20),

            // 1. Örnek Deneyim: Özel Şef Daveti
            _deneyimKarti(
              "Boğaz'da Gastronomi Gecesi",
              "Şef Kerem'den 7 aşamalı tadım menüsü.",
              "₺4.500 / Kişi",
              Icons.stars,
              const Color(0xFFFFD700),
            ),

            // 2. Örnek Deneyim: Gurme Ürün
            _deneyimKarti(
              "Artizan Sos Paketi (3'lü)",
              "Dükkanınızın imza sosları, özel cam kavanozda.",
              "₺850",
              Icons.card_giftcard,
              Colors.greenAccent,
            ),

            const SizedBox(height: 30),
            _pazarBaslik("SİPARİŞ VE REZERVASYON AKIŞI"),
            const SizedBox(height: 15),

            _akimListesi(
              "Bekleyen Talepler",
              "3 Yeni İstek",
              Icons.hourglass_empty,
              Colors.orangeAccent,
            ),
            _akimListesi(
              "Hazırlanan Deneyimler",
              "5 Aktif Süreç",
              Icons.restaurant,
              Colors.blueAccent,
            ),
            _akimListesi(
              "Tamamlanan Satışlar",
              "128 Başarılı",
              Icons.check_circle,
              Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _pazarBaslik(String baslik) {
    return Text(
      baslik,
      style: const TextStyle(
        color: Color(0xFFFFB300),
        fontSize: 13,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _deneyimKarti(
    String baslik,
    String alt,
    String fiyat,
    IconData ikon,
    Color renk,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(ikon, color: renk, size: 20),
              const SizedBox(width: 10),
              Text(
                baslik,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            alt,
            style: const TextStyle(color: Colors.white60, fontSize: 12),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                fiyat,
                style: TextStyle(
                  color: renk,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: renk.withOpacity(0.1),
                  foregroundColor: renk,
                ),
                onPressed: () {},
                child: const Text("YÖNET"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _akimListesi(String baslik, String alt, IconData ikon, Color renk) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(ikon, color: renk),
      title: Text(
        baslik,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      subtitle: Text(
        alt,
        style: const TextStyle(color: Colors.white38, fontSize: 11),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.white12),
    );
  }
}
