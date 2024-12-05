import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imchat_sdk_flutter/imchat_sdk_flutter.dart';
import 'package:imchat_sdk_platform_interface/imchat_sdk_platform_interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _imchatSdkFlutterPlugin = ImchatSdkFlutter();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      // platformVersion =
      // await _imchatSdkFlutterPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      // _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              GestureDetector(
                child: const Text('Open iOS IM SDK'),
                onTap: () {
                  IMInitSDKParam p = IMInitSDKParam(
                      identityID: "42nz10y3hhah",
                      sign:
                          "b184b8e64c5b0004c58b5a3c9af6f3868d63018737e68e2a1ccc61580afbc8f112119431511175252d169f0c64d9995e5de2339fdae5cbddda93b65ce305217700",
                      nickName: "bbq",
                      nickId: "bbqnickId",
                      device: "iPhone XXXXX",
                      headIcon: "https://img1.baidu.com/it/u=1653751609,236581088&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1729270800&t=36600cf9ed9f2ffddb3a3bb1ec5bd144",
                      phone: "15588888888",
                      email: "bbq@bbq.com",
                      langType: 0,
                      source: "iOS",
                      extraInfo: {"xxx": "xxx", "yyy": "yyy"});
                  _imchatSdkFlutterPlugin.initSDK(p);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
