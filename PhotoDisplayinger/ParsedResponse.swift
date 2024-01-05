//
//  ParsedResponse.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import Foundation

struct ParsedResponse: Decodable {
    enum Status: String, Decodable {
        case success, error
    }

    let message: [URL]
    let status: Status
}
