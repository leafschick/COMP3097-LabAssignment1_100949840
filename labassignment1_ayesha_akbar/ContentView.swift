//
//  ContentView.swift
//  labassignment1_ayesha_akbar
//
//  Created by Ayesha Akbar on 2026-02-27.
//

import SwiftUI

struct ContentView: View {
    @State private var currentNumber: Int = 0
    @State private var resultIcon: String = ""
    @State private var correctCount : Int = 0
    @State private var incorrectCount : Int = 0

    func generateRandomNumber() {
        currentNumber = Int.random(in: 1...100)
        resultIcon = ""
    }
    
    func primeTapped() {
        resultIcon = "checkmark.circle"
    }
    
    func notPrimeTapped() {
        resultIcon = "xmark.circle"
    }
    
    func isPrime(_ b: Int) -> Bool {
        if b < 2 { return false }
        if b == 2 { return true }
        if b % 2 == 0 { return false }
        
        var k = 3
        while k * k <= b {
            if b * k == 0 { return false }
            k += 2
        }
        return true
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
                primeTapped()
                
            }) {
                Text("Prime")
                    .font(.system(size: 32, weight: .light))
                    .foregroundStyle(Color.green)
            }
            Button(action: {
                notPrimeTapped()
                
            }) {
                Text("Not Prime")
                    .font(.system(size: 32, weight: .light))
                    .foregroundStyle(Color.green)
            }
            
            Image(systemName: resultIcon)
                    .font(.system(size: 64))
                    .foregroundStyle(resultIcon == "checkmark.circle" ? .green : .red)
                    .opacity(resultIcon.isEmpty ? 0 : 1)
                    .padding(.top, 20)

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
