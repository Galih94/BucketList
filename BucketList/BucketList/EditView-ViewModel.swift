//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by Galih Samudra on 27/09/24.
//

import Foundation

extension EditView {
    @Observable
    class ViewModel {
        var name: String
        var location: Location
        var description: String
        var loadingState: LoadingState = .loading
        var pages: [Page] = []
        
        init(name: String, description: String, location: Location) {
            self.name = name
            self.description = description
            self.location = location
        }
        
        func fetchNearbyPlaces(location: Location) async {
            let urlString =  "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
            guard let url = URL(string: urlString) else {
                print("error -- Bad URL: \(urlString)")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let items = try JSONDecoder().decode(Result.self, from: data)
                pages = items.query.pages.values.sorted()
                loadingState = .loaded
            } catch {
                print("error -- \(error.localizedDescription) from url: \(urlString)")
                
                loadingState = .failed
            }
        }
    }
}
