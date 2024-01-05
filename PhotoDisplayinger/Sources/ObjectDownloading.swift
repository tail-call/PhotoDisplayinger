//
//  ObjectDownloading.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import Foundation

protocol ObjectDownloading {
    func downloadData(from url: URL) async throws -> Data

    func downloadObject<T: Decodable>(
        of type: T.Type,
        from url: URL
    ) async throws -> T
}
