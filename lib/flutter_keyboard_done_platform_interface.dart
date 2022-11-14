import 'package:flutter/cupertino.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_keyboard_done.dart';
import 'flutter_keyboard_done_method_channel.dart';

abstract class FlutterKeyboardDonePlatform extends PlatformInterface {
  /// Constructs a FlutterKeyboardDonePlatform.
  FlutterKeyboardDonePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterKeyboardDonePlatform _instance = MethodChannelFlutterKeyboardDone();

  /// The default instance of [FlutterKeyboardDonePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterKeyboardDone].
  static FlutterKeyboardDonePlatform get instance => _instance;

  var listeners = <FlutterKeyboardDoneListener>[];

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterKeyboardDonePlatform] when
  /// they register themselves.
  static set instance(FlutterKeyboardDonePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
