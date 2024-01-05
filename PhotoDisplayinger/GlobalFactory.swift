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

    private lazy var downloader: ObjectDownloading = {
        ObjectDownloader()
    }()

    private lazy var appState: AppState = {
        AppState(downloader: downloader)
    }()

    func makeRootView() -> RootView {
        RootView(appState: appState)
    }
}
