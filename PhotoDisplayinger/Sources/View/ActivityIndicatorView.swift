//
//  ActivityIndicatorView.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import Cocoa
import SwiftUI

struct ActivityIndicatorView: NSViewRepresentable {
    typealias NSViewType = NSProgressIndicator

    private var nsProgressIndicator: NSProgressIndicator = {
        let indicator = NSProgressIndicator()
        indicator.style = .spinning
        indicator.startAnimation(nil)
        return indicator
    }()

    func makeNSView(context: Context) -> NSProgressIndicator {
        nsProgressIndicator
    }
    
    func updateNSView(_ nsView: NSProgressIndicator, context: Context) {
        // Do nothing
    }
}
