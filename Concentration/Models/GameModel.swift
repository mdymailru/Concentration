//
//  GameModel.swift
//  Concentration
//
//  Created by mdy on 29.05.2021.
//

import Foundation

class GameModel {
  
  var cards = [Card]()
  
  func choseCard(at index: Int) {
    cards[index].isFaceUp = !cards[index].isFaceUp
  }
  
  func newGame() {
    
  }
  
  
  private func randomCards() {
    var rndCards = [Card]()
    let countCards = cards.count
    
    for _ in 1...countCards {
      guard let rndIndex = cards.indices.randomElement() else { break }
      rndCards += [self.cards.remove(at: rndIndex)]
    }
    
    cards = rndCards
  }
  
  init(numberOfPairCards number: Int) {
    
    for _ in 1...number {
      let card = Card()
      self.cards += [card, card]
    }
    randomCards()
  }
  
  
}
