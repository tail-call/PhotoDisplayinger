//
//  ContentView.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import SwiftUI

private let downloader: ObjectDownloading = ObjectDownloader()
private let endpointURL = URL(
    string: "https://dog.ceo/api/breed/saluki/images"
)!


struct ContentView: View {
    @ObservedObject var state: AppState

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .alert(
            "Error",
            isPresented: self.$state.isPresentingAlert,
            actions: {
                Button(action: {
                    self.state.hideAlert()
                }, label: {
                    Text("OK")
                })
            },
            message: {
                Text(self.state.alertMessage ?? "???")
            }
        )
        .onAppear(perform: {
            Task {
                do {
                    try await didStart()
                } catch {
                    state.showAlert(text: "\(error)")
                }
            }
        })
    }

    // MARK: - Private methods

    private func didStart() async throws {
        let response = try await downloader.download(
            ParsedResponse.self,
            from: endpointURL
        )

        state.photoURLsList = response.message
        print(state.photoURLsList)
    }
}

#Preview {
    ContentView(state: AppState())
}
