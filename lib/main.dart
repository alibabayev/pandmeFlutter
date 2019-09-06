import 'package:flutter/material.dart';

import 'package:flutterup1/nasilcalisirMenu.dart';
import "package:flutterup1/hakkimizdaMenu.dart";
import "package:flutterup1/iletisimMenu.dart";
import "package:flutterup1/nedenkullanmaliyimMenu.dart";
import "package:flutterup1/sorulansorularMenu.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutterup1/mywebview.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String selectedUrl = 'https://www.priceandme.com';
void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        fontFamily: 'Montserrat',
      ),
      routes: {
        '/': (_) => const MyHomePage(),
        '/widget': (_) => new WebviewScaffold(
              key: Key('widget1'),
              url: selectedUrl,
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
              withZoom: true,
              withLocalStorage: true,
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scaffoldKeyMain = new GlobalKey<ScaffoldState>();

  void _checkIntenetConnectivity() async {
    var connectionResult = await (Connectivity().checkConnectivity());
    if (connectionResult == ConnectivityResult.mobile ||
        connectionResult == ConnectivityResult.wifi) {
      //Navigator.of(context).pushNamed('/widget');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  (MyWebView(url: 'https://www.priceandme.com'))));
    } else {
      _showDialog();
    }
    /*try {
      final result = await InternetAddress.lookup('priceandme.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        Navigator.of(context).pushNamed('/widget');
      }
    } on SocketException catch (_) {
      print('not connected');
    }*/
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("İnternet Bağlantısı Yok", style: TextStyle(fontFamily: 'Montserrat'),),
          content: new Text(
              "Uygulamayı kullanabilmeniz için internet bağlantınızın olması gerekmektedir. Lütfen bağlantı ayarlarınızı kontrol ediniz.",  style: TextStyle(fontFamily: 'Montserrat'),),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Tamam",
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToMenuPage(BuildContext context, String text) {
    switch (text) {
      case 'NedenKullanmaliyim':
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => (NedenKullanmaliyim())));
        }
        break;
      case 'NasilCalisir':
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => (NasilCalisirMenu())));
        }
        break;
      case 'SorulanSorular':
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => (SorulanSorularMenu())));
        }
        break;
      case 'Hakkimizda':
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => (HakkimizdaMenu())));
        }
        break;
      case 'Iletisim':
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => (IletisimMenu())));
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: Scaffold(
        key: _scaffoldKeyMain,
        appBar: new AppBar(
          title: Image.asset(
            'images/logo.png',
            fit: BoxFit.contain,
            height: 30,
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[100],
          iconTheme: new IconThemeData(color: Colors.orange),
          /*Text(
            'Price and Me',
            style:
                TextStyle(fontFamily: 'Silverpen', color: Colors.orange[400]),
            textScaleFactor: 2,
          ),*/
        ),
        drawer: Drawer(
          child: new Container(
            padding: const EdgeInsets.only(top: 20.0),
            child: new ListView(
              children: <Widget>[
                Image.asset(
                  'images/logo.png',
                  fit: BoxFit.contain,
                  height: 30,
                ),
                new Container(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: new Column(children: [
                    ListTile(
                      title: Text(
                        'Neden Kullanmalıyım?',
                        style: TextStyle(
                          color: Colors.orange[400],
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      onTap: () => _navigateToMenuPage(
                        context,
                        'NedenKullanmaliyim',
                      ),
                    ),
                    ListTile(
                        title: Text(
                          'Nasıl çalışır?',
                          style: TextStyle(
                            color: Colors.orange[400],
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        onTap: () {
                          _navigateToMenuPage(
                            context,
                            'NasilCalisir',
                          );
                        }),
                    ListTile(
                        title: Text(
                          'Sıkça sorulan sorular',
                          style: TextStyle(
                            color: Colors.orange[400],
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        onTap: () {
                          _navigateToMenuPage(context, 'SorulanSorular');
                        }),
                    ListTile(
                      title: Text(
                        'Hakkımızda',
                        style: TextStyle(
                          color: Colors.orange[400],
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      onTap: () => _navigateToMenuPage(context, 'Hakkimizda'),
                    ),
                    ListTile(
                      title: Text(
                        'İletişim',
                        style: TextStyle(
                          color: Colors.orange[400],
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      onTap: () => _navigateToMenuPage(context, 'Iletisim'),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
        body: new Column(
          children: [
            new Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: new GestureDetector(
                onTap: () {
                  _checkIntenetConnectivity();
                },
                child: new Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(
                        color: Colors.orange[400],
                      ),
                      borderRadius: new BorderRadius.circular(20.0)),
                  child: new Row(
                    children: [
                      new Expanded(
                        child: new Container(
                          padding: const EdgeInsets.fromLTRB(20, 6, 0, 0),
                          height: 60.0,
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: 'Ürün aramaya başla...',
                              hintStyle: TextStyle(
                                  fontSize: 20, fontFamily: 'Montserrat'),
                              border: InputBorder.none,
                            ),
                            readOnly: true,
                            onTap: _checkIntenetConnectivity,
                          ),
                        ),
                      ),
                      new GestureDetector(
                        onTap: () {
                          _checkIntenetConnectivity();
                        },
                        child: new Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: new Center(
                            child: new Image.asset(
                              'images/iconsearch90.png',
                              fit: BoxFit.contain,
                              height: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            new Expanded(
              child: new ListView(
                shrinkWrap: true,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: new Center(
                      child: Transform(
                        child: new SvgPicture.asset(
                          'images/icon-orange-right-arrow.190a2bf5.svg',
                        ),
                        alignment: FractionalOffset.center,
                        transform: new Matrix4.identity()
                          ..rotateZ(90 * 3.1415927 / 180),
                      ),
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: new SvgPicture.asset(
                      'images/icon-dark-connect.923e9c98.svg',
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: new Center(
                      child: Text(
                        "Online Alışveriş Hesaplarını Bağla",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                        maxLines: 5,
                      ),
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: new Center(
                      child: Text(
                        "Alışveriş Yaptığın Siteleri price&me’ye bağla.",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                        maxLines: 5,
                      ),
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 10.0),
                    child: SvgPicture.asset(
                      'images/welcome-section-platform.616c8a16.svg',
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: new Center(
                      child: Transform(
                        child: new SvgPicture.asset(
                          'images/icon-orange-right-arrow.190a2bf5.svg',
                        ),
                        alignment: FractionalOffset.center,
                        transform: new Matrix4.identity()
                          ..rotateZ(90 * 3.1415927 / 180),
                      ),
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    child: SvgPicture.asset(
                      'images/icon-dark-graphic.fb1fe43f.svg',
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 10.0),
                    child: new Center(
                      child: Text(
                        "Sana Özel Tüm Kampanyaları Gör",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                        maxLines: 5,
                      ),
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 10.0),
                    child: new Center(
                      child: Text(
                        "price&me, hesaplarındaki "
                        "kuponları ve tüm kampanyaları bir araya getirir, "
                        "sana özel fiyatı hesaplar.",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                        maxLines: 10,
                      ),
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 10.0),
                    child: new Center(
                      child: Transform(
                        child: new SvgPicture.asset(
                          'images/icon-orange-right-arrow.190a2bf5.svg',
                        ),
                        alignment: FractionalOffset.center,
                        transform: new Matrix4.identity()
                          ..rotateZ(90 * 3.1415927 / 180),
                      ),
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 10.0),
                    child: SvgPicture.asset(
                      'images/icon-dark-basket.94794a24.svg',
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 10.0),
                    child: new Center(
                      child: Text(
                        "Ekstra price&me İndiriminden Faydalan",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                        maxLines: 5,
                      ),
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 10.0),
                    child: new Center(
                      child: Text(
                        "price&me, alışveriş "
                        "tercihlerine ve seçtiğin ödeme yöntemlerine göre sana "
                        "eşsiz ekstra indirimler sunar.",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                        maxLines: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
