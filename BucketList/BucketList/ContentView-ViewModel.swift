//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Galih Samudra on 26/09/24.
//

import CoreLocation
import LocalAuthentication
import MapKit
import Foundation

extension ContentView {
    @Observable
    class ViewModel {
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        private(set) var locations: [Location]
        var selectedPlace: Location?
        var isUnlocked = false
        let context = LAContext()
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
            save()
        }
        
        func update(location: Location) {
            guard let selectedPlace else { return }
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("error -- \(error.localizedDescription)")
            }
        }
        
        func authenticate() {
            var error: NSError?
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places"
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] isSuccess, authError in
                    if isSuccess {
                        self?.isUnlocked = true
                    } else {
                        self?.isUnlocked = false
                        if let authError { print("error -- \(authError.localizedDescription)") }
                    }
                }
            } else {
                /// no biometrics
                if let error { print("error -- \(error.localizedDescription)") }
            }
        }
    }
}
