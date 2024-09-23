//
//  ContentView.swift
//  BucketList
//
//  Created by Galih Samudra on 20/09/24.
//

import SwiftUI

struct ContentView: View {
    let values = [1,5,3,6,2,9].sorted()
    var body: some View {
        List(values, id: \.self) { value in
            Text(String(value))
        }
    }
}

#Preview {
    ContentView()
}
