//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Juan Diego Ocampo on 11/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Select Cupcake Flavour")
                        Spacer()
                        Picker("Select Cupcake Flavour", selection: $order.type) {
                            ForEach(Order.types.indices) {
                                Text(Order.types[$0])
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    Stepper("Number of Cakes: \(order.quantity)", value: $order.quantity, in: 1...20)
                }
                Section {
                    Toggle("Additions", isOn: $order.specialRequestEnabled.animation())
                    if order.specialRequestEnabled {
                        Toggle("Extra Frosting", isOn: $order.extraFrosting)
                        Toggle("Extra Sprinkles", isOn: $order.addSprinkles)
                    }
                }
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
