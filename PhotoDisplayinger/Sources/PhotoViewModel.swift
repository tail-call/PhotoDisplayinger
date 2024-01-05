//
//  PhotoViewModel.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import SwiftUI

final class PhotoViewModel: ObservableObject {
    enum State {
        case loading
        case image(CGImage)
        case error(String)
    }

    @Published var state: State = .loading

    let url: URL

    private let downloader: ObjectDownloading

    init(url: URL, downloader: ObjectDownloading) {
        self.url = url
        self.downloader = downloader

        Task {
            do {
                self.state = .image(
                    try await downloader.downloadCGImage(from: url)
                )
            } catch {
                self.state = .error("\(error)")
            }
        }
    }
}
