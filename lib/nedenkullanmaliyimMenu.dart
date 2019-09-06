import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NedenKullanmaliyim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return EntryItem(data[index]);
        },
        itemCount: data.length,
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    '1. Sadece price&me gerçek kişisel fiyatı gösterir.',
    <Entry>[
      Entry(
        "E-ticaret hesaplarını price&me ile bağladığında net kişisel fiyatı anında görürsün.\n"
        "\nÖrneğin 3000 TL’lik bir ürün alacaksın, n11.com hesabında "
        "kullanabileceğin 30 TL kupon varsa bu ürünü price&me’de 2970"
        " TL’ye satın alabileceğini anında görürsün.\n"
        "\nAyrıca senin kullandığın kredi kartına 100 TL "
        "puan kazanabileceksen price&me bunu da senin için hesaplar.",
      ),
    ],
  ),
  Entry(
    '2. Sadece price&me’de bulabileceğin ekstra indirimlerden yararlanabilirsin.',
    <Entry>[
      Entry("Hesaplarını price&me ile bağladığında sadece senin için"
          " oluşturulan ekstra banka kampanyalarında ve sadece senin"
          " o anda aradığın ürün için geçerli ekstra "
          "indirimlerinden yararlanabilirsin."),
    ],
  ),
  Entry(
    '3. Sadece price&me seni tanır.',
    <Entry>[
      Entry("price&me senin kişisel alışveriş asistanındır. Senin geçmiş"
          " alışveriş tercihlerinden seni tanır ve sadece senin"
          " için en iyi fiyat ve ürünleri bulur ve sadece senin "
          "yararlanabileceğin ekstra indirimler sunar."),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(
        root.title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Montserrat',
        ),
        maxLines: 5,
      ),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

/*
class NedenKullanmaliyim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "price&me Kullanman için En Önemli 3 Neden",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 22),
                    maxLines: 5,
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "1. Sadece price&me gerçek kişisel fiyatı gösterir.\n",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 22),
                    maxLines: 5,
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "E-ticaret hesaplarını price&me ile bağladığında net kişisel fiyatı anında görürsün.\n"
                    "\nÖrneğin 3000 TL’lik bir ürün alacaksın, n11.com hesabında "
                    "kullanabileceğin 30 TL kupon varsa bu ürünü price&me’de 2970"
                    " TL’ye satın alabileceğini anında görürsün.\n"
                    "\nAyrıca senin kullandığın kredi kartına 100 TL puan kazanabileceksen price&me bunu da senin için hesaplar.",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 22),
                    maxLines: 10,
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "2. Sadece price&me’de bulabileceğin ekstra indirimlerden yararlanabilirsin.\n",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 22),
                    maxLines: 5,
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Hesaplarını price&me ile bağladığında sadece senin için"
                    " oluşturulan ekstra banka kampanyalarında ve sadece senin"
                    " o anda aradığın ürün için geçerli ekstra "
                    "indirimlerinden yararlanabilirsin.",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 22),
                    maxLines: 8,
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "3. Sadece price&me seni tanır.\n",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 22),
                    maxLines: 5,
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "price&me senin kişisel alışveriş asistanındır. Senin geçmiş"
                    " alışveriş tercihlerinden seni tanır ve sadece senin"
                    " için en iyi fiyat ve ürünleri bulur ve sadece senin "
                    "yararlanabileceğin ekstra indirimler sunar.",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 22),
                    maxLines: 10,
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
*/
