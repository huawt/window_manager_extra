import Cocoa
import FlutterMacOS

public class WindowManagerExtraPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "window_manager_extra", binaryMessenger: registrar.messenger)
        let instance = WindowManagerExtraPlugin(registrar, channel)
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    private var registrar: FlutterPluginRegistrar!;
    private var channel: FlutterMethodChannel!
    
    private var mainWindow: NSWindow {
        get {
            return (self.registrar.view?.window)!;
        }
    }
    
    private var _inited: Bool = false
    private var windowManagerExtra: WindowManagerExtra = WindowManagerExtra()
    
    public init(_ registrar: FlutterPluginRegistrar, _ channel: FlutterMethodChannel) {
        super.init()
        self.registrar = registrar
        self.channel = channel
    }
    
    private func ensureInitialized() {
        if (!_inited) {
            windowManagerExtra.mainWindow = mainWindow
            windowManagerExtra.onEvent = {
                (eventName: String) in
                self._emitEvent(eventName)
            }
            _inited = true
        }
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let methodName: String = call.method
        let args: [String: Any] = call.arguments as? [String: Any] ?? [:]
        
        switch (methodName) {
        case "ensureInitialized":
            ensureInitialized()
            result(true)
            break
        case "waitUntilReadyToShow":
            windowManagerExtra.waitUntilReadyToShow()
            result(true)
            break
        case "getId":
            result(windowManagerExtra.getId())
            break
        case "setAsFrameless":
            windowManagerExtra.setAsFrameless()
            result(true)
            break
        case "destroy":
            windowManagerExtra.destroy()
            result(true)
            break
        case "close":
            windowManagerExtra.close()
            result(true)
            break
        case "isPreventClose":
            result(windowManagerExtra.isPreventClose())
            break
        case "setPreventClose":
            windowManagerExtra.setPreventClose(args)
            result(true)
            break
        case "focus":
            windowManagerExtra.focus()
            result(true)
            break
        case "blur":
            windowManagerExtra.blur()
            result(true)
            break
        case "isFocused":
            result(windowManagerExtra.isFocused())
            break
        case "show":
            windowManagerExtra.show()
            result(true)
            break
        case "hide":
            windowManagerExtra.hide()
            result(true)
            break
        case "isVisible":
            result(windowManagerExtra.isVisible())
            break
        case "isMaximized":
            result(windowManagerExtra.isMaximized())
            break
        case "maximize":
            windowManagerExtra.maximize()
            result(true)
            break
        case "unmaximize":
            windowManagerExtra.unmaximize()
            result(true)
            break
        case "isMinimized":
            result(windowManagerExtra.isMinimized())
            break
        case "isMaximizable":
            result(windowManagerExtra.isMaximizable())
            break
        case "setMaximizable":
            windowManagerExtra.setIsMaximizable(args)
            result(true)
            break
        case "minimize":
            windowManagerExtra.minimize()
            result(true)
            break
        case "restore":
            windowManagerExtra.restore()
            result(true)
            break
        case "isDockable":
            result(windowManagerExtra.isDockable())
            break
        case "isDocked":
            result(windowManagerExtra.isDocked())
            break
        case "dock":
            windowManagerExtra.dock(args)
            result(true)
            break
        case "undock":
            windowManagerExtra.undock()
            result(true)
            break
        case "isFullScreen":
            result(windowManagerExtra.isFullScreen())
            break
        case "setFullScreen":
            windowManagerExtra.setFullScreen(args)
            result(true)
            break
        case "setAspectRatio":
            windowManagerExtra.setAspectRatio(args)
            result(true)
            break
        case "setBackgroundColor":
            windowManagerExtra.setBackgroundColor(args) 
            result(true)
            break
        case "getBounds":
            result(windowManagerExtra.getBounds())
            break
        case "setBounds":
            windowManagerExtra.setBounds(args)
            result(true)
            break
        case "setMinimumSize":
            windowManagerExtra.setMinimumSize(args)
            result(true)
            break
        case "setMaximumSize":
            windowManagerExtra.setMaximumSize(args)
            result(true)
            break
        case "isResizable":
            result(windowManagerExtra.isResizable())
            break
        case "setResizable":
            windowManagerExtra.setResizable(args)
            result(true)
            break
        case "isMovable":
            result(windowManagerExtra.isMovable())
            break
        case "setMovable":
            windowManagerExtra.setMovable(args)
            result(true)
            break
        case "isMinimizable":
            result(windowManagerExtra.isMinimizable())
            break
        case "setMinimizable":
            windowManagerExtra.setMinimizable(args)
            result(true)
            break
        case "isClosable":
            result(windowManagerExtra.isClosable())
            break
        case "setClosable":
            windowManagerExtra.setClosable(args)
            result(true)
            break
        case "isAlwaysOnTop":
            result(windowManagerExtra.isAlwaysOnTop())
            break
        case "setAlwaysOnTop":
            windowManagerExtra.setAlwaysOnTop(args)
            result(true)
            break
        case "getTitle":
            result(windowManagerExtra.getTitle())
            break
        case "setTitle":
            windowManagerExtra.setTitle(args)
            result(true)
            break
        case "setTitleBarStyle":
            windowManagerExtra.setTitleBarStyle(args)
            result(true)
            break
        case "getTitleBarHeight":
            result(windowManagerExtra.getTitleBarHeight())
            break
        case "isSkipTaskbar":
            result(windowManagerExtra.isSkipTaskbar())
            break
        case "setSkipTaskbar":
            windowManagerExtra.setSkipTaskbar(args)
            result(true)
            break
        case "setBadgeLabel":
            windowManagerExtra.setBadgeLabel(args)
            result(true)
            break
        case "setProgressBar":
            windowManagerExtra.setProgressBar(args)
            result(true)
            break
        case "isVisibleOnAllWorkspaces":
            result(windowManagerExtra.isVisibleOnAllWorkspaces())
            break
        case "setVisibleOnAllWorkspaces":
            windowManagerExtra.setVisibleOnAllWorkspaces(args)
            result(true)
            break
        case "hasShadow":
            result(windowManagerExtra.hasShadow())
            break
        case "setHasShadow":
            windowManagerExtra.setHasShadow(args)
            result(true)
            break
        case "getOpacity":
            result(windowManagerExtra.getOpacity())
            break
        case "setOpacity":
            windowManagerExtra.setOpacity(args)
            result(true)
            break
        case "setBrightness":
            windowManagerExtra.setBrightness(args)
            result(true)
            break
        case "setIgnoreMouseEvents":
            windowManagerExtra.setIgnoreMouseEvents(args)
            result(true)
            break
        case "startDragging":
            windowManagerExtra.startDragging()
            result(true)
            break
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    public func _emitEvent(_ eventName: String) {
        let args: NSDictionary = [
            "eventName": eventName,
        ]
        channel.invokeMethod("onEvent", arguments: args, result: nil)
    }
}
