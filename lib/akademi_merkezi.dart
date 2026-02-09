import 'package:flutter/material.dart';

class AkademiMerkeziSayfasi extends StatelessWidget {
  const AkademiMerkeziSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "SOFRASOFRA AKADEMİ",
          style: TextStyle(
            color: Color(0xFFFFB300),
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
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
            _akademiBaslik("EĞİTİM KATEGORİLERİ"),
            const SizedBox(height: 20),

            // 1. Kategori: Gastronomi Teknikleri
            _egitimKarti(
              "Masterclass: Teknik & Sunum",
              "Michelin standartlarında tabaklama ve bıçak sanatları.",
              Icons.restaurant_menu,
              Colors.orangeAccent,
              "12 Video",
            ),

            // 2. Kategori: İşletme Yönetimi (Bizim Farkımız!)
            _egitimKarti(
              "Girişimci Şef El Kitabı",
              "Maliyet hesabı, dijital pazarlama ve dükkan yönetimi.",
              Icons.business,
              Colors.blueAccent,
              "8 Rehber",
            ),

            // 3. Kategori: Hijyen ve Mevzuat
            _egitimKarti(
              "Mutfak Mevzuatı & Hijyen",
              "Yasal süreçler ve uluslararası hijyen standartları.",
              Icons.verified_user,
              Colors.greenAccent,
              "5 Modül",
            ),

            const SizedBox(height: 30),
            _akademiBaslik("ÖNE ÇIKAN DERSLER"),
            const SizedBox(height: 15),

            _dersListesi(
              "Yemek Fotoğrafçılığı ve Işık Kullanımı",
              "45 Dakika",
              Icons.camera_alt,
            ),
            _dersListesi(
              "Sıfır Atık ile Maksimum Lezzet",
              "30 Dakika",
              Icons.eco,
            ),
            _dersListesi(
              "Menü Psikolojisi ve Fiyatlandırma",
              "55 Dakika",
              Icons.analytics,
            ),
          ],
        ),
      ),
    );
  }

  Widget _akademiBaslik(String baslik) {
    return Text(
      baslik,
      style: const TextStyle(
        color: Color(0xFFFFB300),
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _egitimKarti(
    String baslik,
    String alt,
    IconData ikon,
    Color renk,
    String adet,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: renk.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(ikon, color: renk),
        ),
        title: Text(
          baslik,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          alt,
          style: const TextStyle(color: Colors.white60, fontSize: 12),
        ),
        trailing: Text(
          adet,
          style: const TextStyle(
            color: Color(0xFFFFB300),
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _dersListesi(String ders, String sure, IconData ikon) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(ikon, color: Colors.white24, size: 18),
      title: Text(
        ders,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
      trailing: Text(
        sure,
        style: const TextStyle(color: Colors.white38, fontSize: 11),
      ),
    );
  }
}
