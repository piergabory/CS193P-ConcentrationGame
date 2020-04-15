//
//  ViewController.swift
//  CS193P-ConcentrationGame
//
//  Created by Pierre Gabory on 15/04/2020.
//  Copyright © 2020 Pierre Gabory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var flipCount = 0 {
        didSet { flipCountLabel.text = "Flip Count \(flipCount)" }
    }
    
    private var emojis = ["🍅", "🍌", "🥬", "🥑", "🍏", "🍉"]
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardIndex = cardButtons.firstIndex(of: sender), cardIndex < emojis.count {
            flipCard(withEmoji: emojis[cardIndex], on: sender)
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle(" ", for: .normal)
            button.backgroundColor = .systemOrange
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .systemBackground
        }
    }
    
}

