//
//  ProjectXApp.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 24.02.2026.
//

import SwiftUI
import SwiftData

@main
struct ProjectXApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            if AuthViewModel().isAuthenticated {
                ContentView()
            } else {
                NavigationStack {
                    LoginView()
                }
            }
        }
        .modelContainer(for: Note.self)
    }
    
}
