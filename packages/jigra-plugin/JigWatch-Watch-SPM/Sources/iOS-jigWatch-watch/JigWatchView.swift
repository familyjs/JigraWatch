//
//  JigWatchView.swift
//

import SwiftUI

struct JigWatchView: View {
    @StateObject private var viewModel = WatchViewModel.shared

    var views: [JigWatchComponentView] = []

    init() {
        // parse viewModel.watchUI
        let components = viewModel.watchUI.lines

        // iterate over components and add views to views array
        for element in components {
            views.append(JigWatchComponentView(String(element), viewModel.viewData))
        }
    }

    var body: some View {
        VStack {
            if views.isEmpty {
                Text("Waiting for UI from Phone...")
            }
            ForEach(views) { thisView in
                thisView
            }
        }
        .onAppear() {

        }
    }
}
