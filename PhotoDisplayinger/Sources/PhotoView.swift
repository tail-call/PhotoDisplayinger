//
//  PhotoView.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import SwiftUI

struct PhotoView: View {
    @ObservedObject var model: PhotoViewModel

    var body: some View {
        VStack {
            switch model.state {
            case .loading:
                Text("Loading image...")
            case .image(let image):
                Image(image, scale: 1, label: Text("Is this even visible?"))
            case .error(let string):
                Text("Error: \(string)")
            }
        }
        .frame(width: 300, height: 200)
    }
}
