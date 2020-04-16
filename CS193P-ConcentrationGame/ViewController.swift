//
//  ViewController.swift
//  CS193P-ConcentrationGame
//
//  Created by Pierre Gabory on 15/04/2020.
//  Copyright © 2020 Pierre Gabory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardIndex = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardIndex)
            updateGameView()
        }
    }
    
    @IBAction private func resetGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
        theme = nil
        updateGameView()
    }
    
    
    private var numberOfPairsOfCards: Int { (cardButtons.count + 1) / 2 }
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    private var flipCount = 0 { didSet { flipCountLabel.text = "Flip Count \(flipCount)" } }
    
    private func updateGameView() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
               button.setTitle(emoji(for: card), for: .normal)
               button.backgroundColor = .systemBackground
            }
            
            else {
                button.setTitle(" ", for: .normal)
                button.backgroundColor = card.isMatched ? .secondarySystemBackground : .systemOrange
            }
        }
    }
    
    private let themes = [
        "🍕🍔🍟🍗🍖🍝🍞🍯🍆🍅🌽",
        "🍎🍏🍊🍋🍒🍇🍉🍓🍌🍐🍍",
        "🍱🍣🍥🍙🍘🍚🍜🍲🍠🍢🍡",
        "🍩🍮🍦🍨🍧🎂🍰🍪🍫🍬🍭"
    ]
    
    private var theme: String?
    private var emoji = [Int:String]()
    
    private func emoji(for card:Card) -> String {
        if theme == nil { theme = themes.randomElement() }
        
        if emoji[card.identifier] == nil {
            let randomIndex = theme!.indices.randomElement()!
            emoji[card.identifier] = String(theme!.remove(at: randomIndex))
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
}
