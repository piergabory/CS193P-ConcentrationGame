//
//  ViewController.swift
//  CS193P-ConcentrationGame
//
//  Created by Pierre Gabory on 15/04/2020.
//  Copyright © 2020 Pierre Gabory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    private var flipCount = 0 { didSet { flipCountLabel.text = "Flip Count \(flipCount)" } }

    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardIndex = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardIndex)
            updateGameView()
        }
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        updateGameView()
    }
    
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
    
    private var emojisChoices = ["🍕", "🍔", "🍟", "🍗", "🍖", "🍝", "🍛", "🍤", "🍱", "🍣", "🍥", "🍙", "🍘", "🍚", "🍜", "🍲", "🍢", "🍡", "🥚", "🍞", "🍩", "🍮", "🍦", "🍨", "🍧", "🎂", "🍰", "🍪", "🍫", "🍬", "🍭", "🍯", "🍎", "🍏", "🍊", "🍋", "🍒", "🍇", "🍉", "🍓", "🍑", "🍈", "🍌", "🍐", "🍍", "🍠", "🍆", "🍅", "🌽"]
    private var emoji = [Int:String]()
    
    private func emoji(for card:Card) -> String {
        if emoji[card.identifier] == nil, !emojisChoices.isEmpty {
            let randomIndex = emojisChoices.indices.randomElement()!
            emoji[card.identifier] = emojisChoices.remove(at: randomIndex)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
}

