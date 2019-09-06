import 'package:flutter/material.dart';

class IletisimMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Image.asset(
          'images/logo.png',
          fit: BoxFit.contain,
          height: 30,
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        iconTheme: new IconThemeData(color: Colors.orange),
      ),
      body: new Column(
        children: [
          new Expanded(
            child: new ListView(
              shrinkWrap: true,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
                  child: Text(
                    "İletişim",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                    maxLines: 5,
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
                  child: Text(
                    "Her türlü öneri veya iletişim ihtiyaçlarınız için destek@priceandme.com’a yazabilirsiniz.",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    maxLines: 5,
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
                  child: Text(
                    "Adres: Andme Yazılım San. ve Tic. A.Ş. Bahçeşehir 2 Kısım Mah. "
                    "Deniz Cad. Yeni Bahar Sok. No:1 Başakşehir / İstanbul",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
