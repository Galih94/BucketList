//
//  ContentView.swift
//  BucketList
//
//  Created by Galih Samudra on 20/09/24.
//
import MapKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        Map(interactionModes: [])
            .mapStyle(.hybrid(elevation: .realistic))
    }
}

#Preview {
    ContentView()
}
