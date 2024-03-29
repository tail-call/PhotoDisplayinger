//
//  RootView.swift
//  PhotoDisplayinger
//
//  Created by Maria Zaitseva on 05.01.2024.
//

import SwiftUI
import Combine

struct RootView: View {
    @ObservedObject var model: RootViewModel
    @ObservedObject var appState: AppState

    init(
        model: RootViewModel,
        appState: AppState
    ) {
        self.model = model
        self.appState = appState
    }

    var body: some View {
        List {
            ForEach(model.photos) { photo in
                PhotoView(model: photo)
            }
        }
        .alert(
            "Error",
            isPresented: self.$appState.isPresentingAlert,
            actions: {
                Button(action: {
                    self.appState.hideAlert()
                }, label: {
                    Text("OK")
                })
            },
            message: {
                Text(self.appState.alertMessage ?? "???")
            }
        )
    }
}

#Preview {
    let appState = AppState(appUseCase: AppUseCase())

    return RootView(
        model: RootViewModel(appState: appState, factory: .shared),
        appState: appState
    )
}
