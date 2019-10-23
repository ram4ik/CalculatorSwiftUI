//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by ramil on 20.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var display = "0"
    @Published var userIsInTheMiddleOfTyping = false
}

struct ContentView: View {
    @EnvironmentObject var calculatorVM: CalculatorViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            
            Text(calculatorVM.display)
                .font(.largeTitle)
                .padding(.all)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .border(Color.blue)
                .padding(.leading)
                .padding(.trailing)
            
            HStack(spacing: 8) {
                UnarySymbol()
                Digits()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct UnarySymbol: View {
    @EnvironmentObject var calculatorVM: CalculatorViewModel
    
    let symbols = ["∏", "√", "±", " "]

    var body: some View {
        VStack(spacing: 8) {
            ForEach(symbols, id: \.self) { mathematicalSymbol in
                Button(mathematicalSymbol, action: {
                    self.performOperation(mathematicalSymbol)
                }).frame(width: 64, height: 64)
                    .border(Color.blue)
            }
        }
    }
    
    func performOperation(_ symbol: String) {
        switch symbol {
        case "∏":
            calculatorVM.display = String(Double.pi)
        default:
            break
        }
    }
}

struct Digits: View {
     @EnvironmentObject var calculatorVM: CalculatorViewModel
    
    let digits = [[7, 8, 9],
                  [4, 5, 6],
                  [1, 2, 3],
                  [0]]
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(digits, id:\.self) {rowDigits in
                HStack(spacing: 8) {
                    ForEach(rowDigits, id: \.self) {digit in
                        Button("\(digit)", action: {
                            if self.calculatorVM.userIsInTheMiddleOfTyping {
                                self.calculatorVM.display = self.calculatorVM.display + "\(digit)"
                            } else {
                                self.calculatorVM.display = "\(digit)"
                                self.calculatorVM.userIsInTheMiddleOfTyping = true
                            }
                        }).frame(width: 64, height: 64)
                            .border(Color.blue)
                    }
                   
                }
            }
        }
    }
}
