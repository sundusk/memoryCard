//
//  Combine.swift
//  sunduskBook
//
//  Created by IosDeveloper on 2024/7/16.
//

import Foundation
struct Card: Identifiable, Codable {
    let id: UUID
    var title: String
    var content: String
}
