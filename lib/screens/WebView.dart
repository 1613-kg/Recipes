import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  //const WebView({super.key});
  String label;
  String url;
  WebView(this.label, this.url);
  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  var loadingPercentage;
  late final WebViewController controller;
  late String finalUrl;

  void WebControl() {
    finalUrl = widget.url;
    if (widget.url.toString().contains("http://")) {
      finalUrl = widget.url.toString().replaceAll("http://", "https://");
    }
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (navigation) {
            if (navigation.url != finalUrl) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(finalUrl));
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    WebControl();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    WebControl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.label} Recipe",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          // if (loadingPercentage < 100)
          //   LinearProgressIndicator(
          //     value: loadingPercentage / 100.0,
          //   ),
        ],
      ),
    );
  }
}
