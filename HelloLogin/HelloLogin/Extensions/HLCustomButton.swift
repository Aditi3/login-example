//
//  HLGGradientButton.swift
//  HelloLogin
//
//  Created by Aditi Agrawal on 24/10/20.
//  Copyright © 2020 Aditi Agrawal. All rights reserved.
//

import UIKit

@IBDesignable class HLCustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        // Common logic goes here
        refreshCorner(value: cornerRadius)
        refreshColor(color: backgroundImageColor)
        refreshBorderColor(_colorBorder: customBorderColor)
        refreshBorder(_borderWidth: borderWidth)
    }
    
    
    // MARK: - Corner Radius
    
    func refreshCorner(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    @IBInspectable var cornerRadius: CGFloat = 3 {
        didSet {
            refreshCorner(value: cornerRadius)
        }
    }
    
    
    // MARK: - Update color as UIImage
    
    func refreshColor(color: UIColor) {
        if color == UIColor.clear {
            setBackgroundImage(UIImage(), for: UIControl.State.normal)
        } else {
            let image = createImage(color: color)
            setBackgroundImage(image, for: UIControl.State.normal)
        }
        clipsToBounds = true
    }
    
    func createImage(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), true, 0.0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        return image
    }
    
    @IBInspectable var backgroundImageColor: UIColor = UIColor.init(red: 0, green: 122/255.0, blue: 255/255.0, alpha: 1) {
        didSet {
            refreshColor(color: backgroundImageColor)
        }
    }
    
    
    // MARK: - Border width
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            refreshBorder(_borderWidth: borderWidth)
        }
    }
    
    func refreshBorder(_borderWidth: CGFloat) {
        layer.borderWidth = _borderWidth
    }
    
    
    // MARK: - Border Color
    
    @IBInspectable var customBorderColor: UIColor = UIColor.init (red: 0, green: 122/255, blue: 255/255, alpha: 1){
        didSet {
            refreshBorderColor(_colorBorder: customBorderColor)
        }
    }
    
    func refreshBorderColor(_colorBorder: UIColor) {
        layer.borderColor = _colorBorder.cgColor
    }
}


