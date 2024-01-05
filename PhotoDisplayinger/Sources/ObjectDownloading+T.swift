//
//  ObjectDownloading+T.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 06.01.2024.
//

import Foundation

extension ObjectDownloading {
    func downloadObject<T: Decodable>(
        of type: T.Type,
        from url: URL
    ) async throws -> T {
        let data = try await downloadData(from: url)

        let decoder = JSONDecoder()
        return try decoder.decode(type, from: data)
    }
}
