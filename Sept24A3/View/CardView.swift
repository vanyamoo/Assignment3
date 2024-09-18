//
//  CardView.swift
//  Sept24A3
//
//  Created by Vanya Mutafchieva on 12/09/2024.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 20)
            base.stroke()
            base.fill().foregroundStyle(.white)
            VStack {
                ForEach(0..<card.content.numOfShapes, id: \.self) { _ in
                    drawShape()
                        .foregroundStyle(card.content.color.applyColor())
                        .aspectRatio(2/1, contentMode: .fit)
                }
            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    private func drawShape() -> some View {
        switch card.content.shape {
        case .diamond:
            applyShading(to: Diamond())
        case .rectangle:
            applyShading(to: Rectangle())
        case .capsule:
            applyShading(to: Capsule())
            
        }
    }
    
    @ViewBuilder
    func applyShading(to shape: some Shape) -> some View {
        switch card.content.shading {
        case .open:
            shape.stroke()
        case .solid:
            shape.fill()
        case .shaded:
            ZStack {
                shape.stroke()
                shape.fill().opacity(0.2)
            }
        }
    }
}

#Preview {
    let card = Card(content: CardContent(numOfShapes: 3, shading: CardShading.shaded, color: CardColor.green, shape: CardShape.capsule), id: 4)
    return CardView(card: card)
        .padding()
}
