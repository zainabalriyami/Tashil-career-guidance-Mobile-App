

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../constants.dart';

class ResourceLibrariesScreen extends StatefulWidget {
  const ResourceLibrariesScreen({super.key});

  @override
  State<ResourceLibrariesScreen> createState() => _ResourceLibrariesScreenState();
}

class _ResourceLibrariesScreenState extends State<ResourceLibrariesScreen> {
  late InAppWebViewController webViewController;
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: buttonColor,
        centerTitle: true,
        title: Text(
          'Resource Libraries',
          style:
          TextStyle(color: Colors.white, fontFamily: fontFamilyRegular),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri("https://home.moe.gov.om/Students"),
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
          controller.addJavaScriptHandler(
            handlerName: 'jsHandler',
            callback: (args) {
              // Handle JavaScript messages from WebView
            },
          );
        },
        onLoadStart: (controller, url) {
          isLoading.value = true;
          debugPrint(url.toString());
        },
        onProgressChanged:
            (InAppWebViewController controller, int progress) {},
        onLoadStop: (controller, url) {
          debugPrint("🌞🧃🍄🌱🍓 ${url.toString()}");
          isLoading.value = false;
          // Handle page load stop, e.g., hide loading indicator
        },
      ),

    );
  }
}
