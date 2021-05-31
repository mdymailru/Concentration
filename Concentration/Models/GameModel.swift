//
//  GameModel.swift
//  Concentration
//
//  Created by mdy on 29.05.2021.
//

import Foundation

class GameModel {
  
  var cards = [Card]()
  var score = 0
  var countPair = 0
  var maxPair: Int
  
  private var clickedCards = Set<Int>()
  private var indexOfOneFaceUpCard: Int?
  private var choosedCardIndex: Int = 0
   
  func chooseCard(at index: Int) {
    choosedCardIndex = index
    if countPair == maxPair { console("END") }
    
    if !(cards[index].isPaired) {                               //don't touch paired and faceUp cards
                
      if let matchedIndex = indexOfOneFaceUpCard,
                index != matchedIndex {                         //one card for matching
        console("Была открыта одна карта ранее. Надо проверить совпадение.")
        
        if cards[index].id == cards[indexOfOneFaceUpCard!].id { // this is pair
           cards[index].isPaired = true
           cards[matchedIndex].isPaired = true
           
           countPair += 1
           score += 2
           console("Совпадение с ранее открытой.")
        } else {
           
          score += clickedCards.insert(index).inserted ? 0 : -1
          clickedCards.forEach{print("\($0):\(cards[$0].id)")}
          console("Не совпала с ранее открытой.")
        }
        cards[index].isFaceUp = true
        indexOfOneFaceUpCard = nil
        console("",3)
      } else {                                                 //no cards faceUp or 2
        
        if !cards[index].isFaceUp {
          score += clickedCards.insert(index).inserted ? 0 : -1
        }
        cards.indices.forEach { cards[$0].isFaceUp = false }
        
        cards[index].isFaceUp = true
        indexOfOneFaceUpCard = index
        
        clickedCards.forEach{print("\($0):\(cards[$0].id)")}
        
        console("Было открыто или ни одной или две.",2)
      }
    }
  }
  
  private func console(_ message: String, _ debugStyle: Int = 0) {
    var str = ""
        
    switch debugStyle {
      case 0: str += "\(message)"
      case 1:
        str += "\(message)\n"
        str += "index: \(choosedCardIndex)\n"
        str += "matchedIndex: \(indexOfOneFaceUpCard ?? -1)"
      case 2:
        str += "\(message)\n"
        str += "index: \(choosedCardIndex)\n"
        str += "matchedIndex: \(indexOfOneFaceUpCard ?? -1)\n"
      default:
        str += "index: \(choosedCardIndex)\n"
        str += "matchedIndex: \(indexOfOneFaceUpCard ?? -1)\n"
    }
    
    print(str)
  }
  
  init(numberOfPairCards number: Int) {
    maxPair = number
    
    for _ in 1...number {
      let card = Card()
      self.cards += [card, card]
    }
    self.cards.shuffle()
  }
}
