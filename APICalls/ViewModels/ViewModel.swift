//
//  ViewModel.swift
//  APICalls
//
//  Created by Rui Silva on 05/02/2024.
//

import Foundation

// This is the ViewModel and it's the bridge between our model and our view. All the logic should appear here.
// We use a class because we we will be modeling data. Line 35 and 35 is where we transform the data we decoded from the API
// We can also say this where we gonna bind our data with our view

class ViewModel: ObservableObject {
    
    @Published public var state: LoadingState = .na
    
    private let networkManager: NetworkManaging
    
//    This is where we inject our Network layer in the view model.
//    Above we are declaring a property of type 'NetworkManager' and below we are initialising it.
    
    public init(networkManager: NetworkManaging = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    // Actors are a relative new thing.
    // Whenever we change the UI we need to do it in the main thread as it needs priority
    // @MainActors tell xCode that the code below it needs to run in the main thread
    @MainActor
    public func getCharacters() async {
        
        state = .loading
        
        do {
            let characters = try await networkManager.fetchData()
            state = .success(data: characters)
        } catch {
            self.state = .failed(error: NetworkError.unableToComplete)
        }
    }
    
}


