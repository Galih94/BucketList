//
//  ContentView.swift
//  BucketList
//
//  Created by Galih Samudra on 20/09/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Read and Write") {
            let data = Data("Test message".utf8)
            FileManager().write(data, path: "message.txt")
        }
    }
}

#Preview {
    ContentView()
}

extension FileManager {
    func write(_ data: Data, path: String) {
        let url = URL.documentsDirectory.appending(path: path)
        do {
            try data.write(to: url, options: [.atomic, .completeFileProtection])
            let input = try String(contentsOf: url)
            print("input -- \(input)")
        } catch {
            print("error -- \(error.localizedDescription)")
        }
    }
}
