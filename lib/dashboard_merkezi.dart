import 'package:flutter/material.dart';

class DashboardMerkeziSayfasi extends StatelessWidget {
  const DashboardMerkeziSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "İŞLETME ÖZETİ",
          style: TextStyle(color: Color(0xFFFFB300), letterSpacing: 1.5),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFFFFB300)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 1. ÖZET KARTLARI (Hızlı Bakış)
            Row(
              children: [
                _ozetKart(
                  "Ziyaretçi",
                  "1.240",
                  Icons.people,
                  Colors.blueAccent,
                ),
                const SizedBox(width: 15),
                _ozetKart(
                  "Sipariş",
                  "86",
                  Icons.shopping_cart,
                  Colors.orangeAccent,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                _ozetKart("Popülerlik", "%94", Icons.star, Colors.purpleAccent),
                const SizedBox(width: 15),
                _ozetKart(
                  "Kazanç",
                  "₺14.250",
                  Icons.payments,
                  Colors.greenAccent,
                ),
              ],
            ),

            const SizedBox(height: 30),

            // 2. YAPAY ZEKA TAVSİYESİ (Platformun Üstünlüğü Buradan Geliyor)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white10, Colors.white.withOpacity(0.02)],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFFFFB300).withOpacity(0.3),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.psychology, color: Color(0xFFFFB300)),
                      SizedBox(width: 10),
                      Text(
                        "AKILLI ASİSTAN",
                        style: TextStyle(
                          color: Color(0xFFFFB300),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Şefim, son 24 saatte 'İzmir Bombası' tabağın %40 daha fazla tıklandı. Bu tabağı Vitrinim'de öne çıkarmayı unutma!",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 3. EN ÇOK TIKLANANLAR LİSTESİ
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "EN POPÜLER TABAKLARIN",
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 15),
            _populerSatir("Dana Rosto", "420 Tıklanma"),
            _populerSatir("Kuzu Tandır", "310 Tıklanma"),
            _populerSatir("Ev Yapımı Makarna", "295 Tıklanma"),
          ],
        ),
      ),
    );
  }

  Widget _ozetKart(String baslik, String deger, IconData ikon, Color renk) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(ikon, color: renk, size: 24),
            const SizedBox(height: 15),
            Text(
              deger,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              baslik,
              style: const TextStyle(color: Colors.white38, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _populerSatir(String isim, String veri) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(isim, style: const TextStyle(color: Colors.white)),
      subtitle: Text(
        veri,
        style: const TextStyle(color: Colors.white24, fontSize: 11),
      ),
      trailing: const Icon(
        Icons.trending_up,
        color: Colors.greenAccent,
        size: 16,
      ),
    );
  }
}
