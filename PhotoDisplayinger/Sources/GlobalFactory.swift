//
//  GlobalFactory.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import Foundation

final class GlobalFactory {
    static var shared = { GlobalFactory() }()

    private init() {}

    // MARK: - Public

    func makeRootView() -> RootView {
        RootView(
            model: RootViewModel(appState: appState, factory: .shared),
            appState: appState
        )
    }

    func makeAppState() -> AppState { appState }

    func makePhotoViewModel(from photo: Photo) -> PhotoViewModel {
        PhotoViewModel(appUseCase: appUseCase, photo: photo)
    }

    // MARK: - Private

    private lazy var appState: AppState = {
        AppState(appUseCase: appUseCase)
    }()

    private lazy var appUseCase: AppUseCase = {
        AppUseCase()
    }()
}
