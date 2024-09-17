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
        "\(numOfShapes) \(shading) \(color) \(shape)"
    }
    var id: String {
        "\(numOfShapes) \(shading) \(color) \(shape)"
    }
}

// Enums for Card Attributes
enum CardColor: CaseIterable {
    case red, green, purple
}

enum CardShape: CaseIterable  {
    case diamond, rectangle, capsule
}

enum CardShading: CaseIterable  {
    case solid, shaded, open
}


