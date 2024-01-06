//
//  CGImage+fromData.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 06.01.2024.
//

import CoreGraphics
import Foundation

extension CGImage {
    // Can't make a convenience init for CGImage, so using a static function

    static func from(data: Data) throws -> CGImage {
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
