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
        // ignore matched cards
        if cards[index].isMatched { return }
        
        // try matching a card with another
        if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
            if cards[matchIndex] == cards[index] {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
            }
            
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = nil
        }
        
        // flipping a card
        else {
            // flip down all cards
            for flipDownIndex in cards.indices { cards[flipDownIndex].isFaceUp = false }
            
            // select card
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = index
        }
    }
    
    public init(numberOfPairsOfCards: Int) {
        for _ in 0 ..< numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        cards.shuffle()
    }
}
