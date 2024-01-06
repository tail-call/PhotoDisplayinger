//
//  AppState.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import Foundation

final class AppState: ObservableObject {
    @Published var isPresentingAlert: Bool = false
    @Published var alertMessage: String?
    @Published var photos: [Photo] = []

    private let appUseCase: AppUseCase

    init(appUseCase: AppUseCase) {
        self.appUseCase = appUseCase

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
                let photos = try await appUseCase.photosList()

                await MainActor.run {
                    self.photos = photos
                }
            } catch {
                print("⛔️ Error: \(error)")

                showErrorAlert(text: "\(error)")
            }
        }
    }
}
