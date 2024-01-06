//
//  URLSession+dataIfCorrectResponse.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 06.01.2024.
//

import Foundation

extension URLSession {
    func dataIfCorrectResponse(from url: URL) async throws -> Data {
        let (data, response) = try await data(from: url)

        guard
            let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode)
        else {
            throw ObjectDownloadingError.downloadFailed
        }

        return data
    }
}
