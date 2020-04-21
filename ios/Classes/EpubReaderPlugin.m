#import "EpubReaderPlugin.h"
#if __has_include(<epub_reader/epub_reader-Swift.h>)
#import <epub_reader/epub_reader-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "epub_reader-Swift.h"
#endif

@implementation EpubReaderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftEpubReaderPlugin registerWithRegistrar:registrar];
}
@end
