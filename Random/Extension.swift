//
//  Extension.swift
//  Random
//
//  Created by Josefina Perez on 30/08/2020.
//  Copyright © 2020 Josefina Perez. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    
    // Borde redondo
      func round() {
          layer.cornerRadius = bounds.height / 2
          clipsToBounds = true
      }
    
    
    // Brilla
       func shine() {
           UIView.animate(withDuration: 0.1, animations: {
               self.alpha = 0.5
           }) { (completion) in
               UIView.animate(withDuration: 0.1, animations: {
                   self.alpha = 1
               })
           }
       }
}
