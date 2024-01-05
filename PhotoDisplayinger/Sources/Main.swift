//
//  Main.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import SwiftUI

@main
struct Main: App {
    var body: some Scene {
        WindowGroup {
            GlobalFactory.shared.makeRootView()
        }
    }
}
