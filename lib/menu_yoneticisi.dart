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
                color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(alt,
            style: const TextStyle(color: Colors.white38, fontSize: 11)),
        trailing: const Icon(Icons.arrow_forward_ios,
            size: 14, color: Colors.white24),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => sayfa)),
      ),
    );
  }
}

// --- AKADEMİ MERKEZİ ---
class AkademiMerkezi extends StatelessWidget {
  const AkademiMerkezi({super.key});
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
          _akademiKart(Icons.restaurant_menu, "Masterclass: Teknik & Sunum",
              "Michelin standartlarında tabaklama."),
          _akademiKart(Icons.business, "Girişimci Şef El Kitabı",
              "Maliyet hesabı ve dükkan yönetimi."),
          _akademiKart(Icons.verified_user, "Mutfak Mevzuatı & Hijyen",
              "Yasal süreçler ve standartlar."),
        ],
      ),
    );
  }

  Widget _akademiKart(IconData i, String b, String a) => Container(
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
              ]))
        ]),
      );
}

// --- DASHBOARD MERKEZİ ---
class DashboardMerkezi extends StatelessWidget {
  const DashboardMerkezi({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("İŞLETME ÖZETİ",
              style: TextStyle(color: Color(0xFFFFB300)))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Row(children: [
            _stat(Icons.people, "1.240", "Ziyaretçi"),
            const SizedBox(width: 10),
            _stat(Icons.shopping_cart, "86", "Sipariş")
          ]),
          const SizedBox(height: 15),
          Row(children: [
            _stat(Icons.star, "%94", "Popülerlik"),
            const SizedBox(width: 10),
            _stat(Icons.payments, "₺14.250", "Kazanç")
          ]),
          const SizedBox(height: 30),
          _asistan(),
        ]),
      ),
    );
  }

  Widget _stat(IconData i, String d, String b) => Expanded(
      child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            Icon(i, color: const Color(0xFFFFB300)),
            Text(d,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(b, style: const TextStyle(fontSize: 10, color: Colors.white38))
          ])));
  Widget _asistan() => Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: const Color(0xFFFFB300).withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFFFB300).withOpacity(0.5))),
      child: const Text(
          "Akıllı Asistan: İzmir Bombası tabağın %40 daha fazla tıklandı!",
          style: TextStyle(fontSize: 12, color: Colors.white)));
}

// --- PAZARIM MERKEZİ (DENEYİM PAZARI GÖRSELİNDEKİ TASARIM) ---
class PazarimMerkezi extends StatelessWidget {
  const PazarimMerkezi({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("DENEYİM PAZARI",
              style: TextStyle(color: Color(0xFFFFB300)))),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _deneyimKart("Boğaz'da Gastronomi Gecesi", "7 aşamalı tadım menüsü.",
              "₺4.500 / Kişi", Icons.stars),
          _deneyimKart("Artizan Sos Paketi (3'lü)",
              "Dükkanınızın imza sosları.", "₺850", Icons.inventory_2),
          const SizedBox(height: 25),
          const Text("SİPARİŞ VE REZERVASYON AKIŞI",
              style: TextStyle(
                  color: Color(0xFFFFB300),
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          _akisSatiri(
              "Bekleyen Talepler", "3 Yeni İstek", Icons.hourglass_empty),
          _akisSatiri(
              "Hazırlanan Deneyimler", "5 Aktif Süreç", Icons.restaurant),
        ],
      ),
    );
  }

  Widget _deneyimKart(String b, String a, String f, IconData i) => Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white10)),
        child: Row(children: [
          Icon(i, color: const Color(0xFFFFB300)),
          const SizedBox(width: 15),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(b, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(a,
                    style:
                        const TextStyle(color: Colors.white38, fontSize: 10)),
                const SizedBox(height: 5),
                Text(f,
                    style: const TextStyle(
                        color: Color(0xFFFFB300), fontWeight: FontWeight.bold))
              ])),
          const Text("YÖNET",
              style: TextStyle(
                  color: Color(0xFFFFB300),
                  fontSize: 10,
                  fontWeight: FontWeight.bold))
        ]),
      );
  Widget _akisSatiri(String b, String s, IconData i) => ListTile(
      leading: Icon(i, color: const Color(0xFFFFB300)),
      title: Text(b, style: const TextStyle(fontSize: 13)),
      subtitle:
          Text(s, style: const TextStyle(fontSize: 10, color: Colors.white38)),
      trailing: const Icon(Icons.chevron_right, size: 16));
}

// --- KURUMSAL MERKEZİ (KURUMSAL YÖNETİM GÖRSELİNDEKİ TASARIM) ---
class KurumsalMerkezi extends StatelessWidget {
  const KurumsalMerkezi({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("KURUMSAL YÖNETİM",
              style: TextStyle(color: Color(0xFFFFB300)))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          _input("Banka Adı", Icons.account_balance),
          _input("IBAN Numarası", Icons.credit_card),
          _input("Vergi No / TC No", Icons.badge),
          const SizedBox(height: 30),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFB300),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text("GÜNCELLE VE MÜHÜRLE",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))),
          const Spacer(),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Hakkımızda",
                    style: TextStyle(color: Colors.white38, fontSize: 10)),
                Text("KVKK",
                    style: TextStyle(color: Colors.white38, fontSize: 10)),
                Text("İletişim",
                    style: TextStyle(color: Colors.white38, fontSize: 10))
              ]),
        ]),
      ),
    );
  }

  Widget _input(String l, IconData i) => Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(i, color: const Color(0xFFFFB300), size: 18),
              labelText: l,
              labelStyle: const TextStyle(color: Colors.white38, fontSize: 12),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white10)))));
}
