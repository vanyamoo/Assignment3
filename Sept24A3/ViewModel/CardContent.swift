//
//  CardContent.swift
//  Sept24A3
//
//  Created by Vanya Mutafchieva on 13/09/2024.
//

import SwiftUI

struct CardContent: Identifiable, Hashable, CustomStringConvertible {
    let numOfShapes: Int
    let shading: CardShading
    let color: CardColor
    let shape: CardShape
    
    var description: String {
        "\(numOfShapes) \(shading) \(color) \(shape)\(numOfShapes == 1 ? "" : "s")"
    }
    var id: String {
        "\(numOfShapes) \(shading) \(color) \(shape)\(numOfShapes == 1 ? "" : "s")"
    }
}

// Enums for Card Attributes
enum CardColor: Int, CaseIterable {
    case red = 1, green, purple
}

enum CardShape: Int, CaseIterable  {
    case diamond = 1, rectangle, capsule
}

enum CardShading: Int, CaseIterable  {
    case solid = 1, shaded, open
}


