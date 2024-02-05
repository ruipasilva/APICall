//
//  APICallsApp.swift
//  APICalls
//
//  Created by Rui Silva on 02/02/2024.
//

import SwiftUI

@main
struct APICallsApp: App {
    @StateObject private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
