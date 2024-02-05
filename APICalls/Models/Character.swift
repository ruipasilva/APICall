//
//  Character.swift
//  APICalls
//
//  Created by Rui Silva on 02/02/2024.
//

import Foundation

// This is our model and is where our data is stored.
// We use a struct here because we are not modeling any data.
// All the data we can see below comes from the API. 

public struct CharacterResult: Decodable {
    let results: [Character]
}

public struct Character: Decodable {
    let id: Int
    let name: String
}
