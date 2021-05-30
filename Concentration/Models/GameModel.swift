//
//  GameModel.swift
//  Concentration
//
//  Created by mdy on 29.05.2021.
//

import Foundation

class GameModel {
  
  var cards = [Card]()
  var countPair = 0
  var indexOfOneFaceUpCard: Int?
  
  func chooseCard(at index: Int) {
    if !cards[index].isPaired {               //don't touch paired cards
      if let oldIndex = indexOfOneFaceUpCard,
                index != oldIndex {           //one card for matching
        
        if cards[index].id == cards[indexOfOneFaceUpCard!].id { // this is pair
           cards[index].isPaired = true
           cards[indexOfOneFaceUpCard!].isPaired = true
           countPair += 1
        
           cards[index].isFaceUp = true
           indexOfOneFaceUpCard = nil
        } else {                        //no pair
           cards[index].isFaceUp = true
           indexOfOneFaceUpCard = nil
        }
      } else {                               //no cards faceUp or 2
        
        for index in cards.indices { cards[index].isFaceUp = false }
        cards[index].isFaceUp = true
        indexOfOneFaceUpCard = index
        
      }
      
    }
    
    
    //cards[index].isFaceUp = !cards[index].isFaceUp
  }
    
  init(numberOfPairCards number: Int) {
    
    for _ in 1...number {
      let card = Card()
      self.cards += [card, card]
    }
    self.cards.shuffle()
  }
}
