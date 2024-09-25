//
//  ContentView.swift
//  BucketList
//
//  Created by Galih Samudra on 20/09/24.
//
import MapKit
import SwiftUI

struct ContentView: View {
    
    @State private var locations = [Location]()
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56,
                                           longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10,
                                   longitudeDelta: 10)
        )
    )
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(locations) { location in
                    Marker(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                }
            }
            .mapStyle(.hybrid)
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local) {
                    print("tap: \(coordinate)")
                    let newLocation = Location(id: UUID(), name: "new location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
                    locations.append(newLocation)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
