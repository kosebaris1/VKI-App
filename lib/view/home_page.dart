import 'package:flutter/material.dart';
import 'package:vki_uygulama/view/women_page.dart';

import 'man_page.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, // AppBar'ı siyah yerine teal yaptım
        title: Text(
          "Ana Sayfa",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Başlığı beyaz yaptım
          ),
        ),
        centerTitle: true, // Başlık ortalandı
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.teal[100]!], // Daha sade bir geçiş
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  openManPage(context);
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/circleMan.png'),
                      radius: 60, // Erkek resmi dairesel hale getirildi ve boyutu artırıldı
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Erkek",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[900], // Yazıyı teal tonunda yaptım
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  openWomenPage(context);
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/circleWomen.png'),
                      radius: 60, // Kadın resmi dairesel hale getirildi ve boyutu artırıldı
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Kadın",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[900], // Yazıyı teal tonunda yaptım
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openManPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (BuildContext context) {
        return ManPage();
      },
    );
    Navigator.push(context, pageRoute);
  }

  void openWomenPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (BuildContext context) {
        return WomenPage();
      },
    );
    Navigator.push(context, pageRoute);
  }
}
