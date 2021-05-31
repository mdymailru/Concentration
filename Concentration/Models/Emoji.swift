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
    
    theme = EmojiTheme(name: "Часы", level: 2)
    theme.collection = ["🕐","🕒","🕘","🕟","🕢","🕦","🕝","🕙","🕗","🕞","🕤","🕚","🕧","🕛","🕠","🕓"]
    
    collections.append(theme)

    theme = EmojiTheme(name: "Пиктограммы", level: 4)
    theme.collection = ["𝌶","𝌷","𝌸","𝌹","𝌺","𝌻","𝌼","𝌽","𝌾","𝌿","𝍀","𝍁","𝍂","𝍃","𝍄","𝍅"]
    collections.append(theme)
    
    theme = EmojiTheme(name: "Клинопись", level: 3)
    theme.collection = ["𐎫","𐎰","𐎱","𐎳","𐎵","𐎸","𐎹","𐎼","𐎻","𐎿","𐏀","𐏁","𐏂","𐎠","𒑜","𐎪"]
    collections.append(theme)
    
    theme = EmojiTheme(name: "Египет", level: 3)
    theme.collection = ["𓀦","𓀧","𓀮","𓀫","𓀡","𓀚","𓀗","𓀤","𓀗","𓀂","𓁏","𓁈","𓀯","𓁉","𓀍","𓁄"]
    collections.append(theme)
    
    
    rndTheme = collections.randomElement()!
  }
  
}

struct EmojiTheme {
  
  var name: String
  var level: Int
  var collection = [String]()
}
