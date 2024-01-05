//
//  PhotoDisplayingerApp.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import SwiftUI

private let state = AppState()
private let downloader = ObjectDownloader()

@main
struct PhotoDisplayingerApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(state: state, downloader: downloader)
        }
    }
}
