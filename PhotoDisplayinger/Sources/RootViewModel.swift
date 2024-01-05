//
//  RootViewModel.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import Combine

final class RootViewModel: ObservableObject {
    @Published var photos: [PhotoViewModel] = []

    private let appState: AppState
    private var cancellable: AnyCancellable?

    init(appState: AppState) {
        self.appState = appState

        cancellable = appState.$photoURLsList.sink(
            receiveCompletion: { _ in
            },
            receiveValue: { urls in
                self.photos = urls.map { url in
                    GlobalFactory.shared.makePhotoViewModel(url: url)
                }
            }
        )
    }
}
