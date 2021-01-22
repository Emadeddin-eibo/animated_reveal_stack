import Flutter
import UIKit

public class SwiftAnimatedRevealStackPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "animated_reveal_stack", binaryMessenger: registrar.messenger())
    let instance = SwiftAnimatedRevealStackPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
