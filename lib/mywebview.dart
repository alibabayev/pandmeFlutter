import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class MyWebView extends StatefulWidget {
  const MyWebView({
    Key key,
    this.appBar,
    @required this.url,
    this.headers,
    this.withJavascript = true,
    this.clearCache = true,
    this.clearCookies,
    this.enableAppScheme,
    this.userAgent,
    this.primary = true,
    this.persistentFooterButtons,
    this.bottomNavigationBar,
    this.withZoom,
    this.displayZoomControls,
    this.withLocalStorage = true,
    this.withLocalUrl,
    this.localUrlScope,
    this.withOverviewMode,
    this.useWideViewPort,
    this.scrollBar,
    this.supportMultipleWindows,
    this.appCacheEnabled = true,
    this.hidden = true,
    this.initialChild,
    this.allowFileURLs,
    this.resizeToAvoidBottomInset = false,
    this.invalidUrlRegex,
    this.geolocationEnabled,
    this.debuggingEnabled = false,
  }) : super(key: key);

  final PreferredSizeWidget appBar;
  final String url;
  final Map<String, String> headers;
  final bool withJavascript;
  final bool clearCache;
  final bool clearCookies;
  final bool enableAppScheme;
  final String userAgent;
  final bool primary;
  final List<Widget> persistentFooterButtons;
  final Widget bottomNavigationBar;
  final bool withZoom;
  final bool displayZoomControls;
  final bool withLocalStorage;
  final bool withLocalUrl;
  final String localUrlScope;
  final bool scrollBar;
  final bool supportMultipleWindows;
  final bool appCacheEnabled;
  final bool hidden;
  final Widget initialChild;
  final bool allowFileURLs;
  final bool resizeToAvoidBottomInset;
  final String invalidUrlRegex;
  final bool geolocationEnabled;
  final bool withOverviewMode;
  final bool useWideViewPort;
  final bool debuggingEnabled;

  @override
  _MyWebViewPluginState createState() => new _MyWebViewPluginState();
}

class _MyWebViewPluginState extends State<MyWebView> {
  // Instance of WebView plugin
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  // On destroy stream
  StreamSubscription _onDestroy;

  // On urlChanged stream
  StreamSubscription<String> _onUrlChanged;

  // On urlChanged stream
  StreamSubscription<WebViewStateChanged> _onStateChanged;

  //StreamSubscription<WebViewHttpError> _onHttpError;

//  StreamSubscription<double> _onScrollYChanged;
//  StreamSubscription<double> _onScrollXChanged;

  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  Rect _rect;
  //Timer _resizeTimer;
  var _onBack;

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.close();

    /*_onBack = flutterWebviewPlugin.onBack.listen((_) async {
      if (!mounted) return;

      // The willPop/pop pair here is equivalent to Navigator.maybePop(),
      // which is what's called from the flutter back button handler.
      final pop = await _topMostRoute.willPop();
      if (pop == RoutePopDisposition.pop) {
        // Close the webview if it's on the route at the top of the stack.
        final isOnTopMostRoute = _topMostRoute == ModalRoute.of(context);
        if (isOnTopMostRoute) {
          flutterWebviewPlugin.close();
        }
        Navigator.pop(context);
      }
    });*/

    if (widget.hidden) {
      _onStateChanged = flutterWebviewPlugin.onStateChanged
          .listen((WebViewStateChanged state) {
        if (state.type == WebViewState.finishLoad) {
          flutterWebviewPlugin.show();
        }
        if(state.type == WebViewState.startLoad) {
          CircularProgressIndicator();
        }
      });
    }

    _onStateChanged = flutterWebviewPlugin.onStateChanged
        .listen((WebViewStateChanged state) {
          print("onStateChanged -> " + state.url.toString());
          if(! state.url.toString().contains("www.priceandme.com")) {
            flutterWebviewPlugin.stopLoading();
          }
    });

    // Add a listener to on destroy WebView, so you can make came actions.
    _onDestroy = flutterWebviewPlugin.onDestroy.listen((_) {
      if (mounted) {
        // Actions like show a info toast.
        _scaffoldKey.currentState.showSnackBar(
            const SnackBar(content: const Text('Webview Destroyed')));
      }
    });

    // Add a listener to on url changed
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        setState(() {
          //_history.add('onUrlChanged: $url');
          print("_onUrlChanged" + url);
          if(! url.contains('priceandme.com')) {
            //_launchURL(url);
            flutterWebviewPlugin.stopLoading();
            _launchURL(url);
          }
          else{
          }
        });
      }
    });

    /*_onHttpError =
        flutterWebviewPlugin.onHttpError.listen((WebViewHttpError error) {
          if (mounted) {
            setState(() {
              _history.add('onHttpError: ${error.code} ${error.url}');
              print("_onHttpError");
            });
          }
        });*/
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
/*
  /// Equivalent to [Navigator.of(context)._history.last].
  Route<dynamic> get _topMostRoute {
    var topMost;
    Navigator.popUntil(context, (route) {
      topMost = route;
      return true;
    });
    return topMost;
  }
*/
  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    _onDestroy.cancel();
    _onUrlChanged.cancel();
    //_onHttpError.cancel();

    _onBack?.cancel();
   // _resizeTimer?.cancel();
    flutterWebviewPlugin.close();
    if (widget.hidden) {
      _onStateChanged.cancel();
    }
    flutterWebviewPlugin.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //key: _scaffoldKey,
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
      persistentFooterButtons: widget.persistentFooterButtons,
      bottomNavigationBar: widget.bottomNavigationBar,
      body: _WebviewPlaceholder(
        onRectChanged: (Rect value) {
         // if (_rect == null) {
            _rect = value;
            flutterWebviewPlugin.launch(
              widget.url,
              withJavascript: widget.withJavascript,
              hidden: widget.hidden,
              rect: _rect,
              withLocalStorage: widget.withLocalStorage,
            );
          //}
          /*else {
            if (_rect != value) {
              _rect = value;
              _resizeTimer?.cancel();
              _resizeTimer = Timer(const Duration(milliseconds: 250), () {
                // avoid resizing to fast when build is called multiple time
                flutterWebviewPlugin.resize(_rect);
              });
            }
          }*/
        },
        child: widget.initialChild ??
            const Center(child: const CircularProgressIndicator()),
      ),
    );
  }
}

class _WebviewPlaceholder extends SingleChildRenderObjectWidget {
  const _WebviewPlaceholder({
    Key key,
    @required this.onRectChanged,
    Widget child,
  }) : super(key: key, child: child);

  final ValueChanged<Rect> onRectChanged;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _WebviewPlaceholderRender(
      onRectChanged: onRectChanged,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, _WebviewPlaceholderRender renderObject) {
    renderObject..onRectChanged = onRectChanged;
  }
}

class _WebviewPlaceholderRender extends RenderProxyBox {
  _WebviewPlaceholderRender({
    RenderBox child,
    ValueChanged<Rect> onRectChanged,
  })  : _callback = onRectChanged,
        super(child);

  ValueChanged<Rect> _callback;
  Rect _rect;

  Rect get rect => _rect;

  set onRectChanged(ValueChanged<Rect> callback) {
    if (callback != _callback) {
      _callback = callback;
      notifyRect();
    }
  }

  void notifyRect() {
    if (_callback != null && _rect != null) {
      _callback(_rect);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
    final rect = offset & size;
    if (_rect != rect) {
      _rect = rect;
      notifyRect();
    }
  }
}
