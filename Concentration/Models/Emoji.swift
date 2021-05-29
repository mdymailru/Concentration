//
//  Emoji.swift
//  Concentration
//
//  Created by mdy on 30.05.2021.
//

import Foundation

class EmojiCollection {
  
  var rndTheme: EmojiTheme
  
  init() {
    var collections = [EmojiTheme]()
    var theme: EmojiTheme
      
    theme = EmojiTheme(name: "Животные", level: 1)
    theme.collection = ["🐶","🐱","🐭","🐻","🦁","🦊","🐸","🐼","🐷","🐵","🐔","🐮","🐨","🐯","🐹","🐻‍❄️"]
    collections.append(theme)
  
    theme = EmojiTheme(name: "Флаги", level: 2)
    theme.collection = ["🇦🇷","🇧🇧","🇧🇪","🇬🇧","🇬🇪","🇮🇱","🇮🇹","🇨🇳","🇱🇺","🇲🇱","🇳🇴","🇵🇼","🇷🇺","🇺🇸","🇺🇦","🇸🇪"]
    collections.append(theme)

    theme = EmojiTheme(name: "Пиктограммы", level: 3)
    theme.collection = ["𝌶","𝌷","𝌸","𝌹","𝌺","𝌻","𝌼","𝌽","𝌾","𝌿","𝍀","𝍁","𝍂","𝍃","𝍄","𝍅"]
    collections.append(theme)
    
    rndTheme = collections.randomElement()!
  }
  
}

struct EmojiTheme {
  
  var name: String
  var level: Int
  var collection = [String]()
}
