//
//  OdometerTextView.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 5/27/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

class OdometerTextView: CoreGraphicsView {
    
    var odoValues = [0,1,2,3,4,5]
    var odoLabel = "Days spent since 12 Feb 1960"

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        drawOdometerNumbers()
    }
    
    func drawOdometerNumbers() {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        // enable the following lines for flipped coordinate systems
        // ctx.translateBy(x: 0, y: self.bounds.size.height)
        // ctx.scaleBy(x: 1, y: -1)
        
        let scaleFactor: CGFloat = calcScaleFactor(viewWidth: self.bounds.width)
        ctx.scaleBy(x: scaleFactor, y: scaleFactor)
        
        /*  odoValues 0   */
        let attributedStr = NSMutableAttributedString(string: "\(odoValues[0])")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let textAttribs = [
            .font: UIFont(name: "Helvetica-Bold", size: 39)!,
            .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            .paragraphStyle: paragraphStyle
            ] as [NSAttributedStringKey: Any]
        attributedStr.setAttributes(textAttribs, range: NSRange(location: 0, length: 1))
        
        let textBox = CGRect(x: 174.5, y: 456, width: 48, height: 48)
        let textBoxPath = CGPath(rect: CGRect(x: 0, y: 0, width: textBox.size.width, height: textBox.size.height), transform: nil)
        let framesetter = CTFramesetterCreateWithAttributedString(attributedStr)
        let frameRef = CTFramesetterCreateFrame(framesetter, CFRange(location: 0, length: 0), textBoxPath, nil)
        ctx.saveGState()
        ctx.translateBy(x: textBox.origin.x, y: textBox.origin.y)
        
        ctx.textMatrix = .identity
        ctx.translateBy(x: 0.0, y: textBox.size.height)
        ctx.scaleBy(x: 1.0, y: -1.0)
        CTFrameDraw(frameRef, ctx)
        
        ctx.restoreGState()
        
        /*  odoValues 1  */
        let attributedStr2 = NSMutableAttributedString(string: "\(odoValues[1])")
        let paragraphStyle2 = NSMutableParagraphStyle()
        paragraphStyle2.alignment = .center
        let textAttribs2 = [
            .font: UIFont(name: "Helvetica-Bold", size: 39)!,
            .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            .paragraphStyle: paragraphStyle2
            ] as [NSAttributedStringKey: Any]
        attributedStr2.setAttributes(textAttribs2, range: NSRange(location: 0, length: 1))
        
        let textBox2 = CGRect(x: 222.5, y: 456, width: 48, height: 48)
        let textBoxPath2 = CGPath(rect: CGRect(x: 0, y: 0, width: textBox2.size.width, height: textBox2.size.height), transform: nil)
        let framesetter2 = CTFramesetterCreateWithAttributedString(attributedStr2)
        let frameRef2 = CTFramesetterCreateFrame(framesetter2, CFRange(location: 0, length: 0), textBoxPath2, nil)
        ctx.saveGState()
        ctx.translateBy(x: textBox2.origin.x, y: textBox2.origin.y)
        
        ctx.textMatrix = .identity
        ctx.translateBy(x: 0.0, y: textBox2.size.height)
        ctx.scaleBy(x: 1.0, y: -1.0)
        CTFrameDraw(frameRef2, ctx)
        
        ctx.restoreGState()
        
        /*  odoValues 2  */
        let attributedStr3 = NSMutableAttributedString(string: "\(odoValues[2])")
        let paragraphStyle3 = NSMutableParagraphStyle()
        paragraphStyle3.alignment = .center
        let textAttribs3 = [
            .font: UIFont(name: "Helvetica-Bold", size: 39)!,
            .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            .paragraphStyle: paragraphStyle3
            ] as [NSAttributedStringKey: Any]
        attributedStr3.setAttributes(textAttribs3, range: NSRange(location: 0, length: 1))
        
        let textBox3 = CGRect(x: 270.5, y: 456, width: 48, height: 48)
        let textBoxPath3 = CGPath(rect: CGRect(x: 0, y: 0, width: textBox3.size.width, height: textBox3.size.height), transform: nil)
        let framesetter3 = CTFramesetterCreateWithAttributedString(attributedStr3)
        let frameRef3 = CTFramesetterCreateFrame(framesetter3, CFRange(location: 0, length: 0), textBoxPath3, nil)
        ctx.saveGState()
        ctx.translateBy(x: textBox3.origin.x, y: textBox3.origin.y)
        
        ctx.textMatrix = .identity
        ctx.translateBy(x: 0.0, y: textBox3.size.height)
        ctx.scaleBy(x: 1.0, y: -1.0)
        CTFrameDraw(frameRef3, ctx)
        
        ctx.restoreGState()
        
        /*  odoValues 3  */
        let attributedStr4 = NSMutableAttributedString(string: "\(odoValues[3])")
        let paragraphStyle4 = NSMutableParagraphStyle()
        paragraphStyle4.alignment = .center
        let textAttribs4 = [
            .font: UIFont(name: "Helvetica-Bold", size: 39)!,
            .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            .paragraphStyle: paragraphStyle4
            ] as [NSAttributedStringKey: Any]
        attributedStr4.setAttributes(textAttribs4, range: NSRange(location: 0, length: 1))
        
        let textBox4 = CGRect(x: 318.5, y: 456, width: 48, height: 48)
        let textBoxPath4 = CGPath(rect: CGRect(x: 0, y: 0, width: textBox4.size.width, height: textBox4.size.height), transform: nil)
        let framesetter4 = CTFramesetterCreateWithAttributedString(attributedStr4)
        let frameRef4 = CTFramesetterCreateFrame(framesetter4, CFRange(location: 0, length: 0), textBoxPath4, nil)
        ctx.saveGState()
        ctx.translateBy(x: textBox4.origin.x, y: textBox4.origin.y)
        
        ctx.textMatrix = .identity
        ctx.translateBy(x: 0.0, y: textBox4.size.height)
        ctx.scaleBy(x: 1.0, y: -1.0)
        CTFrameDraw(frameRef4, ctx)
        
        ctx.restoreGState()
        
        /*  odoValues 4  */
        let attributedStr5 = NSMutableAttributedString(string: "\(odoValues[4])")
        let paragraphStyle5 = NSMutableParagraphStyle()
        paragraphStyle5.alignment = .center
        let textAttribs5 = [
            .font: UIFont(name: "Helvetica-Bold", size: 39)!,
            .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            .paragraphStyle: paragraphStyle5
            ] as [NSAttributedStringKey: Any]
        attributedStr5.setAttributes(textAttribs5, range: NSRange(location: 0, length: 1))
        
        let textBox5 = CGRect(x: 366.5, y: 456, width: 48, height: 48)
        let textBoxPath5 = CGPath(rect: CGRect(x: 0, y: 0, width: textBox5.size.width, height: textBox5.size.height), transform: nil)
        let framesetter5 = CTFramesetterCreateWithAttributedString(attributedStr5)
        let frameRef5 = CTFramesetterCreateFrame(framesetter5, CFRange(location: 0, length: 0), textBoxPath5, nil)
        ctx.saveGState()
        ctx.translateBy(x: textBox5.origin.x, y: textBox5.origin.y)
        
        ctx.textMatrix = .identity
        ctx.translateBy(x: 0.0, y: textBox5.size.height)
        ctx.scaleBy(x: 1.0, y: -1.0)
        CTFrameDraw(frameRef5, ctx)
        
        ctx.restoreGState()
        
        /*  odoValues 5  */
        let attributedStr6 = NSMutableAttributedString(string: "\(odoValues[5])")
        let paragraphStyle6 = NSMutableParagraphStyle()
        paragraphStyle6.alignment = .center
        let textAttribs6 = [
            .font: UIFont(name: "Helvetica-Bold", size: 39)!,
            .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            .paragraphStyle: paragraphStyle6
            ] as [NSAttributedStringKey: Any]
        attributedStr6.setAttributes(textAttribs6, range: NSRange(location: 0, length: 1))
        
        let textBox6 = CGRect(x: 414.5, y: 456, width: 48, height: 48)
        let textBoxPath6 = CGPath(rect: CGRect(x: 0, y: 0, width: textBox6.size.width, height: textBox6.size.height), transform: nil)
        let framesetter6 = CTFramesetterCreateWithAttributedString(attributedStr6)
        let frameRef6 = CTFramesetterCreateFrame(framesetter6, CFRange(location: 0, length: 0), textBoxPath6, nil)
        ctx.saveGState()
        ctx.translateBy(x: textBox6.origin.x, y: textBox6.origin.y)
        
        ctx.textMatrix = .identity
        ctx.translateBy(x: 0.0, y: textBox6.size.height)
        ctx.scaleBy(x: 1.0, y: -1.0)
        CTFrameDraw(frameRef6, ctx)
        
        ctx.restoreGState()
        
        /*  odoLabel  */
        let attributedStr7 = NSMutableAttributedString(string: odoLabel)
        let paragraphStyle7 = NSMutableParagraphStyle()
        paragraphStyle7.alignment = .center
        let textAttribs7 = [
            .font: UIFont(name: "Helvetica-LightOblique", size: 18)!,
            .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            .paragraphStyle: paragraphStyle7
            ] as [NSAttributedStringKey: Any]
        attributedStr7.setAttributes(textAttribs7, range: NSRange(location: 0, length: odoLabel.count))

        let textBox7 = CGRect(x: 174.5, y: 512.833, width: 288, height: 29.899)
        let textBoxPath7 = CGPath(rect: CGRect(x: 0, y: 0, width: textBox7.size.width, height: textBox7.size.height), transform: nil)
        let framesetter7 = CTFramesetterCreateWithAttributedString(attributedStr7)
        let frameRef7 = CTFramesetterCreateFrame(framesetter7, CFRange(location: 0, length: 0), textBoxPath7, nil)
        ctx.saveGState()
        ctx.translateBy(x: textBox7.origin.x, y: textBox7.origin.y)
        
        ctx.textMatrix = .identity
        ctx.translateBy(x: 0.0, y: textBox7.size.height)
        ctx.scaleBy(x: 1.0, y: -1.0)
        CTFrameDraw(frameRef7, ctx)
        
        ctx.restoreGState()

    }
    

}
