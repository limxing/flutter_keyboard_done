import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_done/flutter_keyboard_done.dart';

import 'flutter_keyboard_done_platform_interface.dart';

/// An implementation of [FlutterKeyboardDonePlatform] that uses method channels.
class MethodChannelFlutterKeyboardDone extends FlutterKeyboardDonePlatform {
  /// The method channel used to interact with the native platform.
  final methodChannel = const MethodChannel('flutter_keyboard_done');
  static TransitionBuilder? builder;

  MethodChannelFlutterKeyboardDone() {
    methodChannel.setMethodCallHandler((call) {
      if (call.method == "keyboardShow") {
        _showDone();
      } else {
        _hideDone();
      }

      return Future.value('');
    });
  }

  void _showDone() {
    if(listeners.isNotEmpty) {
      listeners.last.onShow();
    }
  }

  void _hideDone() {
    if(listeners.isNotEmpty) {
      listeners.last.onHidde();
    }
  }

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
