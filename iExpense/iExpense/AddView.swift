//
//  AddView.swift
//  iExpense
//
//  Created by Juan Diego Ocampo on 12/06/21.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expenses
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    
    @State private var name: String = ""
    @State private var type: ExpenseType = .Personal
    @State private var amount: String = ""
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                HStack {
                    Text("Type")
                        .padding(.trailing)
                    Spacer()
                    Picker("Type", selection: $type) {
                        ForEach(ExpenseType.allCases, id: \.rawValue) { value in
                            Text(value.rawValue).tag(value)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.leading)
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
            }
            .navigationBarTitle("Add New Expense")
            .navigationBarItems(
                leading : Button("Cancel") {
                    self.presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Save") {
                    if let actualAmount = Int(amount), !name.isEmpty {
                        let item = ExpenseItem(name: name, type: type, amount: actualAmount)
                        expenses.items.append(item)
                        self.presentationMode.wrappedValue.dismiss()
                    } else {
                        showingAlert = true
                    }
                })
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error while saving Expense"), message: Text("Make sure you have entered the name and amount of the expense you want to register."), dismissButton: .default(Text("Dismiss")))
            }
        }
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
