//
//  ObjectDownloading+CGImage.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import CoreGraphics
import Foundation

extension ObjectDownloading {
    func downloadCGImage(from url: URL) async throws -> CGImage {
        let data = try await downloadData(from: url)

        guard let dataProvider = CGDataProvider(data: data as CFData) else {
            throw ObjectDownloadingError.cgDataProviderCreationFailed
        }

        guard let image = CGImage(
            jpegDataProviderSource: dataProvider,
            decode: nil,
            shouldInterpolate: false,
            intent: .defaultIntent
        ) else {
            throw ObjectDownloadingError.cgImageCreationFailed
        }

        return image
    }
}
