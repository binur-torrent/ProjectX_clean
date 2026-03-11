//
//  TabModel.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 26.02.2026.
//

import Foundation
import SwiftUI

enum TabModel: String, CaseIterable {
    case home = "house"
    case search = "sun.max"
    case profile = "person"
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .profile: return "Profile"
        case .search: return "Search"
        }
    }
}
