//
//  Concentration.swift
//  CS193P-ConcentrationGame
//
//  Created by Pierre Gabory on 15/04/2020.
//  Copyright © 2020 Pierre Gabory. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var numberOfFlips = 0
    private(set) var playerScore = 0
    
    var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var indexFound: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if indexFound == nil {
                        indexFound = index
                    } else {
                        return nil
                    }
                }
            }
            return indexFound
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    public func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Card index out of bounds.")
        if cards[index].isMatched { return }
        
        numberOfFlips += 1
        
        // try matching a card with another
        if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
            if cards[matchIndex] == cards[index] {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
                playerScore += 2
            }
            
            else if cards[index].seen { playerScore -= 1 }
            
            cards[index].isFaceUp = true
        }
        
        else {
            indexOfOneAndOnlyFaceUpCard = index
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Must use at least 1 pair of cards.")

        for _ in 0 ..< numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        cards.shuffle()
    }
}
