//
//  UIButton+.swift
//  Caculator
//
//  Created by datNguyem on 17/09/2021.
//

import Foundation
import UIKit

extension UIButton {
    func makeCircle(){
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
    }
    
    func makeRounded(){
        layer.cornerRadius = (frame.width - (4*12)) / 4
        layer.masksToBounds = true
    }
}
