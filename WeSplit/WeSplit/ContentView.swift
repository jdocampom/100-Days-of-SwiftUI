//
//  ContentView.swift
//  WeSplit
//
//  Created by Juan Diego Ocampo on 10/24/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0, 10, 15, 20, 25]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)
        let tipValue = (checkAmount / 100) * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    // MARK: - Main View
    
    var body: some View {
        NavigationView {
            Form {
                /// Tag: Bill Details
                Section(header: Text("Bill Details")) {
                    HStack {
                        Text("Bill Amount:")
                        Spacer()
                        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .focused($amountIsFocused)
                    }
                    HStack {
                        Text("Number of People")
                        Spacer()
                        Stepper("\(numberOfPeople)", value: $numberOfPeople, in: 2...20)
                    }
                    //                    Picker("Number of people", selection: $numberOfPeople) {
                    //                        ForEach(2..<100) {
                    //                            Text("\($0) people")
                    //                        }
                    //                    }
                }
                /// Tag: Tip Percentage
                Section (header: Text("Tip Percentage")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                /// Tag: Calculation Results
                Section (header: Text("Total Per Person")) {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

