#import "AnimatedRevealStackPlugin.h"
#if __has_include(<animated_reveal_stack/animated_reveal_stack-Swift.h>)
#import <animated_reveal_stack/animated_reveal_stack-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "animated_reveal_stack-Swift.h"
#endif

@implementation AnimatedRevealStackPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAnimatedRevealStackPlugin registerWithRegistrar:registrar];
}
@end
