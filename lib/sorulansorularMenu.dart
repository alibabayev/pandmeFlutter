// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class SorulanSorularMenu extends StatelessWidget {
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
    '1. Neden alışveriş yaptığım platformları price&me ile bağlamalıyım?',
    <Entry>[
      Entry("E-ticaret platformlarındaki hesaplarını price&me ile "
          "bağlandığında gerçekten kişisel en iyi fiyatlara "
          "saniyeler içinde ulaşırsın ve varsa mevcut ekstra "
          "indirimlerden yararlanırsın. price&me sana özel en iyi "
          "fiyatı bulabilmek için e-ticaret platformlarına bağlı "
          "hesaplarında tanımlı avantajları senin için analiz eder; "
          "hesabında bulunan kuponları, daha önce yararlandığın banka "
          "kampanyalarını, sana özel tanımlanmış indirimleri, daha "
          "önce kullandığın sadakat programlarını hesaplayarak sana "
          "ve bütçene avantaj sağlayacak tüm olanakları saniyeler "
          "içinde sana sunar karşına getirir."),
    ],
  ),
  Entry(
    '2. price&me hesaplarımdaki veriler nasıl korunacak?',
    <Entry>[
      Entry("price&me ile paylaştığın bütün veriler dünya standartlarında"
          " en gelişmiş güvenlik önlemleriyle kanunlara uygun bir "
          "şekilde korunur. Paylaştığın hesap bilgileri, güvenliğin "
          "tam olarak sağlanması için AES-256 bit şifreleme "
          "yöntemiyle beraber PBKDF2 SHA-256 ve \"Salted Hash\" "
          "yöntemleri de kullanılarak güvenli ve sertifikalı bulut"
          " platformunda saklanır. price&me çalışanları dahil hiç"
          " kimse hesap bilgilerine ulaşamaz. Verilerin price&me "
          "yazılımları sayesinde sana en avantajlı fiyatları sunmak "
          "için sadece algoritmalar tarafından kullanılır,"
          " insan gözü görmez."),
    ],
  ),
  Entry(
    '3. price&me hangi verileri kullanabilir?',
    <Entry>[
      Entry("- Satın alma geçmişin (daha önce aldığın ürünler)\n"
          "- Ödeme yöntemi tercihlerin\n"
          "- Sepetinin yönetimi (Sepetindeki ürünler, yeni ürün ekleme ve çıkarma)\n"
          "- Favori listen ve alışveriş listelerin\n"
          "- Daha önce yararlandığın üyelik veya sadakat program bilgileri\n"
          "- Hesap bilgilerin (Kişiyi doğrulamak için)\n"
          "- Sana özel tanımlanmış indirimler\n"
          "- Hesabındaki kuponlar\n"
          "- Üyelik statüsü\n"),
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
