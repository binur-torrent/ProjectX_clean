//
//  Item.swift
//  ProjectX
//
//  Created by Binur Balmukhamed on 24.02.2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
