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
    @Published var photoURLsList: [URL] = []

    func showAlert(text: String) {
        isPresentingAlert = true
        alertMessage = text
    }

    func hideAlert() {
        isPresentingAlert = false
        alertMessage = nil
    }
}
