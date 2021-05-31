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
  
  private var clickedCards = Set<Int>()
  private var indexOfOneFaceUpCard: Int?
  private var clicksIndices = [Int]()
  
  func chooseCard(at index: Int) {
    clicksIndices.insert(index, at: 0)
    if !(cards[index].isPaired || cards[index].isFaceUp) {      //don't touch paired and faceUp cards
    
            
      if let matchedIndex = indexOfOneFaceUpCard,
                index != matchedIndex {                         //one card for matching
        console("Была открыта одна карта ранее. Нада проверить совпадение")
        
        if cards[index].id == cards[indexOfOneFaceUpCard!].id { // this is pair
           cards[index].isPaired = true
           cards[matchedIndex].isPaired = true
           console("Совпадение с ранее открытой")
           countPair += 1
           score += 2
        } else {
           console("Не совпала с ранее открытой")
           score += clickedCards.insert(index).inserted ? 0 : -1
        }
        cards[index].isFaceUp = true
        indexOfOneFaceUpCard = nil
        console("",3)
      } else {                                                 //no cards faceUp or 2
        
        if clicksIndices.prefix(2).count > 1,
           index == clicksIndices.prefix(2).last {
          console("Был клик по той же карте")
        }
        
        cards.indices.forEach { cards[$0].isFaceUp = false }
        
        cards[index].isFaceUp = true
        indexOfOneFaceUpCard = index
        
        score += clickedCards.insert(index).inserted ? 0 : -1
        
        console("Было открыто Ни одной или две.",2)
      }
    }
  }
  
  private func console(_ message: String, _ debugStyle: Int = 0) {
    var str = ""
        
    switch debugStyle {
      case 0: str += "\(message)"
      case 1:
        str += "\(message)\n"
        str += "index: \(clicksIndices.last!)\n"
        str += "matchedIndex: \(indexOfOneFaceUpCard ?? -1)"
      case 2:
        str += "\(message)\n"
        str += "index: \(clicksIndices.last!)\n"
        str += "matchedIndex: \(indexOfOneFaceUpCard ?? -1)\n"
      default:
        str += "index: \(clicksIndices.last!)\n"
        str += "matchedIndex: \(indexOfOneFaceUpCard ?? -1)\n"
    }
    
    print(str)
  }
  
  init(numberOfPairCards number: Int) {
    
    for _ in 1...number {
      let card = Card()
      self.cards += [card, card]
    }
    self.cards.shuffle()
  }
}
