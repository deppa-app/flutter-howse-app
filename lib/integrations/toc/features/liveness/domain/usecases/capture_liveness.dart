import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plugin_toc/plugin_toc.dart';

class CaptureLiveness {
  final MethodChannel _channelios = const MethodChannel('plugin_toc.ios');

  Future<String> call(String sessionId) async {
    if (Platform.isAndroid) {
      return captureLivenessAndroid(sessionId);
    }

    return captureLivenessiOS(sessionId);
  }

  Future<String> captureLivenessAndroid(String sessionId) async {
    String tocToken = '';
    try {
      tocToken = await PluginToc.capturaLiveness(sessionId);
    } catch (e) {
      debugPrint(e.toString());
    }

    return tocToken;
  }

  Future<String> captureLivenessiOS(String sessionId) async {
    debugPrint("captureLivenessiOS captureLivenessiOS");
    String tocToken = '';
    try {
      var result = await _channelios.invokeMethod('capturaLiveness', [sessionId]);

      debugPrint("captureLivenessiOS result ${result.toString()}");
      tocToken = result["token"];
    } catch (error) {
      debugPrint("Error invokeMethod.capturaLiveness : " + error.toString());
    }

    debugPrint("captureLivenessiOS $tocToken");
    return tocToken;
  }
}
