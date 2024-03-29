//
//  RootViewModel.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import Combine

final class RootViewModel: ObservableObject {
    @Published var photos: [PhotoViewModel] = []

    private let factory: GlobalFactory
    private let appState: AppState
    private var cancellable: AnyCancellable?

    init(
        appState: AppState,
        factory: GlobalFactory
    ) {
        self.appState = appState
        self.factory = factory

        cancellable = appState.$photos.sink(
            receiveCompletion: { _ in
            },
            receiveValue: { photos in
                let photos = photos.map { photo in
                    factory.makePhotoViewModel(from: photo)
                }

                Task {
                    await MainActor.run {
                        self.photos = photos
                    }
                }
            }
        )
    }
}
