//
//  Card.swift
//  CS193P-ConcentrationGame
//
//  Created by Pierre Gabory on 15/04/2020.
//  Copyright © 2020 Pierre Gabory. All rights reserved.
//

import Foundation

struct Card: Hashable {
    var isMatched = false
    var isFaceUp = false { didSet { seen = isFaceUp || seen } }
    private(set) var seen = false
    
    private var identifier: Int
    private static var nextIdentifier = 0
    
    init() {
        identifier = Card.nextIdentifier
        Card.nextIdentifier += 1
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool { return lhs.identifier == rhs.identifier }
    func hash(into hasher: inout Hasher) { hasher.combine(identifier) }
}
