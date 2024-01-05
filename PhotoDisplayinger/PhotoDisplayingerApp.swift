//
//  PhotoDisplayingerApp.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import SwiftUI

private let state = AppState()

@main
struct PhotoDisplayingerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(state: state)
        }
    }
}
