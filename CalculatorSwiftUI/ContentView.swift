//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by ramil on 20.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let digits = [7, 8, 9]
    var body: some View {
        HStack(spacing: 8) {
            ForEach(digits, id: \.self) {digit in
                Button("\(digit)", action: {
                    print("digit \(digit) pressed")
                }).frame(width: 64, height: 64)
                    .border(Color.blue)
            }
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
