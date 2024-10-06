//
//  Standing.swift
//  PlayerBase
//
//  Created by Mohammed Menim on 2024-10-06.
//

import Foundation
struct Standing: Codable {
    let stage: String
    let type: String
    let table: [TeamStanding]
}
