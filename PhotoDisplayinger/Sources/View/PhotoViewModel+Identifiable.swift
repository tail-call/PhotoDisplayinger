//
//  PhotoViewModel+Identifiable.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import Foundation

extension PhotoViewModel: Identifiable {
    typealias ID = URL

    var id: URL { photo.url }
}
