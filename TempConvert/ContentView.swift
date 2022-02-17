//
//  ContentView.swift
//  TempConvert
//
//  Created by Bern N on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 100.0
    @State private var inputUnit = "Farenheit"
    @State private var outputUnit = "Celsius"
    
    let units = ["Celsius", "Farenheit", "Kelvin"]
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
