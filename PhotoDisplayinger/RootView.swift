//
//  RootView.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import SwiftUI

private let endpointURL = URL(
    string: "https://dog.ceo/api/breed/saluki/images"
)!

struct RootView: View {
    @ObservedObject var state: AppState

    let downloader: ObjectDownloading

    var body: some View {
        ScrollView {
            VStack {
                ForEach(state.photoURLsList, id: \.self) { url in
                    Text("Hello, \(url)!")
                }
            }
            .padding()
        }
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
                    print("⛔️ Error: \(error)")
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
    RootView(state: AppState(), downloader: ObjectDownloader())
}
