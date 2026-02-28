//
//  ContentView.swift
//  labassignment1_ayesha_akbar
//
//  Created by Ayesha Akbar on 2026-02-27.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var currentNumber: Int = 0
    @State private var resultIcon: String = ""
    @State private var correctCount : Int = 0
    @State private var incorrectCount : Int = 0
    @State private var attempts : Int = 0
    @State private var showAlert : Bool = false
    @State private var secondsLeft: Int = 5
    @State private var answeredinThisRound: Bool = false
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()


    func generateRandomNumber() {
        currentNumber = Int.random(in: 1...100)
        resultIcon = ""
        secondsLeft = 5
        answeredinThisRound = false
    }
    
    func primeTapped() {
        attempts += 1
        answeredinThisRound = true
        secondsLeft = 5
     if isPrime(currentNumber) {
            correctCount += 1
         resultIcon = "checkmark.circle"
     } else {
         incorrectCount += 1
         resultIcon = "xmark.circle"
     }
        checkForTenAttempts()
    }
    
    func notPrimeTapped() {
        attempts += 1
        answeredinThisRound = true
        secondsLeft = 5
     if isPrime(currentNumber) {
            incorrectCount += 1
         resultIcon = "xmark.circle"
     } else {
         correctCount += 1
         resultIcon = "checkmark.circle"
     }
        checkForTenAttempts()
    }
    
    func isPrime(_ b: Int) -> Bool {
        if b < 2 { return false }
        if b == 2 { return true }
        if b % 2 == 0 { return false }
        
        var k = 3
        while k * k <= b {
            if b % k == 0 { return false }
            k += 2
        }
        return true
    }
    
    func timeExpired() {
        if !answeredinThisRound {
            attempts += 1
            incorrectCount += 1
            resultIcon = "xmark.circle"
            checkForTenAttempts()
        }

        generateRandomNumber()
    }
    
    func checkForTenAttempts()  {
            if attempts % 10 == 0 {
                showAlert = true
            }
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
            
            if !resultIcon.isEmpty {
                Image(systemName: resultIcon)
                    .font(.system(size: 64))
                    .foregroundStyle(resultIcon == "checkmark.circle" ? .green : .red)
                    .padding(.top, 20)
            }
            
            HStack (spacing : 20) {
                Text("Correct: \(correctCount)")
                Text("Incorrect \(incorrectCount)")
            }
            .font(.footnote)
            .foregroundStyle(Color.gray)
            .padding(.top, 10)

        }
        .padding()
        .onAppear {
            generateRandomNumber()
        }
        .onReceive(timer) { _ in
                if secondsLeft > 0 {
                    secondsLeft -= 1
                } else {
                    timeExpired()
                }
            }
        .alert("Stats after \(attempts) attempts", isPresented: $showAlert) {
            Button("OK") {}
        } message: {
            Text("Correct: \(correctCount)\nIncorrect: \(incorrectCount)")

        }
    } // closes body
} // closes struct

#Preview {
    ContentView()
}
