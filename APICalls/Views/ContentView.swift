// Copyright © xDesign. All rights reserved.

import SwiftUI

// Our main view where all the UI sits

struct ContentView: View {
    @ObservedObject private var viewModel: ViewModel

    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            switch viewModel.state {
            case .na:
                ContentUnavailableView("No Rick stuff", systemImage: "xmark")
            case .loading:
                ProgressView()
            case let .success(data):
                ListView(data: data)
                    .navigationTitle("Rick and Morty")
            case let .failed(error):
                ContentUnavailableView(error.title, systemImage: "xmark")
            }
        }
        .task {
            await viewModel.getCharacters()
        }
    }
}

#Preview {
    ContentView(viewModel: .init(networkManager: NetworkManager()))
}
