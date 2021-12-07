//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Juan Diego Ocampo on 6/12/21.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: ExpenseType
    let amount: Int
}

enum ExpenseType: String, CaseIterable, Codable {
    case Personal = "Personal"
    case Business = "Business"
}
