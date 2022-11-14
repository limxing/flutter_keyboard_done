#import "FlutterKeyboardDonePlugin.h"
#if __has_include(<flutter_keyboard_done/flutter_keyboard_done-Swift.h>)
#import <flutter_keyboard_done/flutter_keyboard_done-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_keyboard_done-Swift.h"
#endif

@implementation FlutterKeyboardDonePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterKeyboardDonePlugin registerWithRegistrar:registrar];
}
@end
