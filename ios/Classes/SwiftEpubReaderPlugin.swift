import Flutter
import UIKit
import FolioReaderKit

public class SwiftEpubReaderPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "epub_reader", binaryMessenger: registrar.messenger())
    let instance = SwiftEpubReaderPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let currentController = UIApplication.shared.keyWindow?.rootViewController
    let config = FolioReaderConfig()
    let args = call.arguments as! Dictionary<String, Any>
    let bookPath = args["book_path"] as! String

    let folioReader = FolioReader()
    if let controller = currentController {
      folioReader.presentReader(parentViewController: controller, withEpubPath: bookPath, andConfig: config)
    }
    result("iOS " + UIDevice.current.systemVersion)
    
  }
}
