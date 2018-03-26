//
//  MinuteHandView.swift
//  Lifespan 2018
//
//  Created by John Pavley on 2/22/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

class MinuteHandView: CoreGraphicsView {
    
    // Need to animate the second, hour, and minuet hand independently
    
    let minuteHandPathRef = CGMutablePath()
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        drawMinuteHand()
        self.transform = CGAffineTransform(rotationAngle: CGFloat(angle).degreesToRadians)
        
    }
    
    private func drawMinuteHand() {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        // enable the following lines for flipped coordinate systems
        // ctx.translateBy(x: 0, y: self.bounds.size.height)
        // ctx.scaleBy(x: 1, y: -1)
        
        let scaleFactor: CGFloat = calcScaleFactor(viewWidth: self.bounds.width)
        ctx.scaleBy(x: scaleFactor, y: scaleFactor)
        
        /*  Shape   */
        minuteHandPathRef.move(to: CGPoint(x: 308.028, y: 367.873))
        minuteHandPathRef.addCurve(to: CGPoint(x: 308.028, y: 329.796), control1: CGPoint(x: 308.028, y: 367.873), control2: CGPoint(x: 308.028, y: 329.796))
        minuteHandPathRef.addCurve(to: CGPoint(x: 316.009, y: 323.45), control1: CGPoint(x: 308.028, y: 329.796), control2: CGPoint(x: 316.009, y: 323.45))
        minuteHandPathRef.addCurve(to: CGPoint(x: 316.009, y: 317.104), control1: CGPoint(x: 316.009, y: 323.45), control2: CGPoint(x: 316.009, y: 317.104))
        minuteHandPathRef.addCurve(to: CGPoint(x: 308.028, y: 310.758), control1: CGPoint(x: 316.009, y: 317.104), control2: CGPoint(x: 308.028, y: 310.758))
        minuteHandPathRef.addCurve(to: CGPoint(x: 316.009, y: 101.333), control1: CGPoint(x: 308.028, y: 310.758), control2: CGPoint(x: 316.009, y: 101.333))
        minuteHandPathRef.addCurve(to: CGPoint(x: 323.991, y: 101.333), control1: CGPoint(x: 316.009, y: 101.333), control2: CGPoint(x: 323.991, y: 101.333))
        minuteHandPathRef.addCurve(to: CGPoint(x: 331.972, y: 310.758), control1: CGPoint(x: 323.991, y: 101.333), control2: CGPoint(x: 331.972, y: 310.758))
        minuteHandPathRef.addCurve(to: CGPoint(x: 323.991, y: 317.104), control1: CGPoint(x: 331.972, y: 310.758), control2: CGPoint(x: 323.991, y: 317.104))
        minuteHandPathRef.addCurve(to: CGPoint(x: 323.991, y: 323.45), control1: CGPoint(x: 323.991, y: 317.104), control2: CGPoint(x: 323.991, y: 323.45))
        minuteHandPathRef.addCurve(to: CGPoint(x: 331.972, y: 329.796), control1: CGPoint(x: 323.991, y: 323.45), control2: CGPoint(x: 331.972, y: 329.796))
        minuteHandPathRef.addCurve(to: CGPoint(x: 331.972, y: 367.873), control1: CGPoint(x: 331.972, y: 329.796), control2: CGPoint(x: 331.972, y: 367.873))
        minuteHandPathRef.addCurve(to: CGPoint(x: 308.028, y: 367.873), control1: CGPoint(x: 331.972, y: 367.873), control2: CGPoint(x: 308.028, y: 367.873))
        minuteHandPathRef.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0.498, blue: 0.075, alpha: 1)
        ctx.addPath(minuteHandPathRef)
        ctx.fillPath()
        
    }
}
