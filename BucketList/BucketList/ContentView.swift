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
                    Annotation(location.name, coordinate: location.coordinate) {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 40, height: 40)
                            .background(.white)
                            .clipShape(.circle)
                    }
                }
            }
            .mapStyle(.standard)
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local) {
                    let newLocation = Location(id: UUID(), name: "new location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
                    locations.append(newLocation)
                }
            }
        }
    }
}

#Preview {
    ContentView( )
}
