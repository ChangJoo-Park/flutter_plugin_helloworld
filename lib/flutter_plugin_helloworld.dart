import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPluginHelloworld {
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin_helloworld');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get helloworld async {
    final String helloworld = await _channel.invokeMethod('getHelloWorld');
    return helloworld;
  }
}
