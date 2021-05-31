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
    initGame()
  }
  
  private func initGame() {
    game = GameModel(numberOfPairCards: buttonCards.count / 2 )
    emojiTheme = EmojiCollection().rndTheme
    emoji.removeAll()
    updateViewFromModel()
  }
  
  private func newGameShowAlert() {
    let alert = UIAlertController(title: nil,
                                message: "ИГРА ЗАВЕРШЕНА",
                         preferredStyle: .actionSheet)
    
    let newGameAlertButton = UIAlertAction(title: "Новая Игра", style: .default, handler: { _ in self.initGame() })
    let canсelAlertButton = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
    alert.addAction(newGameAlertButton)
    alert.addAction(canсelAlertButton)
    
    present(alert, animated: true, completion: nil)
    
  }
  
  @IBAction func newGameTouch() {
      newGameShowAlert()
  }
  
  @IBAction func touchButtonCard(_ sender: UIButton) {
    guard let index = buttonCards.firstIndex(of: sender) else { return }
    
    if game.countPair == game.maxPair { newGameShowAlert() }
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
//        button.setBackgroundImage(nil, for: .normal)
      } else {
        button.setTitle(nil, for: .normal)
        button.backgroundColor = .orange
//        let image = UIImage(named: "mdy")
//        button.setBackgroundImage(image, for: .normal)
      }
      
      if card.isPaired {
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
//        button.setBackgroundImage(nil, for: .normal)
      }
    }
    
    scoreLabel.text = "Счет: \(game.score)/\(game.countPair)"
  }
  
  private func getEmoji(at card: Card) -> String {
    if emoji[card.id] == nil,
       let rndIndex = emojiTheme.collection.indices.randomElement() {
      emoji[card.id] = emojiTheme.collection.remove(at: rndIndex)
    }
    return emoji[card.id] ?? "?"
  }
  
}

