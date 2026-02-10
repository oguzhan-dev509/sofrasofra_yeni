import 'package:flutter/material.dart';
import 'dukkan_kurulum_merkezi.dart';
import 'vitrin_merkezi.dart';

class MenuYoneticisi extends StatelessWidget {
  const MenuYoneticisi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text("SOFRASOFRA ARENASI",
            style: TextStyle(
                color: Color(0xFFFFB300),
                fontWeight: FontWeight.w900,
                letterSpacing: 2)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _arenaSatiri(context, "DÜKKANIMI KUR", "İşletme & Yasal Kayıt",
              Icons.store, const DukkanKurulumMerkezi(), true),
          _arenaSatiri(context, "VİTRİNİM", "Medya & Tanıtım", Icons.videocam,
              const VitrinMerkeziSayfasi(), false),
          _arenaSatiri(context, "AKADEMİM", "Eğitim & Gelişim", Icons.school,
              const AkademiMerkezi(), false),
          _arenaSatiri(context, "DASHBOARD", "İşletme Özeti", Icons.analytics,
              const DashboardMerkezi(), false),
          _arenaSatiri(context, "PAZARIM", "Özel Davetler", Icons.shopping_bag,
              const PazarimMerkezi(), false),
          _arenaSatiri(context, "KURUMSAL", "Yasal Yönetim", Icons.gavel,
              const KurumsalMerkezi(), false),
        ],
      ),
    );
  }

  Widget _arenaSatiri(BuildContext context, String baslik, String alt,
      IconData ikon, Widget sayfa, bool vurgu) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: vurgu
            ? const Color(0xFFFFB300).withOpacity(0.05)
            : Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: vurgu ? const Color(0xFFFFB300) : Colors.white10),
      ),
      child: ListTile(
        leading: Icon(ikon, color: const Color(0xFFFFB300)),
        title: Text(baslik,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        subtitle: Text(alt,
            style: const TextStyle(color: Colors.white38, fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios,
            size: 14, color: Colors.white24),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => sayfa)),
      ),
    );
  }
}

// --- AKADEMİ MERKEZİ (TAM KAPASİTE & AKTİF VİZYON) ---
class AkademiMerkezi extends StatelessWidget {
  const AkademiMerkezi({super.key});

  void _egitimiBaslat(BuildContext context, String baslik, String icerik) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A1A),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(baslik,
                style: const TextStyle(
                    color: Color(0xFFFFB300),
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Text(icerik,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFB300)),
              child: const Text("EĞİTİME BAŞLA",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("SOFRASOFRA AKADEMİ",
              style: TextStyle(color: Color(0xFFFFB300)))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("EĞİTİM KATEGORİLERİ",
              style: TextStyle(
                  color: Color(0xFFFFB300),
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _aktifKart(
              context,
              Icons.restaurant_menu,
              "Masterclass: Teknik & Sunum",
              "Michelin standartlarında tabaklama."),
          _aktifKart(context, Icons.business, "Girişimci Şef El Kitabı",
              "Maliyet hesabı ve dükkan yönetimi."),
          const SizedBox(height: 30),
          const Text("GELECEĞİN VİZYONU",
              style: TextStyle(
                  color: Color(0xFFFFB300),
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _aktifKart(context, Icons.eco, "Sürdürülebilir Mutfak & Sıfır Atık",
              "Malzemeyi %100 kullanma ve kârlılık stratejileri."),
          _aktifKart(
              context,
              Icons.psychology_alt,
              "Yapay Zeka Destekli Gastronomi",
              "AI ile menü planlama ve dijital tasarım."),
          const SizedBox(height: 40),
          const Text("HIZLANDIRILMIŞ EĞİTİMLER",
              style: TextStyle(
                  color: Color(0xFFFFB300),
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _egitimGrubu("AŞÇILIK", Icons.flatware,
              ["Türk Mutfağı", "Dünya Mutfağı", "Pişirme Teknikleri"]),
          _egitimGrubu("PASTACILIK", Icons.bakery_dining,
              ["Pasta Teknikleri", "Çikolata", "Tatlılar"]),
          _egitimGrubu("KAFE İŞLETMECİLİĞİ", Icons.coffee,
              ["Maliyet", "Personel", "Pazarlama"]),
        ],
      ),
    );
  }

  Widget _aktifKart(BuildContext context, IconData i, String b, String a) {
    return InkWell(
      onTap: () => _egitimiBaslat(context, b, a),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white10)),
        child: Row(children: [
          Icon(i, color: const Color(0xFFFFB300), size: 30),
          const SizedBox(width: 20),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(b,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text(a,
                    style: const TextStyle(color: Colors.white38, fontSize: 10))
              ])),
          const Icon(Icons.play_circle_fill, color: Color(0xFFFFB300))
        ]),
      ),
    );
  }

  Widget _egitimGrubu(String b, IconData i, List<String> m) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.02),
          borderRadius: BorderRadius.circular(15)),
      child: ExpansionTile(
        leading: Icon(i, color: const Color(0xFFFFB300)),
        title: Text(b,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14)),
        children: m
            .map((e) => ListTile(
                leading:
                    const Icon(Icons.check, color: Color(0xFFFFB300), size: 16),
                title: Text(e,
                    style:
                        const TextStyle(color: Colors.white70, fontSize: 13))))
            .toList(),
      ),
    );
  }
}

// --- DİĞER MODÜLLER (SABİT) ---
class DashboardMerkezi extends StatelessWidget {
  const DashboardMerkezi({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("DASHBOARD",
              style: TextStyle(color: Color(0xFFFFB300)))),
      body: const Center(
          child: Text("Veriler Yükleniyor...",
              style: TextStyle(color: Colors.white38))));
}

class PazarimMerkezi extends StatelessWidget {
  const PazarimMerkezi({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("PAZARIM",
              style: TextStyle(color: Color(0xFFFFB300)))),
      body: const Center(
          child:
              Text("Deneyimler...", style: TextStyle(color: Colors.white38))));
}

class KurumsalMerkezi extends StatelessWidget {
  const KurumsalMerkezi({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("KURUMSAL",
              style: TextStyle(color: Color(0xFFFFB300)))),
      body: const Center(
          child: Text("Yasal Bilgiler...",
              style: TextStyle(color: Colors.white38))));
}
