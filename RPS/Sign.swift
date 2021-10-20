//
//  Sign.swift
//  RPS
//
//  Created by Jonathan E. Hardis on 10/19/21.
//

import Foundation

enum Sign {
    case rock
    case paper
    case scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
}
