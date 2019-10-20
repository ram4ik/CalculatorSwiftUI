//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by ramil on 20.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(spacing: 8) {
            
            Button("7", action: {
                print("digit pressed")
            }).frame(width: 64, height: 64)
                .border(Color.blue)
            
            Button("8", action: {
                print("digit pressed")
            }).frame(width: 64, height: 64)
                .border(Color.blue)
            
            Button("9", action: {
                print("digit pressed")
            }).frame(width: 64, height: 64)
                .border(Color.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
