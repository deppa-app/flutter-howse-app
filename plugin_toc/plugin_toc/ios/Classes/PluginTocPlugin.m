#import "PluginTocPlugin.h"
#if __has_include(<plugin_toc/plugin_toc-Swift.h>)
#import <plugin_toc/plugin_toc-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "plugin_toc-Swift.h"
#endif

@implementation PluginTocPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPluginTocPlugin registerWithRegistrar:registrar];
}
@end
