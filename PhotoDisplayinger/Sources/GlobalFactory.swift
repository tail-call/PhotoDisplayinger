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

    func makeRootView() -> RootView { RootView(appState: appState) }
    func makeAppState() -> AppState { appState }

    // MARK: - Private

    private lazy var downloader: ObjectDownloading = {
        ObjectDownloader()
    }()

    private lazy var appState: AppState = {
        AppState(downloader: downloader)
    }()
}
