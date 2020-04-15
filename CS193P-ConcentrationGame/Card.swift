//
//  Card.swift
//  CS193P-ConcentrationGame
//
//  Created by Pierre Gabory on 15/04/2020.
//  Copyright © 2020 Pierre Gabory. All rights reserved.
//

import Foundation

struct Card: Equatable {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var nextIdentifier = 0
    init() {
        identifier = Card.nextIdentifier
        Card.nextIdentifier += 1
    }
}
