import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plugin_toc/plugin_toc.dart';

class CaptureBack {
  final MethodChannel _channelios = const MethodChannel('plugin_toc.ios');

  Future<String> call(String documentType, String sessionId) async {
    if (Platform.isAndroid) {
      return captureBackAndroid(documentType, sessionId);
    }

    return captureBackiOS(documentType, sessionId);
  }

  Future<String> captureBackAndroid(String documentType, String sessionId) async {
    String tocToken = '';
    try {
      tocToken = await PluginToc.capturaBack(documentType, sessionId);
    } catch (e) {
      debugPrint(e.toString());
    }

    return tocToken;
  }

  Future<String> captureBackiOS(String documentType, String sessionId) async {
    String tocToken = '';
    try {
      var result = await _channelios.invokeMethod('capturaBack', [documentType, sessionId]);
      tocToken = result["token"];
    } catch (error) {
      debugPrint("Error invokeMethod.capturaBack : " + error.toString());
    }

    debugPrint("captureBackiOS $tocToken");
    return tocToken;
  }
}
