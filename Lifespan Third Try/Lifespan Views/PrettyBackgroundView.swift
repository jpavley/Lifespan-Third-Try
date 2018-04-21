//
//  BarView.swift
//  Lifeclock
//
//  Created by John Pavley on 2/17/18.
//  Copyright © 2018 Epic Loot. All rights reserved.
//

import UIKit

// TODO: Change background color based on LifeClock time.
//       From light to dark. 12 o'clock is lightest.
//       6 o'clock is darkest.

@IBDesignable
class PrettyBackgroundView: UIView {
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let components: [CGFloat] = [1.0, 0, 0.2, 0.0, // start color
                                     1.0, 0, 0.2, 0.4] // end color
        
        let locations: [CGFloat] = [0, 1]
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorSpace: colorSpace,
                                  colorComponents: components,
                                  locations: locations,
                                  count: 2)
        
        let x = bounds.midX
        let y = bounds.midY
        let centerPoint = CGPoint(x: x, y: y)
        let radius = max(x, y)
        
        let context = UIGraphicsGetCurrentContext()
        context?.drawRadialGradient(gradient!, startCenter: centerPoint, startRadius: 0, endCenter: centerPoint, endRadius: radius, options: .drawsAfterEndLocation)
    }
 */
    
    
    
    @IBInspectable var borderWith: CGFloat = 1.0 {
        didSet {
            self.layer.borderWidth = borderWith
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.black {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            if isX() {
                layer.cornerRadius = 40
            } else {
                layer.cornerRadius = cornerRadius
            }

            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.shouldRasterize = true
        //backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.shouldRasterize = true
        //backgroundColor = UIColor.clear
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    fileprivate func isX() -> Bool {
        if UIDevice().userInterfaceIdiom == .phone {
            return (UIScreen.main.nativeBounds.height == 2436)
        } else {
            return false
        }
    }
}
