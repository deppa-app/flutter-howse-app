import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plugin_toc/plugin_toc.dart';

class CaptureFront {
  final MethodChannel _channelios = const MethodChannel('plugin_toc.ios');

  Future<String> call(String documentType, String sessionId) async {
    if (Platform.isAndroid) {
      return captureFrontAndroid(documentType, sessionId);
    }

    return captureFrontiOS(documentType, sessionId);
  }

  Future<String> captureFrontAndroid(String documentType, String sessionId) async {
    String tocToken = '';
    try {
      tocToken = await PluginToc.capturaFront(documentType, sessionId);
      
    } catch (e) {
      debugPrint(e.toString());
    }

    return tocToken;
  }

  Future<String> captureFrontiOS(String documentType, String sessionId) async {
    String tocToken = '';
    try {
      var result = await _channelios.invokeMethod('capturaFront', [documentType, sessionId]);
      tocToken = result["token"];
    } catch (error) {
      debugPrint("Error invokeMethod.capturaFront : " + error.toString());
    }

    debugPrint("captureFrontiOS $tocToken");
    return tocToken;
  }
}
