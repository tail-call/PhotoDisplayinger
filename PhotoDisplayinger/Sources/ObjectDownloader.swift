//
//  ObjectDownloader.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import Foundation

final class ObjectDownloader: ObjectDownloading {
    func downloadData(from url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard
            let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            throw ObjectDownloadingError.downloadFailed
        }

        return data
    }
}
