//
//  CoreGraphicsView.swift
//  Lifespan 2018
//
//  Created by John Pavley on 2/22/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

extension FloatingPoint {
    var degreesToRadians: Self {
        return self * .pi / 180
        
    }
    var radiansToDegrees: Self {
        return self * 180 / .pi
    }
}

class CoreGraphicsView: UIView {
    
    var angle: CGFloat = 0.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        angle = 0
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        angle = 0
        super.init(coder: aDecoder)
    }
    
    /// On the main storyboard the clock view is 640 x 640.
    let canvasSize: CGFloat = 640.0
    
    func calcScaleFactor(viewWidth: CGFloat) -> CGFloat {
        let scaleFactor: CGFloat = viewWidth/canvasSize
        return scaleFactor
    }
}
