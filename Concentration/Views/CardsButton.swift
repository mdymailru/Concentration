//
//  CardsButton.swift
//  Concentration
//
//  Created by mdy on 29.05.2021.
//

import UIKit

class CardsButton: UIButton {

  override func awakeFromNib() {
    self.layer.cornerRadius = self.frame.size.height / 22
    self.backgroundColor = .orange
    
//    let image = UIImage(named: "mdy")
//    self.setImage(image, for: .normal)
    
  }

}
