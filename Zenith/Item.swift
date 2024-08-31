//
//  Item.swift
//  Zenith
//
//  Created by 李伟 on 2024/8/31.
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
