import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'flutter_keyboard_done_platform_interface.dart';

class FlutterKeyboardDone {
  static Future getPlantVersion() {
    return FlutterKeyboardDonePlatform.instance.getPlatformVersion();
  }
}

abstract class FlutterKeyboardDoneListener {
  void onShow();

  void onHidde();
}

class FlutterKeyboardDoneWidget extends StatefulWidget {
  late Widget child;
  WidgetBuilder? doneWidgetBuilder;

  FlutterKeyboardDoneWidget({required this.child, this.doneWidgetBuilder, Key? key}) : super(key: key);

  @override
  State<FlutterKeyboardDoneWidget> createState() => _FlutterKeyboardDoneWidgetState();
}

class _FlutterKeyboardDoneWidgetState extends State<FlutterKeyboardDoneWidget> with FlutterKeyboardDoneListener {
  @override
  void initState() {
    super.initState();
    FlutterKeyboardDonePlatform.instance.listeners.add(this);
  }

  @override
  void dispose() {
    super.dispose();
    FlutterKeyboardDonePlatform.instance.listeners.remove(this);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  OverlayEntry? _overlayEntry;

  @override
  void onHidde() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }
  final FocusNode _blankNode = FocusNode();
  @override
  void onShow() {
    if(_overlayEntry != null) return;
    var overLay = Overlay.of(context);
    _overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        right: 0,
        left: 0,
        child: Container(
          width: double.maxFinite,
          height: 44,
          padding: const EdgeInsets.only(right: 8),
          color: Colors.white,
          child: Align(
            alignment: Alignment.centerRight,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                FocusScope.of(context).requestFocus(_blankNode);
                // FocusScope.of(context).focusedChild?.unfocus();
              },
              child: widget.doneWidgetBuilder == null
                  ? const Text(
                      '完成',
                      style: TextStyle(color: Colors.black87, fontSize: 14),
                    )
                  : widget.doneWidgetBuilder!(context),
            ),
          ),
        ),
      );
    });
    overLay?.insert(_overlayEntry!);
  }
}
