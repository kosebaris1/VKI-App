import 'package:flutter/material.dart';

class WomenPage extends StatefulWidget {
  @override
  State<WomenPage> createState() => _WomenPageState();
}

class _WomenPageState extends State<WomenPage> {
  double sonuc = 0;
  double idealKilo = 0;
  String kiloDurumu = "Bilinmiyor";

  TextEditingController boyController = TextEditingController();
  TextEditingController kiloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kadınlar İçin VKİ Hesaplama"),
        backgroundColor: Colors.pink[700],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink[400]!, Colors.pink[200]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),

            // Boy Girişi
            TextField(
              controller: boyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Boyunuzu giriniz (metre cinsinden)",
                suffixText: "m",
                labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.3),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),

            // Kilo Girişi
            TextField(
              controller: kiloController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Kilonuzu giriniz (kg cinsinden)",
                suffixText: "kg",
                labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.3),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 30),

            // Hesapla ve Sil Butonları
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: calculate,
                  child: Text(
                    "Hesapla",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    backgroundColor: Colors.green[700]!,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: deleteText,
                  child: Text(
                    "Sil",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    backgroundColor: Colors.red[700]!,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            // Sonuç Metinleri
            Text(
              "Vücut Kitle Endeksi: ${sonuc.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "İdeal Kilonuz: ${idealKilo.toStringAsFixed(2)} kg",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Kilo Durumunuz: $kiloDurumu",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void calculate() {
    String boyText = boyController.text.trim();
    String kiloText = kiloController.text.trim();
    try {
      double boy = double.parse(boyText);
      double kilo = double.parse(kiloText);

      setState(() {
        sonuc = kilo / (boy * boy);
        double boyCm = boy * 100; // Boyu santimetreye çeviriyoruz
        idealKilo = 45.5 + 2.3 * ((boyCm / 2.54) - 60);
        if(sonuc<3){
          kiloDurumu= "Lütfen boy değerini metre cinsinden giriniz(örn:1.87)";
        }
        else if (sonuc < 18.5) {
          kiloDurumu = "Zayıf";
        } else if (sonuc >= 18.5 && sonuc < 24.99) {
          kiloDurumu = "Normal Kilolu";
        } else if (sonuc >= 25.0 && sonuc < 29.99) {
          kiloDurumu = "Kilolu";
        } else {
          kiloDurumu = "Obez";
        }
      });
    } catch (e) {
      setState(() {
        kiloDurumu = "Lütfen geçerli değerler giriniz!";
      });
    }
  }

  void deleteText() {
    setState(() {
      boyController.clear();
      kiloController.clear();
      sonuc = 0;
      idealKilo = 0;
      kiloDurumu = "Bilinmiyor";
    });
  }
}
