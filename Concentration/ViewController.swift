 //
//  ViewController.swift
//  Concentration
//
//  Created by Louis Liao on 2020/3/22.
//  Copyright © 2020 Louis Liao. All rights reserved.
//

// MARK: Need to finish assiment 1: select ramdom themes
 
import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOFPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 { didSet { flipCountLabel.text = "Flips: \(flipCount)" } }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
//    var alreadyChoseTheme = false
    
    @IBAction func touchCard(_ sender: UIButton) {
//        if alreadyChoseTheme == false {
//            chooseTheme()
//            alreadyChoseTheme = true
//        }
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in CardButtons")
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        flipCount = 0
        game.restartGame()
        updateViewFromModel()
        game.cards.shuffle()
//        chooseTheme()
    }
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 0) : #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
            }
        }
    }
   
//    var emojiChoices = [String]()
//
//    func chooseTheme() {
//        let emojiThemes = [
//            "animals": ["🦙","🦁", "🐒" ],
//            "sports": ["⚾️", "🏀", "🏄‍♂️"],
//            "faces": ["😇", "😜", "😳"],
//            "fruits": ["🍎", "🥑", "🍍"],
//            "cars": ["🚗", "🚓", "🚓"],
//            "flags": ["🇺🇸", "🇹🇼", "🇯🇵"]
//        ]
//        let themeKeys = Array(emojiThemes.keys)
//        let themeIndex = Int(arc4random_uniform(UInt32(themeKeys.count)))
//        emojiChoices = Array(emojiThemes.values)[themeIndex]
//        print(emojiChoices)
//    }
    
    
    var emojiChoices = ["👻", "🎃", "🦙", "💰", "💻", "💩", "😭"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.indentifier] == nil, emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.indentifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.indentifier] ?? "?"
        
    }
    
}

