//
//  ObjectDownloadingError.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import Foundation

enum ObjectDownloadingError: Error {
    case downloadFailed
    case cgDataProviderCreationFailed
    case cgImageCreationFailed
}
