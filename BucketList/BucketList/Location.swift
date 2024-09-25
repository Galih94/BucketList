//
//  Location.swift
//  BucketList
//
//  Created by Galih Samudra on 25/09/24.
//

import Foundation
import MapKit

struct Location: Codable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    #if DEBUG
    static let example = Location(id: UUID(),
                                  name: "Buckingham Palace",
                                  description: "Lit by over 40,000 lightbulbs.",
                                  latitude: 51.501,
                                  longitude: -0141)
    #endif
}

extension Location: Equatable {
    static func ==(lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }
}
