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
        guard let cardIndex = cardButtons.firstIndex(of: sender) else { return }
        game.chooseCard(at: cardIndex)
        updateGameView()
    }
    
    @IBAction private func resetGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
        theme = nil
        updateGameView()
    }
    
    
    private var numberOfPairsOfCards: Int { (cardButtons.count + 1) / 2 }
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private func updateGameView() {
        flipCountLabel.text = "Flip: \(game.numberOfFlips), Score: \(game.playerScore)"
        
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
    private var emoji = [Card:String]()
    
    private func emoji(for card:Card) -> String {
        if theme == nil { theme = themes.randomElement() }
        
        if emoji[card] == nil {
            let randomIndex = theme!.indices.randomElement()!
            emoji[card] = String(theme!.remove(at: randomIndex))
        }
        
        return emoji[card] ?? "?"
    }
    
}
