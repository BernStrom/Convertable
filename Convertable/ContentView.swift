//
//  ContentView.swift
//  Convertable
//
//  Created by Bern N on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 100.0
    @State private var inputUnit: Dimension = UnitTemperature.celsius
    @State private var outputUnit: Dimension = UnitTemperature.fahrenheit
    @State private var selectedUnits = 0
    @FocusState private var inputIsFocused: Bool
    
    let conversionTypes = ["Distance", "Mass", "Temperature", "Time"]
    let unitTypes = [
        [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles],
        [UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds, UnitMass.stones],
        [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin],
        [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds]
    ]
    
    let formatter: MeasurementFormatter
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
    
    var result: String {
        let inputMeasurement = Measurement(value: input, unit: inputUnit)
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        return formatter.string(from: outputMeasurement)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                    
                    Picker("Conversion", selection: $selectedUnits) {
                        ForEach(0..<conversionTypes.count) {
                            Text(conversionTypes[$0])
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Picker("Convert from", selection: $inputUnit) {
                        ForEach(unitTypes[selectedUnits], id: \.self) {
                            Text(formatter.string(from: $0).capitalized)
                        }
                    }
                } header: {
                    Text("Input amount & select unit to convert")
                }
                
                Section {
                    Picker("Convert to", selection: $outputUnit) {
                        ForEach(unitTypes[selectedUnits], id: \.self) {
                            Text(formatter.string(from: $0).capitalized)
                        }
                    }
                } header: {
                    Text("Select output unit to convert")
                }
                
                Section {
                    Text(result)
                } header: {
                    Text("Output result")
                }
            }
            .navigationTitle("Convertable")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
            .onChange(of: selectedUnits) { newSelection in
                let units = unitTypes[newSelection]
                inputUnit = units[0]
                outputUnit = units[1]
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
