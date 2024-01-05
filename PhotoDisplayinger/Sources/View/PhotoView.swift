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

        }
        .frame(width: 300, height: 200)
        .border(.black)
        .background {
            switch model.state {
            case .started, .loading:
                ProgressView()
            case .image(let image):
                Image(image, scale: 1, label: Text("Is this even visible?"))
                    .resizable(resizingMode: .stretch)
            case .error(let string):
                Text("Error: \(string)")
            }
        }
        .onAppear {
            self.model.beginDownloading()
        }
    }
}
