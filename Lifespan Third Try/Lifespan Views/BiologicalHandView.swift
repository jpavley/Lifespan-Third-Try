//
//  BiologicalHandView.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 5/27/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

class BiologicalHandView: CoreGraphicsView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        drawBiologicalAgeHand()
        self.transform = CGAffineTransform(rotationAngle: CGFloat(angle).degreesToRadians)

    }
    
    
    func drawBiologicalAgeHand() {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        // enable the following lines for flipped coordinate systems
        // ctx.translateBy(x: 0, y: self.bounds.size.height)
        // ctx.scaleBy(x: 1, y: -1)
        
        let scaleFactor: CGFloat = calcScaleFactor(viewWidth: self.bounds.width)
        ctx.scaleBy(x: scaleFactor, y: scaleFactor)
        
        /*  Biological Age  */
        let pathRef = CGMutablePath()
        pathRef.move(to: CGPoint(x: 308.028, y: 367.873))
        pathRef.addCurve(to: CGPoint(x: 308.028, y: 329.796), control1: CGPoint(x: 308.028, y: 367.873), control2: CGPoint(x: 308.028, y: 329.796))
        pathRef.addCurve(to: CGPoint(x: 316.009, y: 323.45), control1: CGPoint(x: 308.028, y: 329.796), control2: CGPoint(x: 316.009, y: 323.45))
        pathRef.addCurve(to: CGPoint(x: 316.009, y: 317.104), control1: CGPoint(x: 316.009, y: 323.45), control2: CGPoint(x: 316.009, y: 317.104))
        pathRef.addCurve(to: CGPoint(x: 308.028, y: 310.758), control1: CGPoint(x: 316.009, y: 317.104), control2: CGPoint(x: 308.028, y: 310.758))
        pathRef.addCurve(to: CGPoint(x: 316.009, y: 146.1), control1: CGPoint(x: 308.028, y: 310.758), control2: CGPoint(x: 316.009, y: 146.1))
        pathRef.addCurve(to: CGPoint(x: 323.8, y: 146.026), control1: CGPoint(x: 316.009, y: 146.1), control2: CGPoint(x: 323.8, y: 146.026))
        pathRef.addCurve(to: CGPoint(x: 331.972, y: 310.758), control1: CGPoint(x: 323.8, y: 146.026), control2: CGPoint(x: 331.972, y: 310.758))
        pathRef.addCurve(to: CGPoint(x: 323.991, y: 317.104), control1: CGPoint(x: 331.972, y: 310.758), control2: CGPoint(x: 323.991, y: 317.104))
        pathRef.addCurve(to: CGPoint(x: 323.991, y: 323.45), control1: CGPoint(x: 323.991, y: 317.104), control2: CGPoint(x: 323.991, y: 323.45))
        pathRef.addCurve(to: CGPoint(x: 331.972, y: 329.796), control1: CGPoint(x: 323.991, y: 323.45), control2: CGPoint(x: 331.972, y: 329.796))
        pathRef.addCurve(to: CGPoint(x: 331.972, y: 367.873), control1: CGPoint(x: 331.972, y: 329.796), control2: CGPoint(x: 331.972, y: 367.873))
        pathRef.addCurve(to: CGPoint(x: 308.028, y: 367.873), control1: CGPoint(x: 331.972, y: 367.873), control2: CGPoint(x: 308.028, y: 367.873))
        pathRef.closeSubpath()
        
        ctx.setFillColor(red: 0.004, green: 0.259, blue: 0.949, alpha: 1)
        ctx.addPath(pathRef)
        ctx.fillPath()
        
        
    }

}
