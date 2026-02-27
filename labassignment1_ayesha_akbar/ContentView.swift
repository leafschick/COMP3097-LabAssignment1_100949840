//
//  ContentView.swift
//  labassignment1_ayesha_akbar
//
//  Created by Ayesha Akbar on 2026-02-27.
//

import SwiftUI

struct ContentView: View {
    @State private var currentNumber: Int = 0

    func generateRandomNumber() {
        currentNumber = Int.random(in: 1...100)
    }

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)

            Text("\(currentNumber)")
                .font(.system(size: 72, weight: .light))
                .foregroundStyle(.teal)

            Button(action: {
                
            }) {
                Text("Prime")
                    .font(.system(size: 32, weight: .light))
                    .foregroundStyle(Color.green)
            }

            Text("Not Prime")
                .font(.system(size: 32, weight: .light))
                .foregroundStyle(Color.green)
        }
        .padding()
        .onAppear {
            generateRandomNumber()
        }
    } // closes body
} // closes struct

#Preview {
    ContentView()
}
