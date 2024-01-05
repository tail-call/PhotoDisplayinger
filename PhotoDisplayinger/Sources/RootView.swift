//
//  RootView.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var appState: AppState

    var body: some View {
        ScrollView {
            VStack {
                ForEach(appState.photoURLsList, id: \.self) { url in
                    Text("Hello, \(url)!")
                }
            }
            .padding()
        }
        .alert(
            "Error",
            isPresented: self.$appState.isPresentingAlert,
            actions: {
                Button(action: {
                    self.appState.hideAlert()
                }, label: {
                    Text("OK")
                })
            },
            message: {
                Text(self.appState.alertMessage ?? "???")
            }
        )
    }
}

#Preview {
    RootView(
        appState: AppState(
            downloader: ObjectDownloader()
        )
    )
}
