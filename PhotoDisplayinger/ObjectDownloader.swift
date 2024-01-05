//
//  ObjectDownloader.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import Foundation

protocol ObjectDownloading {
    func download<T: Decodable>(_ type: T.Type, from url: URL) async throws -> T
}

enum DataDownloadingError: Error {
    case downloadFailed
}

final class ObjectDownloader: ObjectDownloading {
    func download<T: Decodable>(_ type: T.Type, from url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard
            let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            throw DataDownloadingError.downloadFailed
        }

        let decoder = JSONDecoder()
        return try decoder.decode(type, from: data)
    }
}
