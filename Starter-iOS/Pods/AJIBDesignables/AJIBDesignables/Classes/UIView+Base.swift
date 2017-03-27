//
//  UIViewBase.swift
//  IBInspectable
//
//  Created by Arun Jangid on 24/02/16.
//  Copyright © 2016 Arun Jangid. All rights reserved.
//

import Foundation
import UIKit


enum sides : String{
    case top = "top"
    case right = "right"
    case left = "left"
    case bottom = "bottom"
    case all = "default"
    
}
extension UIView{
    
    
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor.init(cgColor: self.layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor{
        get{
            return UIColor.init(cgColor:  layer.shadowColor!)
        }
        set{
            self.layer.shadowColor = newValue.cgColor

        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize{
        get {
            return self.layer.shadowOffset
        }
        set{
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float{
        get {
            return layer.shadowOpacity
        }
        set{
            self.layer.shadowOpacity = newValue

        }
    }

    @IBInspectable var borderSide: String {
        get {
            return self.borderSide
        }
        set{
            
            self.addBorder(self.borderWidth, borderColor: self.borderColor.cgColor , borderSide: newValue)
        }
    }

    
    
    func addShadow(_ cornerRadius:CGFloat, shadowColor:UIColor, shadowOffset:CGSize, shadowOpacity:Float, shadowRadius:CGFloat){
        
        self.layer.shadowPath = UIBezierPath(roundedRect: self.layer.bounds, cornerRadius: cornerRadius).cgPath
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
    }
    
    func addBorder(_ borderWidth:CGFloat, borderColor:CGColor, borderSide: String){
        
        
        let borderPath = UIBezierPath()
        let borderLayer = CAShapeLayer()
        
        switch borderSide {
            
        case sides.top.rawValue:
            
            borderPath.move(to: CGPoint(x: 0, y: 0))
            borderPath.addLine(to: CGPoint(x: self.frame.width, y: 0))
            
            break
        case sides.right.rawValue:
            borderPath.move(to: CGPoint(x: self.frame.width, y: 0))
            borderPath.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
            
            break
        case sides.left.rawValue:
            borderPath.move(to: CGPoint(x: 0, y: 0))
            borderPath.addLine(to: CGPoint(x: 0, y: self.frame.height))
            
            break
        case sides.bottom.rawValue:
            borderPath.move(to: CGPoint(x: 0, y: self.frame.height))
            borderPath.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
            
            break
        default:
            self.layer.borderColor = borderColor
            self.layer.borderWidth = borderWidth
            break
        }
        
        borderLayer.path = borderPath.cgPath
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.lineWidth = borderWidth
        borderLayer.strokeColor = borderColor
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.insertSublayer(borderLayer, at: 0)
        
        
    }
    
    func updateView(){
        
    }
}
