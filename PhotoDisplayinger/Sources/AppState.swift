//
//  AppState.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import Foundation

private let endpointURL = URL(
    string: "https://dog.ceo/api/breed/saluki/images"
)!

final class AppState: ObservableObject {
    @Published var isPresentingAlert: Bool = false
    @Published var alertMessage: String?
    @Published var photoURLsList: [URL] = []

    init() {
        afterInit()
    }

    // MARK: - Public methods

    func showErrorAlert(text: String) {
        isPresentingAlert = true
        alertMessage = text
    }

    func hideAlert() {
        isPresentingAlert = false
        alertMessage = nil
    }

    // MARK: - Private methods

    private func afterInit() {
        Task {
            do {
                let response = try await ParsedResponse(
                    jsonData: try URLSession.shared.dataIfCorrectResponse(
                        from: endpointURL
                    )
                )

                await MainActor.run {
                    photoURLsList = response.message
                }
            } catch {
                print("⛔️ Error: \(error)")

                showErrorAlert(text: "\(error)")
            }
        }
    }
}
