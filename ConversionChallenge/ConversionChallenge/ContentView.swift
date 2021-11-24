//
//  ContentView.swift
//  ConversionChallenge
//
//  Created by Juan Diego Ocampo on 24/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit: UnitTemperature = .celsius
    @State private var targetUnit: UnitTemperature = .kelvin
    @State private var userInput = "13.6"
    
    let units = UnitTemperature.allCases
    
    var output: Double {
        guard let userInput = Double(self.userInput) else { return 0.0 }
        let measurement = Measurement(value: userInput, unit: inputUnit)
        return measurement.converted(to: targetUnit).value
    }
    
    var body: some View {
        NavigationView {
            Form {
                /// Tag: Convert From
                Section(header: Text("Convert")) {
                    HStack {
                        TextField("Value", text: $userInput)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.leading)
                        Spacer()
                        Picker("From", selection: $inputUnit) {
                            ForEach(units, id: \.self) {
                                Text("\(unitDescription($0))")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                }
                /// Select Target Unit for Conversion
                Section(header: Text("To")) {
                    Picker("To", selection: $targetUnit) {
                        ForEach(units, id: \.self) {
                            Text("\(unitDescription($0))")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                /// Tag: Display Results
                Section(header: Text("Result")) {
                    Text("\(output, specifier: "%.1f") \(targetUnit.symbol)")
                        .multilineTextAlignment(.leading)
                }
            }
            .navigationBarTitle("Temp. Conversion")
        }
    }
}

func unitDescription(_ unit: UnitTemperature) -> String {
    return unit.symbol
}

extension UnitTemperature: CaseIterable {
    public static var allCases: [UnitTemperature] {
        return [.celsius, .fahrenheit, .kelvin]
    }
}

extension UnitTemperature: Identifiable {
    public var id: Int {
        get { hashValue }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
