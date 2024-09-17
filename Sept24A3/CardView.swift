//
//  CardView.swift
//  Sept24A3
//
//  Created by Vanya Mutafchieva on 12/09/2024.
//

import SwiftUI

struct CardView: View {
    
    //typealias Card = SetGameOld.Card
    
    let card: Card
    let cardShapes = [1, 2, 3]
    
    var body: some View {
        ZStack {
            let shape = Capsule()
            //let shape = Rectangle()
            //let shape = Diamond()
            //    .stroke()
                .strokeBorder()
                .opacity(0.5)
                .foregroundStyle(.red)
                .aspectRatio(2/1, contentMode: .fit)
            RoundedRectangle(cornerRadius: 20)
                .stroke()
            VStack {
                ForEach(cardShapes, id: \.self) { cardShape in
                    shape
                }
                //.padding(.vertical)
            }
            .padding(.horizontal)
                
//            Text(card.description)
//                .foregroundStyle(.black)
        }
        
    }
    
    @ViewBuilder
    private func symbol(_ shape: String, shading: String, color: Color) -> some View {
        if shape == "diamond" {
            Diamond()
        } else if shape == "rectangle" {
            Rectangle()
        } else if shape == "capsule" {
            Capsule()
        }
        
    }
    
    @ViewBuilder
    private func applyShading(_ shading: String, to shape: some Shape) -> some View {
        if shading == "open" {
            shape.stroke()
        } else if shading == "shaded" {
            shape.opacity(0.6)
        } else if shading == "solid" {
            
        }
    }
}

#Preview {
    let card = Card(content: CardContent(numOfShapes: 3, shading: CardShading.open, color: CardColor.green, shape: CardShape.capsule), id: 4)
    return CardView(card: card)
        .padding()
}
