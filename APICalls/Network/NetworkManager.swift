//
//  NetworkManager.swift
//  APICalls
//
//  Created by Rui Silva on 02/02/2024.
//

/// We will use the latest framework that apple provides to make an API call - Async/Await - We could use a 3rd party library but I think navite is the right way to go at least for now
/// However we could also use 'Combine' or '@escaping' closures.
/// @escaping closures are the oldest way in this list but still very used. Only available from iOS 15 (I think)
/// Combine provides a declarative API for processing values over time. So it's a framework that uses publishers to expose and listen to changes over time.

import Foundation

// We can look at this protocol when we go throught the project

protocol NetworkManaging {
    func fetchData() async throws -> [Character]
}

struct MockNetworkManager: NetworkManaging {
    func fetchData() async throws -> [Character] {
        return [Character(id: 1, name: "Character 1")]
    }
}

struct NetworkManager: NetworkManaging {
    
    // async - tells us that this is asynchronous code
    // throws - means that at some point, something could go wrong so it can throw an error as seen inside the method below
    
    // So this method below is asynchronous, can throw an error and returns an array of character
    // if you look at the response from the API call on Postman for instance, you'll see that we get an array of something, is this case we gonna call it "Character"
    
    
    func fetchData() async throws -> [Character] {
        guard let url = URL(string: Constants.URLs.baseURL + Constants.Parameters.character) else {
            throw NetworkError.invalidURL
        }
        
        //      When we execute a network call we don't really know how long it will take to get the results so we mark this session as 'await'
        //      So we will sort of suspend the code and until we get the results so we can then carry on with the rest of the code
        
        //      The word 'try' is used to catch possible errors. just like the 'throw' above this session can throw an error
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        
        let decodedData = try JSONDecoder().decode(CharacterResult.self, from: data)
        return decodedData.results
    }
}
