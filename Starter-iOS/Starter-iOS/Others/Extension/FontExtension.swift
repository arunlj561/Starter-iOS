//
//  File.swift
//  Vovo
//
//  Created by Arun Jangid on 3/23/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import UIKit
extension UIFont {
    
    
    
    class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue", size: size)!
    }
    
    class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: size)!
    }
    
    class func myItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Medium", size: size)!
    }
    
    convenience init(myCoder aDecoder: NSCoder) {
        if let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor {
            if let fontAttribute = fontDescriptor.fontAttributes["NSCTFontUIUsageAttribute"] as? String {
                var fontName = ""
                switch fontAttribute {
                case "CTFontRegularUsage":
                    fontName = "HelveticaNeue"
                case "CTFontEmphasizedUsage", "CTFontBoldUsage":
                    fontName = "HelveticaNeue-Bold"
                case "CTFontObliqueUsage":
                    fontName = "HelveticaNeue-Medium"
                default:
                    if let name = fontDescriptor.fontAttributes["NSFontNameAttribute"] as? String {
                        fontName = name
                    }
                    else {
                        fontName = "HelveticaNeue"
                    }
                }
                self.init(name: fontName, size: fontDescriptor.pointSize)!
            }
            else {
                self.init(myCoder: aDecoder)
            }
        }
        else {
            self.init(myCoder: aDecoder)
        }
    }
    
    override open class func initialize() {
        if self == UIFont.self {
            let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:)))
            let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:)))
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
            
            let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:)))
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:)))
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
            
            let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:)))
            let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myItalicSystemFont(ofSize:)))
            method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
            
           let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:)))
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:)))
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)

        }
    }
    
}
