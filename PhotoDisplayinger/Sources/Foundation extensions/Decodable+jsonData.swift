//
//  Decodable+jsonData.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 06.01.2024.
//

import Foundation

extension Decodable {
    init(jsonData: Data) throws {
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: jsonData)
    }
}
