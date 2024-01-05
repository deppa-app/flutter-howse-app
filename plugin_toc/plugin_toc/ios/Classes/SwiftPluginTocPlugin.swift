import Flutter
import UIKit


public class SwiftPluginTocPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugin_toc", binaryMessenger: registrar.messenger())
    let instance = SwiftPluginTocPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS TOC2" + UIDevice.current.systemVersion)
  }
}
