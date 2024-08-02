//
//  JigWatchContentView.swift
//

import SwiftUI

struct JigWatchContentView: View {
    @StateObject private var model = WatchViewModel.shared

    var body: some View {
        VStack {
            if model.watchUI == "" {
                Button(action: {
                    WatchViewModel.shared.session.sendMessage(REQUESTUI, replyHandler: nil) { _ in
                        print("UI Delivery failed")
                    }
                }) {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                }
                Rectangle().frame(height: 1)
            } else {
                ScrollView {
                    JigWatchView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        JigWatchContentView()
    }
}
