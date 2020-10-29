//
//  CreativeTaskApp.swift
//  CreativeTask
//
//  Created by Anthony H on 10/29/20.
//

import SwiftUI

@main
struct CreativeTaskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
