//
//  ViewController.swift
//  Concentration
//
//  Created by mdy on 29.05.2021.
//

import UIKit

class MainViewController: UIViewController {

  var emojiTheme = EmojiCollection().rndTheme {
    didSet {
      themeLabel.text = "\(emojiTheme.name)  Уровень: \(emojiTheme.level)"
    }
  }
  var emoji = [Int: String]()
  
  @IBOutlet var buttonCards: [UIButton]!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var themeLabel: UILabel!
  
  lazy var game = GameModel(numberOfPairCards: buttonCards.count / 2 )
  
  @IBAction func newGameTouch() {
    game = GameModel(numberOfPairCards: buttonCards.count / 2 )
    emojiTheme = EmojiCollection().rndTheme
    emoji.removeAll()
    faceDownAllCard()
  }
  
  @IBAction func touchButtonCard(_ sender: UIButton) {
    
    guard let index = buttonCards.firstIndex(of: sender) else { return }
    
    game.choseCard(at: index)
    updateView(at: index)
  }
  
  private func faceDownAllCard() {
    for button in buttonCards {
      button.setTitle(nil, for: .normal)
      button.backgroundColor = .orange
    }
  }
  
  private func updateView(at index: Int) {
    
    let button = buttonCards[index]
    let card = game.cards[index]
    
    if !card.isFaceUp {
      button.setTitle(nil, for: .normal)
      button.backgroundColor = .orange
    } else {
      
      if emoji[card.id] == nil {
        let rndIndex = emojiTheme.collection.indices.randomElement()
        emoji[card.id] = emojiTheme.collection.remove(at: rndIndex!)
      }
      
      button.setTitle(emoji[card.id], for: .normal)
      button.backgroundColor = .white

    }
    
  }
  
}

