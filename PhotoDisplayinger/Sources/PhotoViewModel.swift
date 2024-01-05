//
//  PhotoViewModel.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import SwiftUI

final class PhotoViewModel: ObservableObject {
    @Published var image: CGImage?

    let url: URL

    private let downloader: ObjectDownloading

    init(url: URL, downloader: ObjectDownloading) {
        self.url = url
        self.downloader = downloader
    }
}
