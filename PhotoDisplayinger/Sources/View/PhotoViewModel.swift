//
//  PhotoViewModel.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import SwiftUI

final class PhotoViewModel: ObservableObject {
    enum State {
        case started
        case loading(Task<(), Never>)
        case image(CGImage)
        case error(String)
    }

    @Published var state: State = .started

    let photo: Photo

    private let appUseCase: AppUseCase

    init(appUseCase: AppUseCase, photo: Photo) {
        self.appUseCase = appUseCase
        self.photo = photo
    }

    func beginDownloading() {
        guard case .started = state else {
            return
        }

        self.state = .loading(Task {
            do {
                let state = State.image(
                    try await appUseCase.image(for: photo)
                )

                await MainActor.run {
                    self.state = state
                }
            } catch {
                self.state = .error("\(error)")
            }
        })
    }
}
