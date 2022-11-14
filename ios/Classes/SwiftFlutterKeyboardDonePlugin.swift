import Flutter
import UIKit

public class SwiftFlutterKeyboardDonePlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_keyboard_done", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterKeyboardDonePlugin(channel)
        registrar.addMethodCallDelegate(instance, channel: channel)

    }
    private var channel: FlutterMethodChannel?
    init(_ channel: FlutterMethodChannel) {
        super.init()
        self.channel = channel
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }


    @objc
    func keyboardShow()  {
        channel?.invokeMethod("keyboardShow", arguments: nil)
    }
    @objc
    func keyboardHide()  {
        channel?.invokeMethod("keyboardHide", arguments: nil)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result("iOS " + UIDevice.current.systemVersion)
    }
}
