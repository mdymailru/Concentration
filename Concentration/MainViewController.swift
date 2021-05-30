//
//  ViewController.swift
//  Concentration
//
//  Created by mdy on 29.05.2021.
//

import UIKit

class MainViewController: UIViewController {

  var game: GameModel!
  var emoji = [Int: String]()
  var emojiTheme: EmojiTheme! { //= EmojiCollection().rndTheme {
    didSet {
      themeLabel.text = "\(emojiTheme.name)  Уровень: \(emojiTheme.level)"
    }
  }
    
  @IBOutlet var buttonCards: [UIButton]!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var themeLabel: UILabel!
  
  override func viewDidLoad() {
    newGameTouch()
  }
  
  @IBAction func newGameTouch() {
    game = GameModel(numberOfPairCards: buttonCards.count / 2 )
    emojiTheme = EmojiCollection().rndTheme
    emoji.removeAll()
    updateViewFromModel()
  }
  
  @IBAction func touchButtonCard(_ sender: UIButton) {
    guard let index = buttonCards.firstIndex(of: sender) else { return }
    
    game.chooseCard(at: index)
    updateViewFromModel()
  }
  
  private func updateViewFromModel() {
    for index in buttonCards.indices {
      let button = buttonCards[index]
      let card = game.cards[index]
      
      if card.isFaceUp {
        button.setTitle(getEmoji(at: card), for: .normal)
        button.backgroundColor = .white
      } else {
        button.setTitle(nil, for: .normal)
        button.backgroundColor = .orange
      }
      
      if card.isPaired {
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
      }
    }
    
    scoreLabel.text = "Счет: \(game.countPair)"
  }
  
  private func getEmoji(at card: Card) -> String {
    if emoji[card.id] == nil,
       let rndIndex = emojiTheme.collection.indices.randomElement() {
      emoji[card.id] = emojiTheme.collection.remove(at: rndIndex)
    }
    return emoji[card.id] ?? "?"
  }
  
}

