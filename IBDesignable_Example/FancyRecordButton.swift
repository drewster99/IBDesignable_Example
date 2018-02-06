//
//  FancyRecordButton.swift
//  IBDesignable_Example
//
//  Created by Andrew Benson on 2/5/18.
//  Copyright © 2018 Nuclear Cyborg Corp. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

@IBDesignable class FancyRecordButton : UIButton {

    @IBInspectable var fancyColor1 : UIColor = UIColor.white {
        didSet {
            updateBackground(color1: fancyColor1, color2: fancyColor2)
            
        }
    }
    @IBInspectable var fancyColor2 : UIColor = UIColor.black {
        didSet {
            updateBackground(color1: fancyColor1, color2: fancyColor2)
            
        }
    }
    
    func updateBackground(color1 : UIColor, color2: UIColor) {
        //let rect = CGRect(origin: frame.origin, size: CGSize(width: frame.size.width * 0.75, height: frame.size.height * 0.75))
        UIGraphicsBeginImageContext(frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            
            context.setFillColor(color1.cgColor)
            context.move(to: CGPoint(x: 0, y: 0))
            context.addLine(to: CGPoint(x: frame.width, y: frame.height))
            context.addLine(to: CGPoint(x: frame.width, y: 0))
            context.addLine(to: CGPoint(x: 0, y: 0))
            context.drawPath(using: .fill)
            
            context.setFillColor(color2.cgColor)
            context.move(to: CGPoint(x: 0, y: 0))
            context.addLine(to: CGPoint(x: frame.width, y: frame.height))
            context.addLine(to: CGPoint(x: 0, y: frame.height))
            context.addLine(to: CGPoint(x: 0, y: 0))
            context.drawPath(using: .fill)
        }
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        backgroundColor = nil
        setBackgroundImage(newImage, for: .normal)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
