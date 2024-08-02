import Foundation
import Jigra
import WatchConnectivity

@objc(WatchPlugin)
public class WatchPlugin: JIGPlugin {

    override public func load() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.handleApplicationActive(notification:)),
                                               name: UIApplication.didBecomeActiveNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.handleUrlOpened(notification:)),
                                               name: Notification.Name.jigraOpenURL,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.handleUniversalLink(notification:)),
                                               name: Notification.Name.jigraOpenUniversalLink,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.handleCommandFromWatch(_:)),
                                               name: Notification.Name(COMMAND_KEY),
                                               object: nil)

    }

    @objc func handleApplicationActive(notification: NSNotification) {
        assert(WCSession.isSupported(), "This sample requires Watch Connectivity support!")
        WCSession.default.delegate = JigWatchSessionDelegate.shared
        WCSession.default.activate()
    }

    @objc func handleUrlOpened(notification: NSNotification) {

    }

    @objc func handleUniversalLink(notification: NSNotification) {

    }

    @objc func handleCommandFromWatch(_ notification: NSNotification) {
        if let command = notification.userInfo![COMMAND_KEY] as? String {
            print("WATCH process: \(command)")
            notifyListeners("runCommand", data: ["command": command])
        }
    }

    @objc func updateWatchUI(_ call: JIGPluginCall) {
        guard let newUI = call.getString("watchUI")  else {
            return
        }

        JigWatchSessionDelegate.shared.WATCH_UI = newUI
        JigWatchSessionDelegate.shared.sendUI()

        call.resolve()
    }

    @objc func updateWatchData(_ call: JIGPluginCall) {
        guard let newData = call.getObject("data") as? [String: String] else {
            return
        }

        JigWatchSessionDelegate.shared.updateViewData(newData)
        call.resolve()
    }

}
