//
//  Helpers.swift
//  APICalls
//
//  Created by Rui Silva on 05/02/2024.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case invalidData
    case invalidResponse
    case unableToComplete
    
    public var title: String{
        switch self {
        case .invalidURL:
            "Invalid URL"
        case .invalidData:
            "Invalid Data"
        case .invalidResponse:
            "Invalid Response"
        case .unableToComplete:
            "Unable to complete"
        }
    }
}

public enum LoadingState {
    case na
    case loading
    case success(data: [Character])
    case failed(error: NetworkError)
}
