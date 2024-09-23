//
//  ContentView.swift
//  BucketList
//
//  Created by Galih Samudra on 20/09/24.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
}

struct ContentView: View {
    let values = [1,5,3,6,2,9].sorted()
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Dave", lastName: "Jones"),
        User(firstName: "Jess", lastName: "Donner")
    ].sorted {
        $0.lastName < $1.lastName
    }
    var body: some View {
        List(users) { user in
            Text(String(user.firstName + " " + user.lastName))
        }
    }
}

#Preview {
    ContentView()
}
