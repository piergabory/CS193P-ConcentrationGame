//
//  Concentration.swift
//  CS193P-ConcentrationGame
//
//  Created by Pierre Gabory on 15/04/2020.
//  Copyright © 2020 Pierre Gabory. All rights reserved.
//

import Foundation

class Concentration {
    public var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int?
    
    public func chooseCard(at index: Int) {
        if cards[index].isMatched { return }
        if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
            if cards[matchIndex].identifier == cards[index].identifier {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
            }
            
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = nil
        }
        
        else {
            for flipDownIndex in cards.indices {
                cards[flipDownIndex].isFaceUp = false
            }
            
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = index
        }
        
        
        cards[index].isFaceUp.toggle()
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0 ..< numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        
    }
}
