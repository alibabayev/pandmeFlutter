import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class NasilCalisirMenu extends StatelessWidget {
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
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 10.0),
                  child: new Center(
                    child: Text(
                      "Kişisel Alışveriş Asistanın’la Tanış",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                      maxLines: 5,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 10.0),
                  child: new Center(
                    child: Transform(
                      child: SvgPicture.asset(
                        'images/icon-orange-right-arrow.190a2bf5.svg',
                      ),
                      alignment: FractionalOffset.center,
                      transform: new Matrix4.identity()
                        ..rotateZ(90 * 3.1415927 / 180),
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 10.0),
                  child: SvgPicture.asset(
                    'images/icon-dark-connect.923e9c98.svg',
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 10.0),
                  child: new Center(
                    child: Text(
                      "Online Alışveriş Hesaplarını Bağla",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                      maxLines: 5,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 10.0),
                  child: new Center(
                    child: Text(
                      "Alışveriş Yaptığın Siteleri price&me’ye bağla.",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                      maxLines: 5,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 10.0),
                  child: SvgPicture.asset(
                    'images/welcome-section-platform.616c8a16.svg',
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 10.0),
                  child: new Center(
                    child: Transform(
                      child: SvgPicture.asset(
                        'images/icon-orange-right-arrow.190a2bf5.svg',
                      ),
                      alignment: FractionalOffset.center,
                      transform: new Matrix4.identity()
                        ..rotateZ(90 * 3.1415927 / 180),
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 10.0),
                  child: SvgPicture.asset(
                    'images/icon-dark-graphic.fb1fe43f.svg',
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 10.0),
                  child: new Center(
                    child: Text(
                      "Sana Özel Tüm Kampanyaları Gör",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                      maxLines: 5,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 10.0),
                  child: new Center(
                    child: Text(
                      "price&me, hesaplarındaki "
                      "kuponları ve tüm kampanyaları bir araya getirir, "
                      "sana özel fiyatı hesaplar.",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                      maxLines: 10,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 10.0),
                  child: new Center(
                    child: Transform(
                      child: SvgPicture.asset(
                        'images/icon-orange-right-arrow.190a2bf5.svg',
                      ),
                      alignment: FractionalOffset.center,
                      transform: new Matrix4.identity()
                        ..rotateZ(90 * 3.1415927 / 180),
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 10.0),
                  child: SvgPicture.asset(
                    'images/icon-dark-basket.94794a24.svg',
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 10.0),
                  child: new Center(
                    child: Text(
                      "Ekstra price&me İndiriminden Faydalan",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                      maxLines: 5,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 20.0),
                  child: new Center(
                    child: Text(
                      "price&me, alışveriş "
                      "tercihlerine ve seçtiğin ödeme yöntemlerine göre sana "
                      "eşsiz ekstra indirimler sunar.",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                      maxLines: 10,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 10.0),
                  child: Center(
                    child: Text(
                      "Sana Özel Olduğu için En Ucuz",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                      maxLines: 5,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 10.0),
                  child: SvgPicture.asset(
                    'images/icon-dark-advantage.fe030034.svg',
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 10.0),
                  child: new Center(
                    child: Text(
                      "Sadece Senin İçin En Avantajlı",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                      maxLines: 10,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 20.0),
                  child: new Center(
                    child: Text(
                      "Fiyatlar kişiden kişiye değişir. Sahip olduğun e-ticaret "
                      "sitelerindeki puanların, hesap geçmişin, banka kampanyaları,"
                      " üye olduğun sadakat programların alabileceğin gerçek "
                      "fiyatları değiştirir. price&me tüm bu değişkenleri sana "
                      "özel fiyatı bulmak için anında senin için hesaplar.",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                      maxLines: 15,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 10.0),
                  child: SvgPicture.asset(
                    'images/icon-dark-best-price.fb3cc4f7.svg',
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 10.0),
                  child: new Center(
                    child: Text(
                      "Gerçekten En İyi Fiyatı Sunar",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                      maxLines: 10,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 20.0),
                  child: new Center(
                    child: Text(
                      "Paylaştığın bilgiler sadece ve sadece sana daha avantajlı "
                      "indirimleri sunmak için kullanılır. "
                      "Başka bir amaçla asla kullanılmaz.",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                      maxLines: 15,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 10.0),
                  child: SvgPicture.asset(
                    'images/icon-dark-confidence.ad3d2ac9.svg',
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 10.0),
                  child: new Center(
                    child: Text(
                      "price&me’de Güvendesin",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                      maxLines: 10,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 20.0),
                  child: new Center(
                    child: Text(
                      "price&me e-ticaret hesaplarındaki bilgileri en gelişmiş "
                      "güvenlik sistemleriyle korur. Bilgilerine price&me çalışanları "
                      "dahil hiç kimse erişemez.",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                      maxLines: 10,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 10.0),
                  child: SvgPicture.asset(
                    'images/icon-dark-easy.77ffb351.svg',
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 10.0),
                  child: new Center(
                    child: Text(
                      "İnternet Alışverişi Artık Daha Kolay",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                      maxLines: 10,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 20.0),
                  child: new Center(
                    child: Text(
                      "Online alışverişler bazen kafa karıştırır. price&me sana"
                      " internet alışverişlerini güvenilir ve basit kılar.",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                      maxLines: 10,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 10.0),
                  child: SvgPicture.asset(
                    'images/icon-dark-assistant.bcd79323.svg',
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 10.0),
                  child: new Center(
                    child: Text(
                      "Senin Kişisel Alışveriş Asistanın",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                      maxLines: 10,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 20.0),
                  child: new Center(
                    child: Text(
                      "price&me seni tanır ve sana eşsiz, sadece sana özel "
                      "indirimler sunmak için banka ve e-ticaret "
                      "sitelerinden senin için indirim ister.",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                      maxLines: 15,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 10.0),
                  child: SvgPicture.asset(
                    'images/icon-dark-allinone.54c98990.svg',
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 10.0),
                  child: new Center(
                    child: Text(
                      "Tüm Alışverişlerin Tek Bir Yerde",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 28, fontFamily: 'Montserrat'),
                      maxLines: 5,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 20.0),
                  child: new Center(
                    child: Text(
                      "price&me’de farklı platformlardan yaptığın alışverişleri "
                      "bir arada görebilir, takip edebilirsin.",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                      maxLines: 10,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 10.0),
                  child: SvgPicture.asset(
                    'images/icon-dark-time.c5f342d7.svg',
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 10.0),
                  child: new Center(
                    child: Text(
                      "Zamanın Sana Kalsın",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                      maxLines: 5,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 20.0),
                  child: new Center(
                    child: Text(
                      "price&me seni, bir ürün almak istediğinde saatlerce araştırma yapmaktan kurtarır."
                      " Aradığın ürünü saniyeler içerisinde hangi siteden ve en avantajlı hali ile "
                      "alabileceğini öğrenirsin. Böylelikle sevdiğin şeyleri "
                      "yapmak için zaman senin olur.",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                      maxLines: 15,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 17.0, 20.0, 10.0),
                  child: SvgPicture.asset(
                    'images/icon-dark-minimal.766966bd.svg',
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 10.0),
                  child: new Center(
                    child: Text(
                      "Sadeliğin tadını çıkar",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                      maxLines: 10,
                    ),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 20.0),
                  child: new Center(
                    child: Text(
                      "price&me’nin sade tasarımı sayesinde istediğin ürünü kolaylıkla bulursun. "
                      "Seni ve ilgilerini iyi analiz eden alışveriş asistanın aradığın ürünle ilgisi "
                      "olmayan ürünleri karşına getirmez. İlgili ürünün fiyatını sunarken sana göre en hesaplı "
                      "3 fiyatı karşına getirir ve sana seçim kolaylığı sunar. Amacına hizmet etmeyen"
                      " hiçbir detay sayfanda yer almaz.",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                      maxLines: 15,
                    ),
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
