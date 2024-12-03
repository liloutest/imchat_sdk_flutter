import 'package:flutter/cupertino.dart';
import 'package:imchat_sdk_platform_interface/imchat_sdk_platform_interface.dart';

class ImchatSdkFlutter {
  @visibleForTesting
  static ImchatSdkFlutterPlatform get platform => ImchatSdkFlutterPlatform.instance;

  Future<bool> initSDK(IMInitSDKParam param) {
    // TODO: implement initSDK
    return platform.initSDK(param);
  }
}
