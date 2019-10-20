//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by ramil on 20.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var display = "0"
    var body: some View {
        VStack(spacing: 8) {
            
            Text(display)
                .font(.largeTitle)
                .padding(.all)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .border(Color.blue)
                .padding(.leading)
                .padding(.trailing)
            
            Digits(display: $display)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Digits: View {
    
    let digits = [[7, 8, 9],
                  [4, 5, 6],
                  [1, 2, 3],
                  [0]]
    
    @Binding var display: String
    
    var body: some View {
        ForEach(digits, id:\.self) {rowDigits in
            HStack(spacing: 8) {
                ForEach(rowDigits, id: \.self) {digit in
                    Button("\(digit)", action: {
                        self.display = self.display + "\(digit)"
                    }).frame(width: 64, height: 64)
                        .border(Color.blue)
                }
               
            }
        }
    }
}
