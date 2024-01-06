//
//  AppUseCase.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 06.01.2024.
//

import Foundation

private let photosEndpointURL = URL(
    string: "https://dog.ceo/api/breed/saluki/images"
)!

final class AppUseCase {
    func photosList() async throws -> [Photo] {
        let response = try await ParsedResponse(
            jsonData: try URLSession.shared.dataIfCorrectResponse(
                from: photosEndpointURL
            )
        )

        return response.message.map { url in
            Photo(url: url)
        }
    }
}
