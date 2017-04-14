//
//  File.swift
//  Vovo
//
//  Created by Arun Jangid on 3/23/17.
//  Copyright © 2017 Arun Jangid. All rights reserved.
//

import Foundation
import UIKit
// MARK: - Swizzling
extension UIFont {
    class var defaultFontFamily: String { return "Georgia" }
    
    override open class func initialize()
    {
        if self == UIFont.self {
            swizzleSystemFont()
        }
    }
    
    private class func swizzleSystemFont()
    {
        let systemPreferredFontMethod = class_getClassMethod(self, #selector(UIFont.preferredFont(forTextStyle:)))
        let mySystemPreferredFontMethod = class_getClassMethod(self, Selector(("myPreferredFontForTextStyle:")))
        method_exchangeImplementations(systemPreferredFontMethod, mySystemPreferredFontMethod)
        
        let systemFontMethod = class_getClassMethod(self, #selector(UIFont.systemFont(ofSize:)))
        let mySystemFontMethod = class_getClassMethod(self, Selector(("mySystemFontOfSize:")))
        method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        
        let boldSystemFontMethod = class_getClassMethod(self, #selector(UIFont.boldSystemFont(ofSize:)))
        let myBoldSystemFontMethod = class_getClassMethod(self, Selector(("myBoldSystemFontOfSize:")))
        method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        
        let italicSystemFontMethod = class_getClassMethod(self, #selector(UIFont.italicSystemFont(ofSize:)))
        let myItalicSystemFontMethod = class_getClassMethod(self, Selector(("myItalicSystemFontOfSize:")))
        method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
    }
}

// MARK: - New Font Methods
extension UIFont {
    private class func myPreferredFontForTextStyle(style: String) -> UIFont
    {
        let defaultFont = myPreferredFontForTextStyle(style: style)  // will not cause stack overflow - this is now the old, default UIFont.preferredFontForTextStyle
        let newDescriptor = defaultFont.fontDescriptor.withFamily(defaultFontFamily)
        return UIFont(descriptor: newDescriptor, size: defaultFont.pointSize)
    }
    
    private class func mySystemFontOfSize(fontSize: CGFloat) -> UIFont
    {
        return myDefaultFontOfSize(fontSize: fontSize)
    }
    
    private class func myBoldSystemFontOfSize(fontSize: CGFloat) -> UIFont
    {
        return myDefaultFontOfSize(fontSize: fontSize, withTraits: .traitBold)
    }
    
    private class func myItalicSystemFontOfSize(fontSize: CGFloat) -> UIFont
    {
        return myDefaultFontOfSize(fontSize: fontSize, withTraits: .traitItalic)
    }
    
    private class func myDefaultFontOfSize(fontSize: CGFloat, withTraits traits: UIFontDescriptorSymbolicTraits = []) -> UIFont
    {
        let descriptor = UIFontDescriptor(name: defaultFontFamily, size: fontSize).withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: fontSize)
    }
}
