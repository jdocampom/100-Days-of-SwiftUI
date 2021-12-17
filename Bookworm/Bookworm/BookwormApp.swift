//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Juan Diego Ocampo on 16/12/21.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
