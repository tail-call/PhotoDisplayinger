//
//  PhotoDisplayingerApp.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import SwiftUI

private let downloader = ObjectDownloader()
private let state = AppState(downloader: downloader)

@main
struct PhotoDisplayingerApp: App {
    var body: some Scene {
        WindowGroup {
            GlobalFactory.shared.makeRootView()
        }
    }
}
