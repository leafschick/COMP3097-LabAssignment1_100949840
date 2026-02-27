//
//  ContentView.swift
//  labassignment1_ayesha_akbar
//
//  Created by Ayesha Akbar on 2026-02-27.
//

import SwiftUI

struct ContentView: View {
    @State private var currentNumber: Int = 0
    // Get a random number
    func generateNumber() -> Int {
        Int.random(in: 1...100)
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
