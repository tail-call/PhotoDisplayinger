//
//  ObjectDownloader.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import Foundation

final class ObjectDownloader: ObjectDownloading {
    func downloadData(from url: URL) async throws -> Data {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let (data, response) = try await session.data(from: url)

        guard
            let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            throw ObjectDownloadingError.downloadFailed
        }

        return data
    }

    func downloadObject<T: Decodable>(
        of type: T.Type,
        from url: URL
    ) async throws -> T {
        let data = try await downloadData(from: url)

        let decoder = JSONDecoder()
        return try decoder.decode(type, from: data)
    }
}
