//
//  AuthViewModel.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 06.04.2026.
//

import Foundation
import Supabase
import SwiftUI
import Combine

@MainActor
class AuthViewModel: ObservableObject {

    @Published var session: Session?
    
    init() {
        Task {
            await checkSession()
        }
    }
    
    func checkSession() async {
        do {
            let session = try await supabase.auth.session
            self.session = session
            print("Logged in as:", session.user.id)
        } catch {
            self.session = nil
            print("No active session")
        }
    }
    
    var isAuthenticated: Bool {
        session != nil && session?.isExpired == false
    }
}
