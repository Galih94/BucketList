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

extension User: Comparable {
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    let values = [1,5,3,6,2,9].sorted()
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Dave", lastName: "Jones"),
        User(firstName: "Jess", lastName: "Donner")
    ].sorted()
    var body: some View {
        List(users) { user in
            Text(String(user.firstName + " " + user.lastName))
        }
    }
}

#Preview {
    ContentView()
}
