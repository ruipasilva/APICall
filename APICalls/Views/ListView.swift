//
//  ListView.swift
//  APICalls
//
//  Created by Rui Silva on 05/02/2024.
//

import SwiftUI

struct ListView: View {
    let data: [Character]
    var body: some View {
        List {
            ForEach(data, id: \.id ) { item in
                Text(item.name)
            }
        }
    }
}

#Preview {
    ListView(data: [])
}
