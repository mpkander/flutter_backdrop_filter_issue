import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)

      weak var registrar = self.registrar(forPlugin: "platform-map-plugin")

      let factory = FLNativeViewFactory(messenger: registrar!.messenger())
      self.registrar(forPlugin: "platform-map")!.register(
          factory,
          withId: "platform-map")
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
