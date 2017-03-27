//
//  AJView.swift
//  IBInspectable
//
//  Created by Arun Jangid on 25/02/16.
//  Copyright © 2016 Arun Jangid. All rights reserved.
//

import UIKit

@IBDesignable
class AJView: UIView {
    @IBInspectable var startColor: UIColor = UIColor.clear
    @IBInspectable var endColor: UIColor = UIColor.clear
    
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func draw(_ rect: CGRect) {
        //2 - get the current context
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.cgColor, endColor.cgColor]
        
        //3 - set up the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        //4 - set up the color stops
        let colorLocations:[CGFloat] = [0.0, 1.0]
        
        //5 - create the gradient
        let gradient = CGGradient(colorsSpace: colorSpace,
            colors: colors as CFArray,
            locations: colorLocations)
        
        //6 - draw the gradient
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x:0, y:self.bounds.height)
        context?.drawLinearGradient(gradient!,
            start: startPoint,
            end: endPoint,
            options: CGGradientDrawingOptions.drawsAfterEndLocation)
        
    }
    

   
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        self.updateView()
//    }
//    
//    override func prepareForInterfaceBuilder() {
//        super.prepareForInterfaceBuilder()
//        self.updateView()
//    }
//    
//    override func updateView() {
////        self.layer.cornerRadius = cornerRadius
//        
//        self.layer.masksToBounds = cornerRadius > 0
//        if isShadow == true{
//            self.addShadow(cornerRadius, shadowColor: shadowColor!, shadowOffset: shadowOffset, shadowOpacity: shadowOpacity, shadowRadius: shadowRadius)
//        }
//        
//        self.addBorder(borderWidth, borderColor: borderColor!, borderSide: borderSide)
//    }
}
