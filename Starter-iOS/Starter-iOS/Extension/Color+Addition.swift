//
//  Color.swift
//  Starter-iOS
//
//  Created by Arun Jangid on 4/13/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
    
    convenience init?(rgbHexString: String, alpha: CGFloat = 1.0) {
        let scanner = Scanner(string: rgbHexString.replacingOccurrences(of: "#", with: ""))
        var rgbHex: UInt32 = 0
        guard scanner.scanHexInt32(&rgbHex) else {
            return nil
        }
        
        self.init(hex: Int(rgbHex), alpha: alpha)
    }
    
    
    @nonobjc
    convenience init(red: Int, green: Int, blue: Int, alpha: Double = 1.0) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: CGFloat(alpha))
    }
}
