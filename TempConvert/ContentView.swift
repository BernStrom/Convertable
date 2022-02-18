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
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $input, format: .number)
                    
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input amount & unit to convert")
                }
            }
            .navigationTitle("TempConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
