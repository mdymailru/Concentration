//
//  CardModel.swift
//  Concentration
//
//  Created by mdy on 29.05.2021.
//

import Foundation

struct Card {
  
  static var idFactory = 0
  
  var isFaceUp = false
  var isPaired = false
  var id: Int

  static func setID() -> Int {
    idFactory += 1
    return idFactory
  }
  
  init() {
    self.id = Self.setID()
  }
  
}
