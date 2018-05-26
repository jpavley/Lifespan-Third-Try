//
//  BiometerView.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 5/26/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

class BiometerView: CoreGraphicsView {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        drawFaceWithLabelsAndLogo()
        
    }
    
    private func drawFaceWithLabelsAndLogo() {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        // enable the following lines for flipped coordinate systems
        // ctx.translateBy(x: 0, y: self.bounds.size.height)
        // ctx.scaleBy(x: 1, y: -1)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        // let scaleFactor: CGFloat = 1
        // ctx.scaleBy(x: scaleFactor, y: scaleFactor)
        
        let scaleFactor: CGFloat = calcScaleFactor(viewWidth: self.bounds.width)
        ctx.scaleBy(x: scaleFactor, y: scaleFactor)
        
        /*  Frame  */
        /*  Shape   */
        let pathRef = CGMutablePath()
        pathRef.move(to: CGPoint(x: 320, y: 35.5))
        pathRef.addCurve(to: CGPoint(x: 604.5, y: 320), control1: CGPoint(x: 477.125, y: 35.5), control2: CGPoint(x: 604.5, y: 162.875))
        pathRef.addCurve(to: CGPoint(x: 566.518, y: 462.088), control1: CGPoint(x: 604.151, y: 368.604), control2: CGPoint(x: 591.924, y: 420.275))
        pathRef.addLine(to: CGPoint(x: 319.667, y: 320.333))
        pathRef.addLine(to: CGPoint(x: 73.554, y: 462.206))
        pathRef.addCurve(to: CGPoint(x: 35.5, y: 320), control1: CGPoint(x: 47.97, y: 419.39), control2: CGPoint(x: 36.127, y: 369.558))
        pathRef.addCurve(to: CGPoint(x: 320, y: 35.5), control1: CGPoint(x: 35.5, y: 162.875), control2: CGPoint(x: 162.875, y: 35.5))
        pathRef.closeSubpath()
        
        /*  Drop Shadow  */
        let shadowColor = CGColor(colorSpace: colorSpace, components: [0, 0, 0, 0.75])
        
        let shadowPath = CGMutablePath()
        shadowPath.move(to: CGPoint(x: -314.5, y: 30))
        shadowPath.addCurve(to: CGPoint(x: -24, y: 320.543), control1: CGPoint(x: -154.061, y: 30), control2: CGPoint(x: -24, y: 160.061))
        shadowPath.addCurve(to: CGPoint(x: -62.854, y: 465.703), control1: CGPoint(x: -24.374, y: 372.495), control2: CGPoint(x: -37.872, y: 424.588))
        shadowPath.addLine(to: CGPoint(x: -65.894, y: 470.706))
        shadowPath.addLine(to: CGPoint(x: -70.97, y: 467.791))
        shadowPath.addLine(to: CGPoint(x: -314.828, y: 327.755))
        shadowPath.addLine(to: CGPoint(x: -557.949, y: 467.904))
        shadowPath.addLine(to: CGPoint(x: -563.067, y: 470.854))
        shadowPath.addLine(to: CGPoint(x: -566.097, y: 465.784))
        shadowPath.addCurve(to: CGPoint(x: -605, y: 320.5), control1: CGPoint(x: -591.27, y: 423.654), control2: CGPoint(x: -604.331, y: 373.386))
        shadowPath.addCurve(to: CGPoint(x: -314.5, y: 30), control1: CGPoint(x: -605, y: 160.061), control2: CGPoint(x: -474.939, y: 30))
        shadowPath.closeSubpath()
        
        let clipPath = CGMutablePath()
        clipPath.move(to: CGPoint(x: 3, y: 1))
        clipPath.addLine(to: CGPoint(x: 638, y: 1))
        clipPath.addLine(to: CGPoint(x: 638, y: 499.854))
        clipPath.addLine(to: CGPoint(x: 3, y: 499.854))
        clipPath.closeSubpath()
        clipPath.move(to: CGPoint(x: 320.5, y: 30))
        clipPath.addCurve(to: CGPoint(x: 30, y: 320.5), control1: CGPoint(x: 160.061, y: 30), control2: CGPoint(x: 30, y: 160.061))
        clipPath.addCurve(to: CGPoint(x: 68.903, y: 465.784), control1: CGPoint(x: 30.669, y: 373.386), control2: CGPoint(x: 43.73, y: 423.654))
        clipPath.addLine(to: CGPoint(x: 71.933, y: 470.854))
        clipPath.addLine(to: CGPoint(x: 77.051, y: 467.904))
        clipPath.addLine(to: CGPoint(x: 320.172, y: 327.755))
        clipPath.addLine(to: CGPoint(x: 564.03, y: 467.791))
        clipPath.addLine(to: CGPoint(x: 569.106, y: 470.706))
        clipPath.addLine(to: CGPoint(x: 572.146, y: 465.703))
        clipPath.addCurve(to: CGPoint(x: 611, y: 320.543), control1: CGPoint(x: 597.128, y: 424.588), control2: CGPoint(x: 610.626, y: 372.495))
        clipPath.addCurve(to: CGPoint(x: 320.5, y: 30), control1: CGPoint(x: 611, y: 160.061), control2: CGPoint(x: 480.939, y: 30))
        clipPath.closeSubpath()
        
        ctx.saveGState()
        ctx.addPath(clipPath)
        ctx.clip()
        
        ctx.translateBy(x: 0, y: 2)
        ctx.setShadow(offset: CGSize(width: (635 * scaleFactor), height: 0), blur: (26 * scaleFactor), color: shadowColor)
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(shadowPath)
        ctx.fillPath()
        
        ctx.restoreGState()
        
        /*  Gradient Fill  */
        ctx.saveGState()
        ctx.addPath(pathRef)
        ctx.clip()
        
        let gradientColors: [CGFloat] = [
            1, 1, 1, 1,
            0.49, 0.49, 0.49, 1]
        let gradientLocations: [CGFloat] = [0, 0.991]
        
        guard let gradientRef = CGGradient(colorSpace: colorSpace, colorComponents: gradientColors, locations: gradientLocations, count: 2) else { return }
        ctx.drawLinearGradient(gradientRef, start: CGPoint(x: 119.328, y: 119.328), end: CGPoint(x: 521.672, y: 521.672), options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        ctx.restoreGState()
        
        ctx.setLineWidth(12)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef)
        ctx.strokePath()
        
        
        /*  Shape 2  */
        let pathRef2 = CGMutablePath()
        pathRef2.move(to: CGPoint(x: 320, y: 74))
        pathRef2.addCurve(to: CGPoint(x: 566, y: 320), control1: CGPoint(x: 455.862, y: 74), control2: CGPoint(x: 566, y: 184.138))
        pathRef2.addCurve(to: CGPoint(x: 533.126, y: 442.912), control1: CGPoint(x: 565.565, y: 362.458), control2: CGPoint(x: 555.339, y: 406.35))
        pathRef2.addLine(to: CGPoint(x: 319.667, y: 320.333))
        pathRef2.addLine(to: CGPoint(x: 106.913, y: 442.976))
        pathRef2.addCurve(to: CGPoint(x: 74, y: 320), control1: CGPoint(x: 84.786, y: 405.95), control2: CGPoint(x: 74.543, y: 362.858))
        pathRef2.addCurve(to: CGPoint(x: 320, y: 74), control1: CGPoint(x: 74, y: 184.138), control2: CGPoint(x: 184.138, y: 74))
        pathRef2.closeSubpath()
        
        ctx.setFillColor(red: 1, green: 1, blue: 1, alpha: 1)
        ctx.addPath(pathRef2)
        ctx.fillPath()
        
        ctx.setLineWidth(6)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef2)
        ctx.strokePath()
        
        /*  Inner Shadow  */
        let shadowColor2 = CGColor(colorSpace: colorSpace, components: [0, 0, 0, 0.75])
        
        let shadowPath2 = CGMutablePath()
        shadowPath2.move(to: CGPoint(x: -511.5, y: 41.5))
        shadowPath2.addLine(to: CGPoint(x: 42.5, y: 41.5))
        shadowPath2.addLine(to: CGPoint(x: 42.5, y: 477.55))
        shadowPath2.addLine(to: CGPoint(x: -511.5, y: 477.55))
        shadowPath2.closeSubpath()
        shadowPath2.move(to: CGPoint(x: -234.5, y: 71.5))
        shadowPath2.addLine(to: CGPoint(x: -242.36, y: 71.5))
        shadowPath2.addLine(to: CGPoint(x: -242.197, y: 71.646))
        shadowPath2.addCurve(to: CGPoint(x: -483.5, y: 320.5), control1: CGPoint(x: -377.925, y: 78.519), control2: CGPoint(x: -482.294, y: 183.563))
        shadowPath2.addCurve(to: CGPoint(x: -450.162, y: 445.015), control1: CGPoint(x: -482.926, y: 365.837), control2: CGPoint(x: -471.728, y: 408.929))
        shadowPath2.addLine(to: CGPoint(x: -448.647, y: 447.55))
        shadowPath2.addLine(to: CGPoint(x: -446.089, y: 446.075))
        shadowPath2.addLine(to: CGPoint(x: -234.831, y: 324.294))
        shadowPath2.addLine(to: CGPoint(x: -22.868, y: 446.014))
        shadowPath2.addLine(to: CGPoint(x: -20.33, y: 447.471))
        shadowPath2.addLine(to: CGPoint(x: -18.81, y: 444.97))
        shadowPath2.addCurve(to: CGPoint(x: 14.5, y: 320.531), control1: CGPoint(x: 2.727, y: 409.52), control2: CGPoint(x: 14.036, y: 365.752))
        shadowPath2.addCurve(to: CGPoint(x: -234.5, y: 71.5), control1: CGPoint(x: 14.5, y: 182.981), control2: CGPoint(x: -96.981, y: 71.5))
        shadowPath2.closeSubpath()
        
        let clipPath2 = CGMutablePath()
        clipPath2.move(to: CGPoint(x: 320.5, y: 71.5))
        clipPath2.addCurve(to: CGPoint(x: 569.5, y: 320.531), control1: CGPoint(x: 458.019, y: 71.5), control2: CGPoint(x: 569.5, y: 182.981))
        clipPath2.addCurve(to: CGPoint(x: 536.19, y: 444.97), control1: CGPoint(x: 569.036, y: 365.752), control2: CGPoint(x: 557.727, y: 409.52))
        clipPath2.addLine(to: CGPoint(x: 534.67, y: 447.471))
        clipPath2.addLine(to: CGPoint(x: 532.132, y: 446.014))
        clipPath2.addLine(to: CGPoint(x: 320.169, y: 324.294))
        clipPath2.addLine(to: CGPoint(x: 108.911, y: 446.075))
        clipPath2.addLine(to: CGPoint(x: 106.353, y: 447.55))
        clipPath2.addLine(to: CGPoint(x: 104.838, y: 445.015))
        clipPath2.addCurve(to: CGPoint(x: 71.5, y: 320.5), control1: CGPoint(x: 83.272, y: 408.929), control2: CGPoint(x: 72.074, y: 365.837))
        clipPath2.addCurve(to: CGPoint(x: 312.803, y: 71.646), control1: CGPoint(x: 72.706, y: 183.563), control2: CGPoint(x: 177.075, y: 78.519))
        clipPath2.addLine(to: CGPoint(x: 312.64, y: 71.5))
        clipPath2.addLine(to: CGPoint(x: 320.5, y: 71.5))
        clipPath2.closeSubpath()
        
        ctx.saveGState()
        ctx.addPath(clipPath2)
        ctx.clip()
        
        ctx.translateBy(x: 0, y: 2)
        ctx.setShadow(offset: CGSize(width: (555 * scaleFactor), height: 0), blur: (27 * scaleFactor), color: shadowColor2)
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(shadowPath2)
        ctx.fillPath()
        
        ctx.restoreGState()
        
        
        /*  Inside Face  */
        /*  Shape 3  */
        let pathRef3 = CGMutablePath()
        pathRef3.move(to: CGPoint(x: 320, y: 74))
        pathRef3.addLine(to: CGPoint(x: 320, y: 538.478))
        
        ctx.setLineWidth(4)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef3)
        ctx.strokePath()
        
        
        /*  Shape 4  */
        let pathRef4 = CGMutablePath()
        pathRef4.move(to: CGPoint(x: 74, y: 320))
        pathRef4.addLine(to: CGPoint(x: 566, y: 320))
        
        ctx.setLineWidth(4)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef4)
        ctx.strokePath()
        
        
        /*  Shape 5  */
        let pathRef5 = CGMutablePath()
        pathRef5.move(to: CGPoint(x: 443, y: 106.958))
        pathRef5.addLine(to: CGPoint(x: 213.422, y: 504.599))
        
        ctx.setLineWidth(4)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef5)
        ctx.strokePath()
        
        
        /*  Shape 6  */
        let pathRef6 = CGMutablePath()
        pathRef6.move(to: CGPoint(x: 106.958, y: 197))
        pathRef6.addLine(to: CGPoint(x: 533.042, y: 443))
        
        ctx.setLineWidth(4)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef6)
        ctx.strokePath()
        
        
        /*  Shape 7  */
        let pathRef7 = CGMutablePath()
        pathRef7.move(to: CGPoint(x: 533.042, y: 197))
        pathRef7.addLine(to: CGPoint(x: 106.958, y: 443))
        
        ctx.setLineWidth(4)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef7)
        ctx.strokePath()
        
        
        /*  Shape 8  */
        let pathRef8 = CGMutablePath()
        pathRef8.move(to: CGPoint(x: 197, y: 106.958))
        pathRef8.addLine(to: CGPoint(x: 428.502, y: 507.932))
        
        ctx.setLineWidth(4)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef8)
        ctx.strokePath()
        
        
        /*  Shape 9  */
        let pathRef9 = CGMutablePath()
        pathRef9.move(to: CGPoint(x: 345.714, y: 75.348))
        pathRef9.addLine(to: CGPoint(x: 297.037, y: 538.478))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef9)
        ctx.strokePath()
        
        
        /*  Shape 10  */
        let pathRef10 = CGMutablePath()
        pathRef10.move(to: CGPoint(x: 75.348, y: 294.286))
        pathRef10.addLine(to: CGPoint(x: 564.652, y: 345.714))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef10)
        ctx.strokePath()
        
        
        /*  Shape 11  */
        let pathRef11 = CGMutablePath()
        pathRef11.move(to: CGPoint(x: 371.146, y: 79.376))
        pathRef11.addLine(to: CGPoint(x: 274.742, y: 532.924))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef11)
        ctx.strokePath()
        
        
        /*  Shape 12  */
        let pathRef12 = CGMutablePath()
        pathRef12.move(to: CGPoint(x: 79.376, y: 268.854))
        pathRef12.addLine(to: CGPoint(x: 560.624, y: 371.146))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef12)
        ctx.strokePath()
        
        
        /*  Shape 13  */
        let pathRef13 = CGMutablePath()
        pathRef13.move(to: CGPoint(x: 396.018, y: 86.04))
        pathRef13.addLine(to: CGPoint(x: 253.034, y: 526.099))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef13)
        ctx.strokePath()
        
        
        /*  Shape 14  */
        let pathRef14 = CGMutablePath()
        pathRef14.move(to: CGPoint(x: 86.04, y: 243.982))
        pathRef14.addLine(to: CGPoint(x: 553.96, y: 396.018))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef14)
        ctx.strokePath()
        
        
        /*  Shape 15  */
        let pathRef15 = CGMutablePath()
        pathRef15.move(to: CGPoint(x: 420.057, y: 95.268))
        pathRef15.addLine(to: CGPoint(x: 232.366, y: 516.829))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef15)
        ctx.strokePath()
        
        
        /*  Shape 16  */
        let pathRef16 = CGMutablePath()
        pathRef16.move(to: CGPoint(x: 95.268, y: 219.943))
        pathRef16.addLine(to: CGPoint(x: 544.732, y: 420.057))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef16)
        ctx.strokePath()
        
        
        /*  Shape 17  */
        let pathRef17 = CGMutablePath()
        pathRef17.move(to: CGPoint(x: 294.286, y: 75.348))
        pathRef17.addLine(to: CGPoint(x: 342.961, y: 538.456))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef17)
        ctx.strokePath()
        
        
        /*  Shape 18  */
        let pathRef18 = CGMutablePath()
        pathRef18.move(to: CGPoint(x: 75.348, y: 345.714))
        pathRef18.addLine(to: CGPoint(x: 564.652, y: 294.286))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef18)
        ctx.strokePath()
        
        
        /*  Shape 19  */
        let pathRef19 = CGMutablePath()
        pathRef19.move(to: CGPoint(x: 268.854, y: 79.376))
        pathRef19.addLine(to: CGPoint(x: 365.382, y: 533.507))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef19)
        ctx.strokePath()
        
        
        /*  Shape 20  */
        let pathRef20 = CGMutablePath()
        pathRef20.move(to: CGPoint(x: 79.376, y: 371.146))
        pathRef20.addLine(to: CGPoint(x: 560.624, y: 268.854))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef20)
        ctx.strokePath()
        
        
        /*  Shape 21  */
        let pathRef21 = CGMutablePath()
        pathRef21.move(to: CGPoint(x: 243.982, y: 86.04))
        pathRef21.addLine(to: CGPoint(x: 387.016, y: 526.254))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef21)
        ctx.strokePath()
        
        
        /*  Shape 22  */
        let pathRef22 = CGMutablePath()
        pathRef22.move(to: CGPoint(x: 86.04, y: 396.018))
        pathRef22.addLine(to: CGPoint(x: 553.96, y: 243.982))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef22)
        ctx.strokePath()
        
        
        /*  Shape 23  */
        let pathRef23 = CGMutablePath()
        pathRef23.move(to: CGPoint(x: 219.943, y: 95.268))
        pathRef23.addLine(to: CGPoint(x: 408.549, y: 518.885))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef23)
        ctx.strokePath()
        
        
        /*  Shape 24  */
        let pathRef24 = CGMutablePath()
        pathRef24.move(to: CGPoint(x: 95.268, y: 420.057))
        pathRef24.addLine(to: CGPoint(x: 544.732, y: 219.943))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef24)
        ctx.strokePath()
        
        
        /*  Shape 25  */
        let pathRef25 = CGMutablePath()
        pathRef25.move(to: CGPoint(x: 464.595, y: 120.982))
        pathRef25.addLine(to: CGPoint(x: 193.024, y: 494.767))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef25)
        ctx.strokePath()
        
        
        /*  Shape 26  */
        let pathRef26 = CGMutablePath()
        pathRef26.move(to: CGPoint(x: 120.982, y: 175.405))
        pathRef26.addLine(to: CGPoint(x: 496.373, y: 448.143))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef26)
        ctx.strokePath()
        
        
        /*  Shape 27  */
        let pathRef27 = CGMutablePath()
        pathRef27.move(to: CGPoint(x: 484.606, y: 137.186))
        pathRef27.addLine(to: CGPoint(x: 177.411, y: 478.361))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef27)
        ctx.strokePath()
        
        
        /*  Shape 28  */
        let pathRef28 = CGMutablePath()
        pathRef28.move(to: CGPoint(x: 137.186, y: 155.394))
        pathRef28.addLine(to: CGPoint(x: 481.506, y: 465.421))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef28)
        ctx.strokePath()
        
        
        /*  Shape 29  */
        let pathRef29 = CGMutablePath()
        pathRef29.move(to: CGPoint(x: 502.814, y: 155.394))
        pathRef29.addLine(to: CGPoint(x: 162.518, y: 461.798))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef29)
        ctx.strokePath()
        
        
        /*  Shape 30  */
        let pathRef30 = CGMutablePath()
        pathRef30.move(to: CGPoint(x: 155.394, y: 137.186))
        pathRef30.addLine(to: CGPoint(x: 464.799, y: 480.816))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef30)
        ctx.strokePath()
        
        
        /*  Shape 31  */
        let pathRef31 = CGMutablePath()
        pathRef31.move(to: CGPoint(x: 519.018, y: 175.405))
        pathRef31.addLine(to: CGPoint(x: 144.34, y: 447.624))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef31)
        ctx.strokePath()
        
        
        /*  Shape 32  */
        let pathRef32 = CGMutablePath()
        pathRef32.move(to: CGPoint(x: 175.405, y: 120.982))
        pathRef32.addLine(to: CGPoint(x: 446.898, y: 494.66))
        
        ctx.setLineWidth(1)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef32)
        ctx.strokePath()
        
        
        /*  Shape 33  */
        let pathRef33 = CGMutablePath()
        pathRef33.move(to: CGPoint(x: 320, y: 544.732))
        pathRef33.addCurve(to: CGPoint(x: 95.268, y: 320), control1: CGPoint(x: 195.884, y: 544.732), control2: CGPoint(x: 95.268, y: 444.116))
        pathRef33.addCurve(to: CGPoint(x: 320, y: 95.268), control1: CGPoint(x: 95.268, y: 195.884), control2: CGPoint(x: 195.884, y: 95.268))
        pathRef33.addCurve(to: CGPoint(x: 544.732, y: 320), control1: CGPoint(x: 444.116, y: 95.268), control2: CGPoint(x: 544.732, y: 195.884))
        pathRef33.addCurve(to: CGPoint(x: 320, y: 544.732), control1: CGPoint(x: 544.732, y: 444.116), control2: CGPoint(x: 444.116, y: 544.732))
        pathRef33.closeSubpath()
        
        ctx.setFillColor(red: 1, green: 1, blue: 1, alpha: 1)
        ctx.addPath(pathRef33)
        ctx.fillPath()
        
        
        /*  Logo Shapes  */
        /*  Shape 34  */
        let pathRef34 = CGMutablePath()
        pathRef34.move(to: CGPoint(x: 262.758, y: 247.734))
        pathRef34.addLine(to: CGPoint(x: 263.484, y: 248.461))
        pathRef34.addQuadCurve(to: CGPoint(x: 260.121, y: 251.977), control: CGPoint(x: 261.562, y: 250.875))
        pathRef34.addQuadCurve(to: CGPoint(x: 258, y: 253.078), control: CGPoint(x: 258.68, y: 253.078))
        pathRef34.addQuadCurve(to: CGPoint(x: 257.438, y: 252.07), control: CGPoint(x: 257.438, y: 253.078))
        pathRef34.addQuadCurve(to: CGPoint(x: 260.742, y: 244.336), control: CGPoint(x: 257.438, y: 249.562))
        pathRef34.addQuadCurve(to: CGPoint(x: 263.531, y: 239.297), control: CGPoint(x: 263.531, y: 239.812))
        pathRef34.addQuadCurve(to: CGPoint(x: 263.156, y: 238.852), control: CGPoint(x: 263.531, y: 238.852))
        pathRef34.addQuadCurve(to: CGPoint(x: 259.852, y: 241.805), control: CGPoint(x: 262.5, y: 238.852))
        pathRef34.addQuadCurve(to: CGPoint(x: 253.312, y: 250.148), control: CGPoint(x: 257.203, y: 244.758))
        pathRef34.addQuadCurve(to: CGPoint(x: 247.266, y: 258.727), control: CGPoint(x: 248.906, y: 256.148))
        pathRef34.addQuadCurve(to: CGPoint(x: 252.387, y: 259.512), control: CGPoint(x: 250.383, y: 259.031))
        pathRef34.addQuadCurve(to: CGPoint(x: 258.199, y: 261.07), control: CGPoint(x: 254.391, y: 259.992))
        pathRef34.addQuadCurve(to: CGPoint(x: 263.812, y: 262.336), control: CGPoint(x: 262.008, y: 262.148))
        pathRef34.addQuadCurve(to: CGPoint(x: 260.777, y: 265.746), control: CGPoint(x: 261.609, y: 264.844))
        pathRef34.addQuadCurve(to: CGPoint(x: 259.5, y: 266.836), control: CGPoint(x: 259.945, y: 266.648))
        pathRef34.addQuadCurve(to: CGPoint(x: 257.414, y: 266.871), control: CGPoint(x: 258.797, y: 267.141))
        pathRef34.addQuadCurve(to: CGPoint(x: 253.031, y: 265.828), control: CGPoint(x: 256.031, y: 266.602))
        pathRef34.addQuadCurve(to: CGPoint(x: 247.418, y: 264.539), control: CGPoint(x: 250.031, y: 265.055))
        pathRef34.addQuadCurve(to: CGPoint(x: 242.648, y: 264.023), control: CGPoint(x: 244.805, y: 264.023))
        pathRef34.addQuadCurve(to: CGPoint(x: 240.551, y: 264.305), control: CGPoint(x: 241.43, y: 264.023))
        pathRef34.addQuadCurve(to: CGPoint(x: 238.113, y: 265.23), control: CGPoint(x: 239.672, y: 264.586))
        pathRef34.addQuadCurve(to: CGPoint(x: 235.922, y: 265.875), control: CGPoint(x: 236.555, y: 265.875))
        pathRef34.addQuadCurve(to: CGPoint(x: 235.008, y: 265.125), control: CGPoint(x: 235.008, y: 265.875))
        pathRef34.addQuadCurve(to: CGPoint(x: 235.312, y: 264.164), control: CGPoint(x: 235.008, y: 264.703))
        pathRef34.addQuadCurve(to: CGPoint(x: 236.812, y: 261.797), control: CGPoint(x: 236.086, y: 262.922))
        pathRef34.addQuadCurve(to: CGPoint(x: 238.359, y: 260.039), control: CGPoint(x: 237.539, y: 260.672))
        pathRef34.addQuadCurve(to: CGPoint(x: 240.727, y: 259.055), control: CGPoint(x: 239.18, y: 259.406))
        pathRef34.addQuadCurve(to: CGPoint(x: 244.805, y: 258.68), control: CGPoint(x: 242.273, y: 258.703))
        pathRef34.addQuadCurve(to: CGPoint(x: 251.93, y: 248.285), control: CGPoint(x: 248.625, y: 252.82))
        pathRef34.addQuadCurve(to: CGPoint(x: 257.941, y: 240.633), control: CGPoint(x: 255.234, y: 243.75))
        pathRef34.addQuadCurve(to: CGPoint(x: 262.688, y: 235.91), control: CGPoint(x: 260.648, y: 237.516))
        pathRef34.addQuadCurve(to: CGPoint(x: 265.922, y: 234.305), control: CGPoint(x: 264.727, y: 234.305))
        pathRef34.addQuadCurve(to: CGPoint(x: 267.234, y: 234.773), control: CGPoint(x: 266.766, y: 234.305))
        pathRef34.addQuadCurve(to: CGPoint(x: 267.703, y: 236.086), control: CGPoint(x: 267.703, y: 235.242))
        pathRef34.addQuadCurve(to: CGPoint(x: 262.758, y: 247.734), control: CGPoint(x: 267.703, y: 238.898))
        pathRef34.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef34)
        ctx.fillPath()
        
        
        /*  Shape 35  */
        let pathRef35 = CGMutablePath()
        pathRef35.move(to: CGPoint(x: 276.07, y: 247.641))
        pathRef35.addQuadCurve(to: CGPoint(x: 274.957, y: 247.195), control: CGPoint(x: 275.484, y: 247.641))
        pathRef35.addQuadCurve(to: CGPoint(x: 274.43, y: 246.07), control: CGPoint(x: 274.43, y: 246.75))
        pathRef35.addQuadCurve(to: CGPoint(x: 275.414, y: 243.773), control: CGPoint(x: 274.43, y: 245.039))
        pathRef35.addQuadCurve(to: CGPoint(x: 277.453, y: 242.508), control: CGPoint(x: 276.398, y: 242.508))
        pathRef35.addQuadCurve(to: CGPoint(x: 278.625, y: 242.941), control: CGPoint(x: 278.156, y: 242.508))
        pathRef35.addQuadCurve(to: CGPoint(x: 279.094, y: 244.195), control: CGPoint(x: 279.094, y: 243.375))
        pathRef35.addQuadCurve(to: CGPoint(x: 278.133, y: 246.422), control: CGPoint(x: 279.094, y: 245.203))
        pathRef35.addQuadCurve(to: CGPoint(x: 276.07, y: 247.641), control: CGPoint(x: 277.172, y: 247.641))
        pathRef35.closeSubpath()
        pathRef35.move(to: CGPoint(x: 277.664, y: 258.117))
        pathRef35.addLine(to: CGPoint(x: 277.664, y: 259.828))
        pathRef35.addQuadCurve(to: CGPoint(x: 273.422, y: 264.246), control: CGPoint(x: 275.391, y: 262.758))
        pathRef35.addQuadCurve(to: CGPoint(x: 270.07, y: 265.734), control: CGPoint(x: 271.453, y: 265.734))
        pathRef35.addQuadCurve(to: CGPoint(x: 267.211, y: 263.719), control: CGPoint(x: 268.148, y: 265.734))
        pathRef35.addQuadCurve(to: CGPoint(x: 266.273, y: 259.312), control: CGPoint(x: 266.273, y: 261.703))
        pathRef35.addQuadCurve(to: CGPoint(x: 266.461, y: 257.566), control: CGPoint(x: 266.273, y: 258.398))
        pathRef35.addQuadCurve(to: CGPoint(x: 266.906, y: 256.195), control: CGPoint(x: 266.648, y: 256.734))
        pathRef35.addQuadCurve(to: CGPoint(x: 267.867, y: 254.508), control: CGPoint(x: 267.164, y: 255.656))
        pathRef35.addQuadCurve(to: CGPoint(x: 273.961, y: 249.328), control: CGPoint(x: 271.195, y: 249.328))
        pathRef35.addQuadCurve(to: CGPoint(x: 275.391, y: 250.43), control: CGPoint(x: 275.391, y: 249.328))
        pathRef35.addQuadCurve(to: CGPoint(x: 274.465, y: 252.773), control: CGPoint(x: 275.391, y: 251.18))
        pathRef35.addQuadCurve(to: CGPoint(x: 272.812, y: 255.047), control: CGPoint(x: 273.539, y: 254.367))
        pathRef35.addQuadCurve(to: CGPoint(x: 270.152, y: 257.789), control: CGPoint(x: 270.773, y: 257.016))
        pathRef35.addQuadCurve(to: CGPoint(x: 269.531, y: 259.547), control: CGPoint(x: 269.531, y: 258.562))
        pathRef35.addQuadCurve(to: CGPoint(x: 270.164, y: 260.953), control: CGPoint(x: 269.531, y: 260.391))
        pathRef35.addQuadCurve(to: CGPoint(x: 271.805, y: 261.516), control: CGPoint(x: 270.797, y: 261.516))
        pathRef35.addQuadCurve(to: CGPoint(x: 274.23, y: 260.707), control: CGPoint(x: 272.906, y: 261.516))
        pathRef35.addQuadCurve(to: CGPoint(x: 277.664, y: 258.117), control: CGPoint(x: 275.555, y: 259.898))
        pathRef35.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef35)
        ctx.fillPath()
        
        
        /*  Shape 36  */
        let pathRef36 = CGMutablePath()
        pathRef36.move(to: CGPoint(x: 290.508, y: 258.117))
        pathRef36.addLine(to: CGPoint(x: 290.508, y: 259.734))
        pathRef36.addQuadCurve(to: CGPoint(x: 288.375, y: 261.773), control: CGPoint(x: 289.102, y: 261.141))
        pathRef36.addQuadCurve(to: CGPoint(x: 286.383, y: 263.062), control: CGPoint(x: 287.648, y: 262.406))
        pathRef36.addQuadCurve(to: CGPoint(x: 286.172, y: 266.695), control: CGPoint(x: 286.383, y: 265.195))
        pathRef36.addQuadCurve(to: CGPoint(x: 285.234, y: 269.848), control: CGPoint(x: 285.961, y: 268.195))
        pathRef36.addQuadCurve(to: CGPoint(x: 282.984, y: 273.469), control: CGPoint(x: 284.508, y: 271.5))
        pathRef36.addQuadCurve(to: CGPoint(x: 280.031, y: 276.457), control: CGPoint(x: 281.484, y: 275.414))
        pathRef36.addQuadCurve(to: CGPoint(x: 277.758, y: 277.5), control: CGPoint(x: 278.578, y: 277.5))
        pathRef36.addQuadCurve(to: CGPoint(x: 276.07, y: 276), control: CGPoint(x: 276.844, y: 277.5))
        pathRef36.addQuadCurve(to: CGPoint(x: 275.297, y: 272.273), control: CGPoint(x: 275.297, y: 274.5))
        pathRef36.addQuadCurve(to: CGPoint(x: 276.023, y: 267.773), control: CGPoint(x: 275.297, y: 270.141))
        pathRef36.addQuadCurve(to: CGPoint(x: 278.273, y: 261.656), control: CGPoint(x: 276.75, y: 265.406))
        pathRef36.addQuadCurve(to: CGPoint(x: 277.125, y: 258.68), control: CGPoint(x: 277.125, y: 260.156))
        pathRef36.addQuadCurve(to: CGPoint(x: 277.734, y: 256.852), control: CGPoint(x: 277.125, y: 257.484))
        pathRef36.addQuadCurve(to: CGPoint(x: 279.469, y: 255.703), control: CGPoint(x: 278.344, y: 256.219))
        pathRef36.addQuadCurve(to: CGPoint(x: 281.027, y: 253.512), control: CGPoint(x: 280.289, y: 254.414))
        pathRef36.addQuadCurve(to: CGPoint(x: 283.031, y: 251.109), control: CGPoint(x: 281.766, y: 252.609))
        pathRef36.addQuadCurve(to: CGPoint(x: 288.75, y: 239.391), control: CGPoint(x: 285.469, y: 245.109))
        pathRef36.addQuadCurve(to: CGPoint(x: 290.062, y: 237.246), control: CGPoint(x: 289.664, y: 237.797))
        pathRef36.addQuadCurve(to: CGPoint(x: 290.906, y: 236.695), control: CGPoint(x: 290.461, y: 236.695))
        pathRef36.addQuadCurve(to: CGPoint(x: 291.609, y: 237.281), control: CGPoint(x: 291.305, y: 236.695))
        pathRef36.addQuadCurve(to: CGPoint(x: 291.914, y: 238.805), control: CGPoint(x: 291.914, y: 237.867))
        pathRef36.addQuadCurve(to: CGPoint(x: 291.668, y: 240.914), control: CGPoint(x: 291.914, y: 239.953))
        pathRef36.addQuadCurve(to: CGPoint(x: 290.965, y: 242.848), control: CGPoint(x: 291.422, y: 241.875))
        pathRef36.addQuadCurve(to: CGPoint(x: 289.699, y: 245.18), control: CGPoint(x: 290.508, y: 243.82))
        pathRef36.addQuadCurve(to: CGPoint(x: 288.703, y: 246.867), control: CGPoint(x: 288.891, y: 246.539))
        pathRef36.addQuadCurve(to: CGPoint(x: 286.055, y: 251.438), control: CGPoint(x: 287.531, y: 248.93))
        pathRef36.addQuadCurve(to: CGPoint(x: 283.723, y: 255.398), control: CGPoint(x: 284.578, y: 253.945))
        pathRef36.addQuadCurve(to: CGPoint(x: 282.492, y: 257.578), control: CGPoint(x: 282.867, y: 256.852))
        pathRef36.addQuadCurve(to: CGPoint(x: 284.496, y: 259.477), control: CGPoint(x: 283.758, y: 258.68))
        pathRef36.addQuadCurve(to: CGPoint(x: 285.773, y: 261.375), control: CGPoint(x: 285.234, y: 260.273))
        pathRef36.addQuadCurve(to: CGPoint(x: 287.227, y: 260.648), control: CGPoint(x: 286.57, y: 261.07))
        pathRef36.addQuadCurve(to: CGPoint(x: 288.773, y: 259.488), control: CGPoint(x: 287.883, y: 260.227))
        pathRef36.addQuadCurve(to: CGPoint(x: 290.508, y: 258.117), control: CGPoint(x: 289.664, y: 258.75))
        pathRef36.closeSubpath()
        pathRef36.move(to: CGPoint(x: 283.5, y: 264.398))
        pathRef36.addLine(to: CGPoint(x: 283.453, y: 263.906))
        pathRef36.addQuadCurve(to: CGPoint(x: 282.398, y: 263.941), control: CGPoint(x: 282.797, y: 263.977))
        pathRef36.addQuadCurve(to: CGPoint(x: 281.473, y: 263.742), control: CGPoint(x: 282, y: 263.906))
        pathRef36.addQuadCurve(to: CGPoint(x: 280.652, y: 263.438), control: CGPoint(x: 280.945, y: 263.578))
        pathRef36.addQuadCurve(to: CGPoint(x: 280.008, y: 263.156), control: CGPoint(x: 280.359, y: 263.297))
        pathRef36.addQuadCurve(to: CGPoint(x: 278.227, y: 270.398), control: CGPoint(x: 278.227, y: 267.516))
        pathRef36.addQuadCurve(to: CGPoint(x: 278.66, y: 272.836), control: CGPoint(x: 278.227, y: 271.828))
        pathRef36.addQuadCurve(to: CGPoint(x: 279.68, y: 273.844), control: CGPoint(x: 279.094, y: 273.844))
        pathRef36.addQuadCurve(to: CGPoint(x: 281.215, y: 272.766), control: CGPoint(x: 280.289, y: 273.844))
        pathRef36.addQuadCurve(to: CGPoint(x: 282.82, y: 269.578), control: CGPoint(x: 282.141, y: 271.688))
        pathRef36.addQuadCurve(to: CGPoint(x: 283.5, y: 264.398), control: CGPoint(x: 283.5, y: 267.469))
        pathRef36.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef36)
        ctx.fillPath()
        
        
        /*  Shape 37  */
        let pathRef37 = CGMutablePath()
        pathRef37.move(to: CGPoint(x: 293.578, y: 258.961))
        pathRef37.addLine(to: CGPoint(x: 293.578, y: 259.547))
        pathRef37.addQuadCurve(to: CGPoint(x: 294.258, y: 261.703), control: CGPoint(x: 293.578, y: 260.93))
        pathRef37.addQuadCurve(to: CGPoint(x: 296.039, y: 262.477), control: CGPoint(x: 294.938, y: 262.477))
        pathRef37.addQuadCurve(to: CGPoint(x: 298.418, y: 261.938), control: CGPoint(x: 297.188, y: 262.477))
        pathRef37.addQuadCurve(to: CGPoint(x: 300.867, y: 260.508), control: CGPoint(x: 299.648, y: 261.398))
        pathRef37.addQuadCurve(to: CGPoint(x: 303.844, y: 258.117), control: CGPoint(x: 302.086, y: 259.617))
        pathRef37.addLine(to: CGPoint(x: 303.844, y: 259.547))
        pathRef37.addQuadCurve(to: CGPoint(x: 298.875, y: 264.434), control: CGPoint(x: 301.195, y: 262.734))
        pathRef37.addQuadCurve(to: CGPoint(x: 294.164, y: 266.133), control: CGPoint(x: 296.555, y: 266.133))
        pathRef37.addQuadCurve(to: CGPoint(x: 290.859, y: 264.516), control: CGPoint(x: 292.078, y: 266.133))
        pathRef37.addQuadCurve(to: CGPoint(x: 289.641, y: 260.086), control: CGPoint(x: 289.641, y: 262.898))
        pathRef37.addQuadCurve(to: CGPoint(x: 290.789, y: 255.621), control: CGPoint(x: 289.641, y: 257.625))
        pathRef37.addQuadCurve(to: CGPoint(x: 294.539, y: 251.391), control: CGPoint(x: 291.938, y: 253.617))
        pathRef37.addQuadCurve(to: CGPoint(x: 298.078, y: 249.094), control: CGPoint(x: 296.32, y: 249.867))
        pathRef37.addQuadCurve(to: CGPoint(x: 301.219, y: 248.32), control: CGPoint(x: 299.836, y: 248.32))
        pathRef37.addQuadCurve(to: CGPoint(x: 302.965, y: 248.824), control: CGPoint(x: 302.32, y: 248.32))
        pathRef37.addQuadCurve(to: CGPoint(x: 303.609, y: 250.336), control: CGPoint(x: 303.609, y: 249.328))
        pathRef37.addQuadCurve(to: CGPoint(x: 302.508, y: 253.277), control: CGPoint(x: 303.609, y: 251.812))
        pathRef37.addQuadCurve(to: CGPoint(x: 299.145, y: 256.184), control: CGPoint(x: 301.406, y: 254.742))
        pathRef37.addQuadCurve(to: CGPoint(x: 293.578, y: 258.961), control: CGPoint(x: 296.883, y: 257.625))
        pathRef37.closeSubpath()
        pathRef37.move(to: CGPoint(x: 293.812, y: 257.438))
        pathRef37.addQuadCurve(to: CGPoint(x: 297.422, y: 255.398), control: CGPoint(x: 295.922, y: 256.617))
        pathRef37.addQuadCurve(to: CGPoint(x: 299.637, y: 253.066), control: CGPoint(x: 298.922, y: 254.18))
        pathRef37.addQuadCurve(to: CGPoint(x: 300.352, y: 251.438), control: CGPoint(x: 300.352, y: 251.953))
        pathRef37.addQuadCurve(to: CGPoint(x: 299.859, y: 250.898), control: CGPoint(x: 300.352, y: 250.898))
        pathRef37.addQuadCurve(to: CGPoint(x: 298.488, y: 251.438), control: CGPoint(x: 299.438, y: 250.898))
        pathRef37.addQuadCurve(to: CGPoint(x: 296.566, y: 252.844), control: CGPoint(x: 297.539, y: 251.977))
        pathRef37.addQuadCurve(to: CGPoint(x: 294.82, y: 254.883), control: CGPoint(x: 295.594, y: 253.711))
        pathRef37.addQuadCurve(to: CGPoint(x: 293.812, y: 257.438), control: CGPoint(x: 294.047, y: 256.055))
        pathRef37.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef37)
        ctx.fillPath()
        
        
        /*  Shape 38  */
        let pathRef38 = CGMutablePath()
        pathRef38.move(to: CGPoint(x: 341.578, y: 258.727))
        pathRef38.addQuadCurve(to: CGPoint(x: 339.82, y: 256.781), control: CGPoint(x: 340.992, y: 257.648))
        pathRef38.addQuadCurve(to: CGPoint(x: 337.184, y: 255.387), control: CGPoint(x: 338.648, y: 255.914))
        pathRef38.addQuadCurve(to: CGPoint(x: 334.125, y: 254.602), control: CGPoint(x: 335.719, y: 254.859))
        pathRef38.addQuadCurve(to: CGPoint(x: 325.289, y: 251.531), control: CGPoint(x: 329.391, y: 253.898))
        pathRef38.addQuadCurve(to: CGPoint(x: 324.539, y: 250.734), control: CGPoint(x: 324.938, y: 251.344))
        pathRef38.addQuadCurve(to: CGPoint(x: 324.141, y: 249.562), control: CGPoint(x: 324.141, y: 250.125))
        pathRef38.addQuadCurve(to: CGPoint(x: 324.832, y: 245.426), control: CGPoint(x: 324.141, y: 247.5))
        pathRef38.addQuadCurve(to: CGPoint(x: 326.602, y: 242.18), control: CGPoint(x: 325.523, y: 243.352))
        pathRef38.addQuadCurve(to: CGPoint(x: 332.848, y: 238.781), control: CGPoint(x: 328.336, y: 240.234))
        pathRef38.addQuadCurve(to: CGPoint(x: 343.008, y: 237.328), control: CGPoint(x: 337.359, y: 237.328))
        pathRef38.addQuadCurve(to: CGPoint(x: 348.223, y: 237.844), control: CGPoint(x: 346.383, y: 237.328))
        pathRef38.addQuadCurve(to: CGPoint(x: 350.062, y: 239.438), control: CGPoint(x: 350.062, y: 238.359))
        pathRef38.addQuadCurve(to: CGPoint(x: 349.582, y: 242.156), control: CGPoint(x: 350.062, y: 241.195))
        pathRef38.addQuadCurve(to: CGPoint(x: 348.551, y: 243.434), control: CGPoint(x: 349.102, y: 243.117))
        pathRef38.addQuadCurve(to: CGPoint(x: 346.617, y: 244.289), control: CGPoint(x: 348, y: 243.75))
        pathRef38.addQuadCurve(to: CGPoint(x: 344.051, y: 245.367), control: CGPoint(x: 345.141, y: 244.805))
        pathRef38.addQuadCurve(to: CGPoint(x: 342.188, y: 246.445), control: CGPoint(x: 342.961, y: 245.93))
        pathRef38.addQuadCurve(to: CGPoint(x: 341.227, y: 246.961), control: CGPoint(x: 341.414, y: 246.961))
        pathRef38.addQuadCurve(to: CGPoint(x: 340.992, y: 246.773), control: CGPoint(x: 340.992, y: 246.961))
        pathRef38.addQuadCurve(to: CGPoint(x: 341.824, y: 245.566), control: CGPoint(x: 340.992, y: 246.375))
        pathRef38.addQuadCurve(to: CGPoint(x: 343.875, y: 244.148), control: CGPoint(x: 342.656, y: 244.758))
        pathRef38.addQuadCurve(to: CGPoint(x: 345.164, y: 243.281), control: CGPoint(x: 345.164, y: 243.469))
        pathRef38.addQuadCurve(to: CGPoint(x: 343.734, y: 242.977), control: CGPoint(x: 345.164, y: 242.977))
        pathRef38.addQuadCurve(to: CGPoint(x: 335.719, y: 243.75), control: CGPoint(x: 339.398, y: 242.977))
        pathRef38.addQuadCurve(to: CGPoint(x: 329.918, y: 245.789), control: CGPoint(x: 332.039, y: 244.523))
        pathRef38.addQuadCurve(to: CGPoint(x: 327.797, y: 248.367), control: CGPoint(x: 327.797, y: 247.055))
        pathRef38.addQuadCurve(to: CGPoint(x: 328.676, y: 249.527), control: CGPoint(x: 327.797, y: 249.188))
        pathRef38.addQuadCurve(to: CGPoint(x: 332.555, y: 250.664), control: CGPoint(x: 329.555, y: 249.867))
        pathRef38.addQuadCurve(to: CGPoint(x: 337.922, y: 252.492), control: CGPoint(x: 335.555, y: 251.461))
        pathRef38.addQuadCurve(to: CGPoint(x: 342.961, y: 255.516), control: CGPoint(x: 341.32, y: 253.945))
        pathRef38.addQuadCurve(to: CGPoint(x: 344.602, y: 259.031), control: CGPoint(x: 344.602, y: 257.086))
        pathRef38.addQuadCurve(to: CGPoint(x: 343.957, y: 261.715), control: CGPoint(x: 344.602, y: 260.367))
        pathRef38.addQuadCurve(to: CGPoint(x: 342.07, y: 264.188), control: CGPoint(x: 343.312, y: 263.062))
        pathRef38.addQuadCurve(to: CGPoint(x: 339.211, y: 266.039), control: CGPoint(x: 340.828, y: 265.312))
        pathRef38.addQuadCurve(to: CGPoint(x: 335.73, y: 267.141), control: CGPoint(x: 337.828, y: 266.625))
        pathRef38.addQuadCurve(to: CGPoint(x: 331.184, y: 267.949), control: CGPoint(x: 333.633, y: 267.656))
        pathRef38.addQuadCurve(to: CGPoint(x: 326.508, y: 268.242), control: CGPoint(x: 328.734, y: 268.242))
        pathRef38.addQuadCurve(to: CGPoint(x: 319.91, y: 267.469), control: CGPoint(x: 322.406, y: 268.242))
        pathRef38.addQuadCurve(to: CGPoint(x: 317.414, y: 265.125), control: CGPoint(x: 317.414, y: 266.695))
        pathRef38.addQuadCurve(to: CGPoint(x: 318.258, y: 262.934), control: CGPoint(x: 317.414, y: 264.422))
        pathRef38.addQuadCurve(to: CGPoint(x: 320.25, y: 260.93), control: CGPoint(x: 319.102, y: 261.445))
        pathRef38.addQuadCurve(to: CGPoint(x: 322.195, y: 260.473), control: CGPoint(x: 321.258, y: 260.531))
        pathRef38.addQuadCurve(to: CGPoint(x: 323.133, y: 260.695), control: CGPoint(x: 323.133, y: 260.414))
        pathRef38.addQuadCurve(to: CGPoint(x: 323.062, y: 260.836), control: CGPoint(x: 323.133, y: 260.766))
        pathRef38.addQuadCurve(to: CGPoint(x: 322.898, y: 260.953), control: CGPoint(x: 322.992, y: 260.906))
        pathRef38.addQuadCurve(to: CGPoint(x: 322.711, y: 261.047), control: CGPoint(x: 322.805, y: 261))
        pathRef38.addQuadCurve(to: CGPoint(x: 321.949, y: 261.34), control: CGPoint(x: 322.242, y: 261.234))
        pathRef38.addQuadCurve(to: CGPoint(x: 321.48, y: 261.551), control: CGPoint(x: 321.656, y: 261.445))
        pathRef38.addQuadCurve(to: CGPoint(x: 321.305, y: 261.844), control: CGPoint(x: 321.305, y: 261.656))
        pathRef38.addQuadCurve(to: CGPoint(x: 326.156, y: 262.336), control: CGPoint(x: 321.305, y: 262.336))
        pathRef38.addQuadCurve(to: CGPoint(x: 333.07, y: 262.031), control: CGPoint(x: 330.375, y: 262.336))
        pathRef38.addQuadCurve(to: CGPoint(x: 337.828, y: 260.93), control: CGPoint(x: 335.766, y: 261.727))
        pathRef38.addQuadCurve(to: CGPoint(x: 341.578, y: 258.727), control: CGPoint(x: 339.891, y: 260.133))
        pathRef38.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef38)
        ctx.fillPath()
        
        
        /*  Shape 39  */
        let pathRef39 = CGMutablePath()
        pathRef39.move(to: CGPoint(x: 348.047, y: 260.086))
        pathRef39.addLine(to: CGPoint(x: 348.047, y: 258.445))
        pathRef39.addQuadCurve(to: CGPoint(x: 353.707, y: 251.742), control: CGPoint(x: 351.328, y: 254.883))
        pathRef39.addQuadCurve(to: CGPoint(x: 357.469, y: 246.75), control: CGPoint(x: 356.086, y: 248.602))
        pathRef39.addQuadCurve(to: CGPoint(x: 359.906, y: 244.137), control: CGPoint(x: 358.852, y: 244.898))
        pathRef39.addQuadCurve(to: CGPoint(x: 362.555, y: 243.375), control: CGPoint(x: 360.961, y: 243.375))
        pathRef39.addQuadCurve(to: CGPoint(x: 363.352, y: 243.984), control: CGPoint(x: 363.352, y: 243.375))
        pathRef39.addQuadCurve(to: CGPoint(x: 362.707, y: 245.438), control: CGPoint(x: 363.352, y: 244.477))
        pathRef39.addQuadCurve(to: CGPoint(x: 361.055, y: 247.406), control: CGPoint(x: 362.062, y: 246.398))
        pathRef39.addQuadCurve(to: CGPoint(x: 358.441, y: 250.699), control: CGPoint(x: 359.719, y: 248.719))
        pathRef39.addQuadCurve(to: CGPoint(x: 355.547, y: 255.75), control: CGPoint(x: 357.164, y: 252.68))
        pathRef39.addQuadCurve(to: CGPoint(x: 358.465, y: 253.418), control: CGPoint(x: 356.812, y: 254.766))
        pathRef39.addQuadCurve(to: CGPoint(x: 361.16, y: 251.309), control: CGPoint(x: 360.117, y: 252.07))
        pathRef39.addQuadCurve(to: CGPoint(x: 363.223, y: 250.102), control: CGPoint(x: 362.203, y: 250.547))
        pathRef39.addQuadCurve(to: CGPoint(x: 365.273, y: 249.656), control: CGPoint(x: 364.242, y: 249.656))
        pathRef39.addQuadCurve(to: CGPoint(x: 366.129, y: 249.891), control: CGPoint(x: 365.93, y: 249.656))
        pathRef39.addQuadCurve(to: CGPoint(x: 366.328, y: 250.805), control: CGPoint(x: 366.328, y: 250.125))
        pathRef39.addQuadCurve(to: CGPoint(x: 365.461, y: 254.285), control: CGPoint(x: 366.328, y: 252.586))
        pathRef39.addQuadCurve(to: CGPoint(x: 362.977, y: 257.812), control: CGPoint(x: 364.594, y: 255.984))
        pathRef39.addQuadCurve(to: CGPoint(x: 358.992, y: 261.797), control: CGPoint(x: 361.359, y: 259.641))
        pathRef39.addQuadCurve(to: CGPoint(x: 360.68, y: 262.102), control: CGPoint(x: 359.812, y: 262.102))
        pathRef39.addQuadCurve(to: CGPoint(x: 367.969, y: 257.953), control: CGPoint(x: 363.398, y: 262.102))
        pathRef39.addLine(to: CGPoint(x: 367.969, y: 259.641))
        pathRef39.addQuadCurve(to: CGPoint(x: 364.488, y: 262.641), control: CGPoint(x: 366.188, y: 261.234))
        pathRef39.addQuadCurve(to: CGPoint(x: 361.289, y: 264.891), control: CGPoint(x: 362.789, y: 264.047))
        pathRef39.addQuadCurve(to: CGPoint(x: 358.523, y: 265.734), control: CGPoint(x: 359.789, y: 265.734))
        pathRef39.addQuadCurve(to: CGPoint(x: 357.527, y: 265.629), control: CGPoint(x: 358.055, y: 265.734))
        pathRef39.addQuadCurve(to: CGPoint(x: 356.555, y: 265.371), control: CGPoint(x: 357, y: 265.523))
        pathRef39.addQuadCurve(to: CGPoint(x: 355.406, y: 264.938), control: CGPoint(x: 356.109, y: 265.219))
        pathRef39.addQuadCurve(to: CGPoint(x: 354.328, y: 264.539), control: CGPoint(x: 354.703, y: 264.656))
        pathRef39.addQuadCurve(to: CGPoint(x: 353.484, y: 264.727), control: CGPoint(x: 353.578, y: 264.727))
        pathRef39.addQuadCurve(to: CGPoint(x: 351.562, y: 264.07), control: CGPoint(x: 352.664, y: 264.727))
        pathRef39.addQuadCurve(to: CGPoint(x: 349.863, y: 267.949), control: CGPoint(x: 350.789, y: 265.57))
        pathRef39.addQuadCurve(to: CGPoint(x: 348.305, y: 271.734), control: CGPoint(x: 348.938, y: 270.328))
        pathRef39.addQuadCurve(to: CGPoint(x: 346.617, y: 274.43), control: CGPoint(x: 347.672, y: 273.141))
        pathRef39.addQuadCurve(to: CGPoint(x: 345.797, y: 275.016), control: CGPoint(x: 346.031, y: 275.016))
        pathRef39.addQuadCurve(to: CGPoint(x: 344.789, y: 273.234), control: CGPoint(x: 344.789, y: 275.016))
        pathRef39.addQuadCurve(to: CGPoint(x: 345.41, y: 270.012), control: CGPoint(x: 344.789, y: 271.688))
        pathRef39.addQuadCurve(to: CGPoint(x: 346.934, y: 266.836), control: CGPoint(x: 346.031, y: 268.336))
        pathRef39.addQuadCurve(to: CGPoint(x: 348.914, y: 263.801), control: CGPoint(x: 347.836, y: 265.336))
        pathRef39.addQuadCurve(to: CGPoint(x: 350.438, y: 261.516), control: CGPoint(x: 349.992, y: 262.266))
        pathRef39.addQuadCurve(to: CGPoint(x: 356.203, y: 250.664), control: CGPoint(x: 354.141, y: 255.141))
        pathRef39.addQuadCurve(to: CGPoint(x: 348.047, y: 260.086), control: CGPoint(x: 350.812, y: 257.227))
        pathRef39.closeSubpath()
        pathRef39.move(to: CGPoint(x: 357.562, y: 261.234))
        pathRef39.addQuadCurve(to: CGPoint(x: 361.02, y: 257.086), control: CGPoint(x: 359.883, y: 258.797))
        pathRef39.addQuadCurve(to: CGPoint(x: 362.156, y: 254.461), control: CGPoint(x: 362.156, y: 255.375))
        pathRef39.addQuadCurve(to: CGPoint(x: 361.289, y: 253.594), control: CGPoint(x: 362.156, y: 253.594))
        pathRef39.addQuadCurve(to: CGPoint(x: 357.996, y: 255.527), control: CGPoint(x: 360.117, y: 253.594))
        pathRef39.addQuadCurve(to: CGPoint(x: 353.625, y: 260.742), control: CGPoint(x: 355.875, y: 257.461))
        pathRef39.addQuadCurve(to: CGPoint(x: 355.945, y: 260.613), control: CGPoint(x: 355.359, y: 260.555))
        pathRef39.addQuadCurve(to: CGPoint(x: 357.562, y: 261.234), control: CGPoint(x: 356.531, y: 260.672))
        pathRef39.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef39)
        ctx.fillPath()
        
        
        /*  Shape 40  */
        let pathRef40 = CGMutablePath()
        pathRef40.move(to: CGPoint(x: 370.547, y: 253.922))
        pathRef40.addQuadCurve(to: CGPoint(x: 377.461, y: 249.117), control: CGPoint(x: 374.109, y: 250.688))
        pathRef40.addQuadCurve(to: CGPoint(x: 382.641, y: 247.547), control: CGPoint(x: 380.812, y: 247.547))
        pathRef40.addQuadCurve(to: CGPoint(x: 383.555, y: 247.957), control: CGPoint(x: 383.133, y: 247.547))
        pathRef40.addQuadCurve(to: CGPoint(x: 384.223, y: 248.906), control: CGPoint(x: 383.977, y: 248.367))
        pathRef40.addQuadCurve(to: CGPoint(x: 384.469, y: 249.703), control: CGPoint(x: 384.469, y: 249.445))
        pathRef40.addQuadCurve(to: CGPoint(x: 384.141, y: 250.324), control: CGPoint(x: 384.469, y: 250.125))
        pathRef40.addQuadCurve(to: CGPoint(x: 382.992, y: 250.805), control: CGPoint(x: 383.812, y: 250.523))
        pathRef40.addQuadCurve(to: CGPoint(x: 383.414, y: 251.766), control: CGPoint(x: 383.156, y: 251.18))
        pathRef40.addQuadCurve(to: CGPoint(x: 383.812, y: 252.715), control: CGPoint(x: 383.672, y: 252.352))
        pathRef40.addQuadCurve(to: CGPoint(x: 383.953, y: 253.359), control: CGPoint(x: 383.953, y: 253.078))
        pathRef40.addQuadCurve(to: CGPoint(x: 382.816, y: 255.457), control: CGPoint(x: 383.953, y: 253.922))
        pathRef40.addQuadCurve(to: CGPoint(x: 381.223, y: 257.719), control: CGPoint(x: 381.68, y: 256.992))
        pathRef40.addQuadCurve(to: CGPoint(x: 380.766, y: 259.5), control: CGPoint(x: 380.766, y: 258.445))
        pathRef40.addQuadCurve(to: CGPoint(x: 382.359, y: 261.234), control: CGPoint(x: 380.766, y: 261.234))
        pathRef40.addQuadCurve(to: CGPoint(x: 387.492, y: 258.164), control: CGPoint(x: 384, y: 261.234))
        pathRef40.addLine(to: CGPoint(x: 387.492, y: 259.594))
        pathRef40.addQuadCurve(to: CGPoint(x: 379.008, y: 266.18), control: CGPoint(x: 381.562, y: 266.18))
        pathRef40.addQuadCurve(to: CGPoint(x: 377.707, y: 265.582), control: CGPoint(x: 378.094, y: 266.18))
        pathRef40.addQuadCurve(to: CGPoint(x: 377.32, y: 263.812), control: CGPoint(x: 377.32, y: 264.984))
        pathRef40.addQuadCurve(to: CGPoint(x: 378.656, y: 258.445), control: CGPoint(x: 377.32, y: 261.961))
        pathRef40.addQuadCurve(to: CGPoint(x: 373.57, y: 263.848), control: CGPoint(x: 375.234, y: 262.242))
        pathRef40.addQuadCurve(to: CGPoint(x: 370.828, y: 265.453), control: CGPoint(x: 371.906, y: 265.453))
        pathRef40.addQuadCurve(to: CGPoint(x: 369.539, y: 264.562), control: CGPoint(x: 370.312, y: 265.453))
        pathRef40.addQuadCurve(to: CGPoint(x: 368.168, y: 262.254), control: CGPoint(x: 368.766, y: 263.672))
        pathRef40.addQuadCurve(to: CGPoint(x: 367.57, y: 259.312), control: CGPoint(x: 367.57, y: 260.836))
        pathRef40.addQuadCurve(to: CGPoint(x: 367.781, y: 257.473), control: CGPoint(x: 367.57, y: 258.211))
        pathRef40.addQuadCurve(to: CGPoint(x: 368.602, y: 255.961), control: CGPoint(x: 367.992, y: 256.734))
        pathRef40.addQuadCurve(to: CGPoint(x: 370.547, y: 253.922), control: CGPoint(x: 369.211, y: 255.188))
        pathRef40.closeSubpath()
        pathRef40.move(to: CGPoint(x: 381.773, y: 251.344))
        pathRef40.addQuadCurve(to: CGPoint(x: 373.09, y: 256.078), control: CGPoint(x: 375.68, y: 254.133))
        pathRef40.addQuadCurve(to: CGPoint(x: 370.5, y: 260.086), control: CGPoint(x: 370.5, y: 258.023))
        pathRef40.addQuadCurve(to: CGPoint(x: 370.758, y: 261.316), control: CGPoint(x: 370.5, y: 260.836))
        pathRef40.addQuadCurve(to: CGPoint(x: 371.461, y: 261.797), control: CGPoint(x: 371.016, y: 261.797))
        pathRef40.addQuadCurve(to: CGPoint(x: 372.375, y: 261.469), control: CGPoint(x: 371.719, y: 261.797))
        pathRef40.addQuadCurve(to: CGPoint(x: 376.875, y: 257.684), control: CGPoint(x: 374.836, y: 260.016))
        pathRef40.addQuadCurve(to: CGPoint(x: 381.773, y: 251.344), control: CGPoint(x: 378.914, y: 255.352))
        pathRef40.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef40)
        ctx.fillPath()
        
        
        /*  Shape 41  */
        let pathRef41 = CGMutablePath()
        pathRef41.move(to: CGPoint(x: 403.078, y: 253.875))
        pathRef41.addQuadCurve(to: CGPoint(x: 398.953, y: 260.273), control: CGPoint(x: 398.953, y: 258.469))
        pathRef41.addQuadCurve(to: CGPoint(x: 399.773, y: 261.281), control: CGPoint(x: 398.953, y: 261.281))
        pathRef41.addQuadCurve(to: CGPoint(x: 401.543, y: 260.566), control: CGPoint(x: 400.453, y: 261.281))
        pathRef41.addQuadCurve(to: CGPoint(x: 404.953, y: 258.023), control: CGPoint(x: 402.633, y: 259.852))
        pathRef41.addLine(to: CGPoint(x: 404.953, y: 259.641))
        pathRef41.addQuadCurve(to: CGPoint(x: 399.844, y: 264.375), control: CGPoint(x: 401.625, y: 262.922))
        pathRef41.addQuadCurve(to: CGPoint(x: 396.938, y: 265.828), control: CGPoint(x: 398.062, y: 265.828))
        pathRef41.addQuadCurve(to: CGPoint(x: 395.016, y: 263.297), control: CGPoint(x: 395.016, y: 265.828))
        pathRef41.addQuadCurve(to: CGPoint(x: 395.25, y: 261.82), control: CGPoint(x: 395.016, y: 262.547))
        pathRef41.addQuadCurve(to: CGPoint(x: 395.895, y: 260.309), control: CGPoint(x: 395.484, y: 261.094))
        pathRef41.addQuadCurve(to: CGPoint(x: 397.148, y: 258.059), control: CGPoint(x: 396.305, y: 259.523))
        pathRef41.addQuadCurve(to: CGPoint(x: 399.094, y: 254.742), control: CGPoint(x: 397.992, y: 256.594))
        pathRef41.addQuadCurve(to: CGPoint(x: 395.742, y: 257.438), control: CGPoint(x: 397.758, y: 255.422))
        pathRef41.addQuadCurve(to: CGPoint(x: 393.516, y: 259.84), control: CGPoint(x: 394.43, y: 258.703))
        pathRef41.addQuadCurve(to: CGPoint(x: 391.559, y: 262.371), control: CGPoint(x: 392.602, y: 260.977))
        pathRef41.addQuadCurve(to: CGPoint(x: 390.035, y: 264.246), control: CGPoint(x: 390.516, y: 263.766))
        pathRef41.addQuadCurve(to: CGPoint(x: 389.062, y: 264.727), control: CGPoint(x: 389.555, y: 264.727))
        pathRef41.addQuadCurve(to: CGPoint(x: 387.68, y: 263.156), control: CGPoint(x: 388.312, y: 264.727))
        pathRef41.addQuadCurve(to: CGPoint(x: 387.047, y: 259.5), control: CGPoint(x: 387.047, y: 261.586))
        pathRef41.addQuadCurve(to: CGPoint(x: 387.34, y: 257.484), control: CGPoint(x: 387.047, y: 258.211))
        pathRef41.addQuadCurve(to: CGPoint(x: 388.5, y: 255.422), control: CGPoint(x: 387.633, y: 256.758))
        pathRef41.addQuadCurve(to: CGPoint(x: 391.289, y: 251.777), control: CGPoint(x: 390.117, y: 252.938))
        pathRef41.addQuadCurve(to: CGPoint(x: 393.539, y: 250.617), control: CGPoint(x: 392.461, y: 250.617))
        pathRef41.addQuadCurve(to: CGPoint(x: 394.746, y: 250.875), control: CGPoint(x: 394.289, y: 250.617))
        pathRef41.addQuadCurve(to: CGPoint(x: 395.203, y: 251.672), control: CGPoint(x: 395.203, y: 251.133))
        pathRef41.addQuadCurve(to: CGPoint(x: 395.062, y: 252.164), control: CGPoint(x: 395.203, y: 251.906))
        pathRef41.addQuadCurve(to: CGPoint(x: 394.746, y: 252.633), control: CGPoint(x: 394.922, y: 252.422))
        pathRef41.addQuadCurve(to: CGPoint(x: 394.008, y: 253.453), control: CGPoint(x: 394.57, y: 252.844))
        pathRef41.addQuadCurve(to: CGPoint(x: 390.305, y: 258.773), control: CGPoint(x: 390.305, y: 257.555))
        pathRef41.addQuadCurve(to: CGPoint(x: 390.75, y: 259.453), control: CGPoint(x: 390.305, y: 259.453))
        pathRef41.addQuadCurve(to: CGPoint(x: 391.84, y: 258.551), control: CGPoint(x: 391.031, y: 259.453))
        pathRef41.addQuadCurve(to: CGPoint(x: 393.926, y: 256.184), control: CGPoint(x: 392.648, y: 257.648))
        pathRef41.addQuadCurve(to: CGPoint(x: 396.949, y: 253.125), control: CGPoint(x: 395.203, y: 254.719))
        pathRef41.addQuadCurve(to: CGPoint(x: 400.922, y: 250.055), control: CGPoint(x: 398.695, y: 251.531))
        pathRef41.addQuadCurve(to: CGPoint(x: 402.984, y: 249.188), control: CGPoint(x: 402.164, y: 249.188))
        pathRef41.addQuadCurve(to: CGPoint(x: 403.723, y: 250.219), control: CGPoint(x: 403.359, y: 249.188))
        pathRef41.addQuadCurve(to: CGPoint(x: 404.086, y: 252.305), control: CGPoint(x: 404.086, y: 251.25))
        pathRef41.addQuadCurve(to: CGPoint(x: 403.078, y: 253.875), control: CGPoint(x: 404.086, y: 252.82))
        pathRef41.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef41)
        ctx.fillPath()
        
        
        /*  Label Shapes  */
        /*  Shape 42  */
        let pathRef42 = CGMutablePath()
        pathRef42.move(to: CGPoint(x: 144.654, y: 421.503))
        pathRef42.addQuadCurve(to: CGPoint(x: 145.615, y: 430.467), control: CGPoint(x: 144.654, y: 427.362))
        pathRef42.addQuadCurve(to: CGPoint(x: 149.552, y: 433.573), control: CGPoint(x: 146.576, y: 433.573))
        pathRef42.addQuadCurve(to: CGPoint(x: 153.454, y: 430.467), control: CGPoint(x: 152.529, y: 433.573))
        pathRef42.addQuadCurve(to: CGPoint(x: 154.38, y: 421.503), control: CGPoint(x: 154.38, y: 427.362))
        pathRef42.addQuadCurve(to: CGPoint(x: 153.454, y: 412.409), control: CGPoint(x: 154.38, y: 415.362))
        pathRef42.addQuadCurve(to: CGPoint(x: 149.552, y: 409.456), control: CGPoint(x: 152.529, y: 409.456))
        pathRef42.addQuadCurve(to: CGPoint(x: 145.615, y: 412.409), control: CGPoint(x: 146.576, y: 409.456))
        pathRef42.addQuadCurve(to: CGPoint(x: 144.654, y: 421.503), control: CGPoint(x: 144.654, y: 415.362))
        pathRef42.closeSubpath()
        pathRef42.move(to: CGPoint(x: 149.552, y: 403.948))
        pathRef42.addQuadCurve(to: CGPoint(x: 158.658, y: 408.518), control: CGPoint(x: 156.044, y: 403.948))
        pathRef42.addQuadCurve(to: CGPoint(x: 161.271, y: 421.503), control: CGPoint(x: 161.271, y: 413.089))
        pathRef42.addQuadCurve(to: CGPoint(x: 158.658, y: 434.464), control: CGPoint(x: 161.271, y: 429.917))
        pathRef42.addQuadCurve(to: CGPoint(x: 149.552, y: 439.01), control: CGPoint(x: 156.044, y: 439.01))
        pathRef42.addQuadCurve(to: CGPoint(x: 140.447, y: 434.464), control: CGPoint(x: 143.06, y: 439.01))
        pathRef42.addQuadCurve(to: CGPoint(x: 137.833, y: 421.503), control: CGPoint(x: 137.833, y: 429.917))
        pathRef42.addQuadCurve(to: CGPoint(x: 140.447, y: 408.518), control: CGPoint(x: 137.833, y: 413.089))
        pathRef42.addQuadCurve(to: CGPoint(x: 149.552, y: 403.948), control: CGPoint(x: 143.06, y: 403.948))
        pathRef42.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef42)
        ctx.fillPath()
        
        
        /*  Shape 43  */
        let pathRef43 = CGMutablePath()
        pathRef43.move(to: CGPoint(x: 425.599, y: 414.729))
        pathRef43.addLine(to: CGPoint(x: 425.599, y: 410.182))
        pathRef43.addQuadCurve(to: CGPoint(x: 430.029, y: 409.76), control: CGPoint(x: 428.763, y: 410.042))
        pathRef43.addQuadCurve(to: CGPoint(x: 433.31, y: 407.979), control: CGPoint(x: 432.044, y: 409.315))
        pathRef43.addQuadCurve(to: CGPoint(x: 434.622, y: 405.542), control: CGPoint(x: 434.177, y: 407.065))
        pathRef43.addQuadCurve(to: CGPoint(x: 434.88, y: 404.182), control: CGPoint(x: 434.88, y: 404.628))
        pathRef43.addLine(to: CGPoint(x: 440.435, y: 404.182))
        pathRef43.addLine(to: CGPoint(x: 440.435, y: 438.167))
        pathRef43.addLine(to: CGPoint(x: 433.591, y: 438.167))
        pathRef43.addLine(to: CGPoint(x: 433.591, y: 414.729))
        pathRef43.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef43)
        ctx.fillPath()
        
        
        /*  Shape 44  */
        let pathRef44 = CGMutablePath()
        pathRef44.move(to: CGPoint(x: 450.466, y: 438.167))
        pathRef44.addQuadCurve(to: CGPoint(x: 452.036, y: 431.487), control: CGPoint(x: 450.56, y: 434.51))
        pathRef44.addQuadCurve(to: CGPoint(x: 458.786, y: 424.292), control: CGPoint(x: 453.466, y: 428.089))
        pathRef44.addQuadCurve(to: CGPoint(x: 464.763, y: 419.557), control: CGPoint(x: 463.404, y: 420.987))
        pathRef44.addQuadCurve(to: CGPoint(x: 466.849, y: 414.682), control: CGPoint(x: 466.849, y: 417.331))
        pathRef44.addQuadCurve(to: CGPoint(x: 465.654, y: 411.096), control: CGPoint(x: 466.849, y: 412.526))
        pathRef44.addQuadCurve(to: CGPoint(x: 462.232, y: 409.667), control: CGPoint(x: 464.458, y: 409.667))
        pathRef44.addQuadCurve(to: CGPoint(x: 458.083, y: 411.94), control: CGPoint(x: 459.185, y: 409.667))
        pathRef44.addQuadCurve(to: CGPoint(x: 457.333, y: 416.112), control: CGPoint(x: 457.45, y: 413.253))
        pathRef44.addLine(to: CGPoint(x: 450.841, y: 416.112))
        pathRef44.addQuadCurve(to: CGPoint(x: 452.411, y: 409.104), control: CGPoint(x: 451.005, y: 411.776))
        pathRef44.addQuadCurve(to: CGPoint(x: 461.904, y: 404.018), control: CGPoint(x: 455.083, y: 404.018))
        pathRef44.addQuadCurve(to: CGPoint(x: 470.482, y: 407.007), control: CGPoint(x: 467.294, y: 404.018))
        pathRef44.addQuadCurve(to: CGPoint(x: 473.669, y: 414.917), control: CGPoint(x: 473.669, y: 409.995))
        pathRef44.addQuadCurve(to: CGPoint(x: 471.419, y: 421.62), control: CGPoint(x: 473.669, y: 418.69))
        pathRef44.addQuadCurve(to: CGPoint(x: 466.568, y: 425.956), control: CGPoint(x: 469.943, y: 423.565))
        pathRef44.addLine(to: CGPoint(x: 463.896, y: 427.854))
        pathRef44.addQuadCurve(to: CGPoint(x: 460.462, y: 430.432), control: CGPoint(x: 461.388, y: 429.635))
        pathRef44.addQuadCurve(to: CGPoint(x: 458.904, y: 432.284), control: CGPoint(x: 459.536, y: 431.229))
        pathRef44.addLine(to: CGPoint(x: 473.74, y: 432.284))
        pathRef44.addLine(to: CGPoint(x: 473.74, y: 438.167))
        pathRef44.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef44)
        ctx.fillPath()
        
        
        /*  Shape 45  */
        let pathRef45 = CGMutablePath()
        pathRef45.move(to: CGPoint(x: 483.982, y: 421.503))
        pathRef45.addQuadCurve(to: CGPoint(x: 484.943, y: 430.467), control: CGPoint(x: 483.982, y: 427.362))
        pathRef45.addQuadCurve(to: CGPoint(x: 488.88, y: 433.573), control: CGPoint(x: 485.904, y: 433.573))
        pathRef45.addQuadCurve(to: CGPoint(x: 492.783, y: 430.467), control: CGPoint(x: 491.857, y: 433.573))
        pathRef45.addQuadCurve(to: CGPoint(x: 493.708, y: 421.503), control: CGPoint(x: 493.708, y: 427.362))
        pathRef45.addQuadCurve(to: CGPoint(x: 492.783, y: 412.409), control: CGPoint(x: 493.708, y: 415.362))
        pathRef45.addQuadCurve(to: CGPoint(x: 488.88, y: 409.456), control: CGPoint(x: 491.857, y: 409.456))
        pathRef45.addQuadCurve(to: CGPoint(x: 484.943, y: 412.409), control: CGPoint(x: 485.904, y: 409.456))
        pathRef45.addQuadCurve(to: CGPoint(x: 483.982, y: 421.503), control: CGPoint(x: 483.982, y: 415.362))
        pathRef45.closeSubpath()
        pathRef45.move(to: CGPoint(x: 488.88, y: 403.948))
        pathRef45.addQuadCurve(to: CGPoint(x: 497.986, y: 408.518), control: CGPoint(x: 495.372, y: 403.948))
        pathRef45.addQuadCurve(to: CGPoint(x: 500.599, y: 421.503), control: CGPoint(x: 500.599, y: 413.089))
        pathRef45.addQuadCurve(to: CGPoint(x: 497.986, y: 434.464), control: CGPoint(x: 500.599, y: 429.917))
        pathRef45.addQuadCurve(to: CGPoint(x: 488.88, y: 439.01), control: CGPoint(x: 495.372, y: 439.01))
        pathRef45.addQuadCurve(to: CGPoint(x: 479.775, y: 434.464), control: CGPoint(x: 482.388, y: 439.01))
        pathRef45.addQuadCurve(to: CGPoint(x: 477.161, y: 421.503), control: CGPoint(x: 477.161, y: 429.917))
        pathRef45.addQuadCurve(to: CGPoint(x: 479.775, y: 408.518), control: CGPoint(x: 477.161, y: 413.089))
        pathRef45.addQuadCurve(to: CGPoint(x: 488.88, y: 403.948), control: CGPoint(x: 482.388, y: 403.948))
        pathRef45.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef45)
        ctx.fillPath()
        
        
        /*  Shape 46  */
        let pathRef46 = CGMutablePath()
        pathRef46.move(to: CGPoint(x: 300.915, y: 131.51))
        pathRef46.addQuadCurve(to: CGPoint(x: 302.392, y: 135.987), control: CGPoint(x: 300.915, y: 134.252))
        pathRef46.addQuadCurve(to: CGPoint(x: 306.142, y: 137.721), control: CGPoint(x: 303.868, y: 137.721))
        pathRef46.addQuadCurve(to: CGPoint(x: 309.646, y: 136.045), control: CGPoint(x: 308.368, y: 137.721))
        pathRef46.addQuadCurve(to: CGPoint(x: 310.923, y: 131.698), control: CGPoint(x: 310.923, y: 134.369))
        pathRef46.addQuadCurve(to: CGPoint(x: 309.47, y: 127.139), control: CGPoint(x: 310.923, y: 128.721))
        pathRef46.addQuadCurve(to: CGPoint(x: 305.908, y: 125.557), control: CGPoint(x: 308.017, y: 125.557))
        pathRef46.addQuadCurve(to: CGPoint(x: 302.884, y: 126.588), control: CGPoint(x: 304.197, y: 125.557))
        pathRef46.addQuadCurve(to: CGPoint(x: 300.915, y: 131.51), control: CGPoint(x: 300.915, y: 128.112))
        pathRef46.closeSubpath()
        pathRef46.move(to: CGPoint(x: 310.314, y: 116.838))
        pathRef46.addQuadCurve(to: CGPoint(x: 309.681, y: 115.033), control: CGPoint(x: 310.314, y: 116.018))
        pathRef46.addQuadCurve(to: CGPoint(x: 306.423, y: 113.44), control: CGPoint(x: 308.603, y: 113.44))
        pathRef46.addQuadCurve(to: CGPoint(x: 301.783, y: 117.096), control: CGPoint(x: 303.165, y: 113.44))
        pathRef46.addQuadCurve(to: CGPoint(x: 300.751, y: 123.049), control: CGPoint(x: 301.033, y: 119.112))
        pathRef46.addQuadCurve(to: CGPoint(x: 303.634, y: 120.893), control: CGPoint(x: 301.993, y: 121.573))
        pathRef46.addQuadCurve(to: CGPoint(x: 307.384, y: 120.213), control: CGPoint(x: 305.275, y: 120.213))
        pathRef46.addQuadCurve(to: CGPoint(x: 314.802, y: 123.283), control: CGPoint(x: 311.908, y: 120.213))
        pathRef46.addQuadCurve(to: CGPoint(x: 317.697, y: 131.135), control: CGPoint(x: 317.697, y: 126.354))
        pathRef46.addQuadCurve(to: CGPoint(x: 314.861, y: 139.526), control: CGPoint(x: 317.697, y: 135.893))
        pathRef46.addQuadCurve(to: CGPoint(x: 306.048, y: 143.158), control: CGPoint(x: 312.025, y: 143.158))
        pathRef46.addQuadCurve(to: CGPoint(x: 296.579, y: 137.791), control: CGPoint(x: 299.626, y: 143.158))
        pathRef46.addQuadCurve(to: CGPoint(x: 294.212, y: 126.963), control: CGPoint(x: 294.212, y: 133.596))
        pathRef46.addQuadCurve(to: CGPoint(x: 294.54, y: 120.635), control: CGPoint(x: 294.212, y: 123.073))
        pathRef46.addQuadCurve(to: CGPoint(x: 296.814, y: 113.416), control: CGPoint(x: 295.126, y: 116.299))
        pathRef46.addQuadCurve(to: CGPoint(x: 300.622, y: 109.455), control: CGPoint(x: 298.267, y: 110.955))
        pathRef46.addQuadCurve(to: CGPoint(x: 306.259, y: 107.955), control: CGPoint(x: 302.978, y: 107.955))
        pathRef46.addQuadCurve(to: CGPoint(x: 313.806, y: 110.381), control: CGPoint(x: 310.993, y: 107.955))
        pathRef46.addQuadCurve(to: CGPoint(x: 316.97, y: 116.838), control: CGPoint(x: 316.618, y: 112.807))
        pathRef46.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef46)
        ctx.fillPath()
        
        
        /*  Shape 47  */
        let pathRef47 = CGMutablePath()
        pathRef47.move(to: CGPoint(x: 327.728, y: 125.604))
        pathRef47.addQuadCurve(to: CGPoint(x: 328.689, y: 134.569), control: CGPoint(x: 327.728, y: 131.463))
        pathRef47.addQuadCurve(to: CGPoint(x: 332.626, y: 137.674), control: CGPoint(x: 329.65, y: 137.674))
        pathRef47.addQuadCurve(to: CGPoint(x: 336.529, y: 134.569), control: CGPoint(x: 335.603, y: 137.674))
        pathRef47.addQuadCurve(to: CGPoint(x: 337.454, y: 125.604), control: CGPoint(x: 337.454, y: 131.463))
        pathRef47.addQuadCurve(to: CGPoint(x: 336.529, y: 116.51), control: CGPoint(x: 337.454, y: 119.463))
        pathRef47.addQuadCurve(to: CGPoint(x: 332.626, y: 113.557), control: CGPoint(x: 335.603, y: 113.557))
        pathRef47.addQuadCurve(to: CGPoint(x: 328.689, y: 116.51), control: CGPoint(x: 329.65, y: 113.557))
        pathRef47.addQuadCurve(to: CGPoint(x: 327.728, y: 125.604), control: CGPoint(x: 327.728, y: 119.463))
        pathRef47.closeSubpath()
        pathRef47.move(to: CGPoint(x: 332.626, y: 108.049))
        pathRef47.addQuadCurve(to: CGPoint(x: 341.732, y: 112.619), control: CGPoint(x: 339.118, y: 108.049))
        pathRef47.addQuadCurve(to: CGPoint(x: 344.345, y: 125.604), control: CGPoint(x: 344.345, y: 117.19))
        pathRef47.addQuadCurve(to: CGPoint(x: 341.732, y: 138.565), control: CGPoint(x: 344.345, y: 134.018))
        pathRef47.addQuadCurve(to: CGPoint(x: 332.626, y: 143.112), control: CGPoint(x: 339.118, y: 143.112))
        pathRef47.addQuadCurve(to: CGPoint(x: 323.521, y: 138.565), control: CGPoint(x: 326.134, y: 143.112))
        pathRef47.addQuadCurve(to: CGPoint(x: 320.908, y: 125.604), control: CGPoint(x: 320.908, y: 134.018))
        pathRef47.addQuadCurve(to: CGPoint(x: 323.521, y: 112.619), control: CGPoint(x: 320.908, y: 117.19))
        pathRef47.addQuadCurve(to: CGPoint(x: 332.626, y: 108.049), control: CGPoint(x: 326.134, y: 108.049))
        pathRef47.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef47)
        ctx.fillPath()
        
        
        /*  Shape 48  */
        let pathRef48 = CGMutablePath()
        pathRef48.move(to: CGPoint(x: 107.529, y: 316.281))
        pathRef48.addLine(to: CGPoint(x: 107.529, y: 314.008))
        pathRef48.addQuadCurve(to: CGPoint(x: 109.744, y: 313.797), control: CGPoint(x: 109.111, y: 313.938))
        pathRef48.addQuadCurve(to: CGPoint(x: 111.385, y: 312.906), control: CGPoint(x: 110.752, y: 313.574))
        pathRef48.addQuadCurve(to: CGPoint(x: 112.041, y: 311.688), control: CGPoint(x: 111.818, y: 312.449))
        pathRef48.addQuadCurve(to: CGPoint(x: 112.17, y: 311.008), control: CGPoint(x: 112.17, y: 311.23))
        pathRef48.addLine(to: CGPoint(x: 114.947, y: 311.008))
        pathRef48.addLine(to: CGPoint(x: 114.947, y: 328))
        pathRef48.addLine(to: CGPoint(x: 111.525, y: 328))
        pathRef48.addLine(to: CGPoint(x: 111.525, y: 316.281))
        pathRef48.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef48)
        ctx.fillPath()
        
        
        /*  Shape 49  */
        let pathRef49 = CGMutablePath()
        pathRef49.move(to: CGPoint(x: 123.174, y: 323.453))
        pathRef49.addQuadCurve(to: CGPoint(x: 123.935, y: 325.135), control: CGPoint(x: 123.373, y: 324.543))
        pathRef49.addQuadCurve(to: CGPoint(x: 125.576, y: 325.727), control: CGPoint(x: 124.498, y: 325.727))
        pathRef49.addQuadCurve(to: CGPoint(x: 127.469, y: 324.854), control: CGPoint(x: 126.818, y: 325.727))
        pathRef49.addQuadCurve(to: CGPoint(x: 128.119, y: 322.656), control: CGPoint(x: 128.119, y: 323.98))
        pathRef49.addQuadCurve(to: CGPoint(x: 127.51, y: 320.459), control: CGPoint(x: 128.119, y: 321.355))
        pathRef49.addQuadCurve(to: CGPoint(x: 125.611, y: 319.562), control: CGPoint(x: 126.9, y: 319.562))
        pathRef49.addQuadCurve(to: CGPoint(x: 124.557, y: 319.715), control: CGPoint(x: 125.002, y: 319.562))
        pathRef49.addQuadCurve(to: CGPoint(x: 123.373, y: 320.758), control: CGPoint(x: 123.771, y: 319.996))
        pathRef49.addLine(to: CGPoint(x: 120.373, y: 320.617))
        pathRef49.addLine(to: CGPoint(x: 121.568, y: 311.23))
        pathRef49.addLine(to: CGPoint(x: 130.932, y: 311.23))
        pathRef49.addLine(to: CGPoint(x: 130.932, y: 314.066))
        pathRef49.addLine(to: CGPoint(x: 123.982, y: 314.066))
        pathRef49.addLine(to: CGPoint(x: 123.373, y: 317.781))
        pathRef49.addQuadCurve(to: CGPoint(x: 124.58, y: 317.113), control: CGPoint(x: 124.146, y: 317.277))
        pathRef49.addQuadCurve(to: CGPoint(x: 126.35, y: 316.844), control: CGPoint(x: 125.307, y: 316.844))
        pathRef49.addQuadCurve(to: CGPoint(x: 130.029, y: 318.262), control: CGPoint(x: 128.459, y: 316.844))
        pathRef49.addQuadCurve(to: CGPoint(x: 131.6, y: 322.387), control: CGPoint(x: 131.6, y: 319.68))
        pathRef49.addQuadCurve(to: CGPoint(x: 130.088, y: 326.594), control: CGPoint(x: 131.6, y: 324.742))
        pathRef49.addQuadCurve(to: CGPoint(x: 125.564, y: 328.445), control: CGPoint(x: 128.576, y: 328.445))
        pathRef49.addQuadCurve(to: CGPoint(x: 121.58, y: 327.145), control: CGPoint(x: 123.139, y: 328.445))
        pathRef49.addQuadCurve(to: CGPoint(x: 119.846, y: 323.453), control: CGPoint(x: 120.021, y: 325.844))
        pathRef49.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef49)
        ctx.fillPath()
        
        
        /*  Shape 50  */
        let pathRef50 = CGMutablePath()
        pathRef50.move(to: CGPoint(x: 494.18, y: 316.281))
        pathRef50.addLine(to: CGPoint(x: 494.18, y: 314.008))
        pathRef50.addQuadCurve(to: CGPoint(x: 496.395, y: 313.797), control: CGPoint(x: 495.762, y: 313.938))
        pathRef50.addQuadCurve(to: CGPoint(x: 498.035, y: 312.906), control: CGPoint(x: 497.402, y: 313.574))
        pathRef50.addQuadCurve(to: CGPoint(x: 498.692, y: 311.688), control: CGPoint(x: 498.469, y: 312.449))
        pathRef50.addQuadCurve(to: CGPoint(x: 498.82, y: 311.008), control: CGPoint(x: 498.82, y: 311.23))
        pathRef50.addLine(to: CGPoint(x: 501.598, y: 311.008))
        pathRef50.addLine(to: CGPoint(x: 501.598, y: 328))
        pathRef50.addLine(to: CGPoint(x: 498.176, y: 328))
        pathRef50.addLine(to: CGPoint(x: 498.176, y: 316.281))
        pathRef50.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef50)
        ctx.fillPath()
        
        
        /*  Shape 51  */
        let pathRef51 = CGMutablePath()
        pathRef51.move(to: CGPoint(x: 510.024, y: 319.668))
        pathRef51.addQuadCurve(to: CGPoint(x: 510.504, y: 324.15), control: CGPoint(x: 510.024, y: 322.598))
        pathRef51.addQuadCurve(to: CGPoint(x: 512.473, y: 325.703), control: CGPoint(x: 510.985, y: 325.703))
        pathRef51.addQuadCurve(to: CGPoint(x: 514.424, y: 324.15), control: CGPoint(x: 513.961, y: 325.703))
        pathRef51.addQuadCurve(to: CGPoint(x: 514.887, y: 319.668), control: CGPoint(x: 514.887, y: 322.598))
        pathRef51.addQuadCurve(to: CGPoint(x: 514.424, y: 315.121), control: CGPoint(x: 514.887, y: 316.598))
        pathRef51.addQuadCurve(to: CGPoint(x: 512.473, y: 313.645), control: CGPoint(x: 513.961, y: 313.645))
        pathRef51.addQuadCurve(to: CGPoint(x: 510.504, y: 315.121), control: CGPoint(x: 510.985, y: 313.645))
        pathRef51.addQuadCurve(to: CGPoint(x: 510.024, y: 319.668), control: CGPoint(x: 510.024, y: 316.598))
        pathRef51.closeSubpath()
        pathRef51.move(to: CGPoint(x: 512.473, y: 310.891))
        pathRef51.addQuadCurve(to: CGPoint(x: 517.026, y: 313.176), control: CGPoint(x: 515.719, y: 310.891))
        pathRef51.addQuadCurve(to: CGPoint(x: 518.332, y: 319.668), control: CGPoint(x: 518.332, y: 315.461))
        pathRef51.addQuadCurve(to: CGPoint(x: 517.026, y: 326.148), control: CGPoint(x: 518.332, y: 323.875))
        pathRef51.addQuadCurve(to: CGPoint(x: 512.473, y: 328.422), control: CGPoint(x: 515.719, y: 328.422))
        pathRef51.addQuadCurve(to: CGPoint(x: 507.92, y: 326.148), control: CGPoint(x: 509.227, y: 328.422))
        pathRef51.addQuadCurve(to: CGPoint(x: 506.613, y: 319.668), control: CGPoint(x: 506.613, y: 323.875))
        pathRef51.addQuadCurve(to: CGPoint(x: 507.92, y: 313.176), control: CGPoint(x: 506.613, y: 315.461))
        pathRef51.addQuadCurve(to: CGPoint(x: 512.473, y: 310.891), control: CGPoint(x: 509.227, y: 310.891))
        pathRef51.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef51)
        ctx.fillPath()
        
        
        /*  Shape 52  */
        let pathRef52 = CGMutablePath()
        pathRef52.move(to: CGPoint(x: 523.172, y: 323.453))
        pathRef52.addQuadCurve(to: CGPoint(x: 523.934, y: 325.135), control: CGPoint(x: 523.371, y: 324.543))
        pathRef52.addQuadCurve(to: CGPoint(x: 525.574, y: 325.727), control: CGPoint(x: 524.496, y: 325.727))
        pathRef52.addQuadCurve(to: CGPoint(x: 527.467, y: 324.854), control: CGPoint(x: 526.817, y: 325.727))
        pathRef52.addQuadCurve(to: CGPoint(x: 528.117, y: 322.656), control: CGPoint(x: 528.117, y: 323.98))
        pathRef52.addQuadCurve(to: CGPoint(x: 527.508, y: 320.459), control: CGPoint(x: 528.117, y: 321.355))
        pathRef52.addQuadCurve(to: CGPoint(x: 525.61, y: 319.562), control: CGPoint(x: 526.899, y: 319.562))
        pathRef52.addQuadCurve(to: CGPoint(x: 524.555, y: 319.715), control: CGPoint(x: 525, y: 319.562))
        pathRef52.addQuadCurve(to: CGPoint(x: 523.371, y: 320.758), control: CGPoint(x: 523.77, y: 319.996))
        pathRef52.addLine(to: CGPoint(x: 520.371, y: 320.617))
        pathRef52.addLine(to: CGPoint(x: 521.567, y: 311.23))
        pathRef52.addLine(to: CGPoint(x: 530.93, y: 311.23))
        pathRef52.addLine(to: CGPoint(x: 530.93, y: 314.066))
        pathRef52.addLine(to: CGPoint(x: 523.981, y: 314.066))
        pathRef52.addLine(to: CGPoint(x: 523.371, y: 317.781))
        pathRef52.addQuadCurve(to: CGPoint(x: 524.578, y: 317.113), control: CGPoint(x: 524.145, y: 317.277))
        pathRef52.addQuadCurve(to: CGPoint(x: 526.348, y: 316.844), control: CGPoint(x: 525.305, y: 316.844))
        pathRef52.addQuadCurve(to: CGPoint(x: 530.028, y: 318.262), control: CGPoint(x: 528.457, y: 316.844))
        pathRef52.addQuadCurve(to: CGPoint(x: 531.598, y: 322.387), control: CGPoint(x: 531.598, y: 319.68))
        pathRef52.addQuadCurve(to: CGPoint(x: 530.086, y: 326.594), control: CGPoint(x: 531.598, y: 324.742))
        pathRef52.addQuadCurve(to: CGPoint(x: 525.563, y: 328.445), control: CGPoint(x: 528.574, y: 328.445))
        pathRef52.addQuadCurve(to: CGPoint(x: 521.578, y: 327.145), control: CGPoint(x: 523.137, y: 328.445))
        pathRef52.addQuadCurve(to: CGPoint(x: 519.844, y: 323.453), control: CGPoint(x: 520.02, y: 325.844))
        pathRef52.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef52)
        ctx.fillPath()
        
        
        /*  Shape 53  */
        let pathRef53 = CGMutablePath()
        pathRef53.move(to: CGPoint(x: 138.642, y: 217.801))
        pathRef53.addQuadCurve(to: CGPoint(x: 138.97, y: 219.489), control: CGPoint(x: 138.642, y: 218.821))
        pathRef53.addQuadCurve(to: CGPoint(x: 141.185, y: 220.719), control: CGPoint(x: 139.579, y: 220.719))
        pathRef53.addQuadCurve(to: CGPoint(x: 142.901, y: 220.045), control: CGPoint(x: 142.169, y: 220.719))
        pathRef53.addQuadCurve(to: CGPoint(x: 143.634, y: 218.106), control: CGPoint(x: 143.634, y: 219.372))
        pathRef53.addQuadCurve(to: CGPoint(x: 142.274, y: 215.868), control: CGPoint(x: 143.634, y: 216.43))
        pathRef53.addQuadCurve(to: CGPoint(x: 139.837, y: 215.551), control: CGPoint(x: 141.501, y: 215.551))
        pathRef53.addLine(to: CGPoint(x: 139.837, y: 213.161))
        pathRef53.addQuadCurve(to: CGPoint(x: 142.11, y: 212.844), control: CGPoint(x: 141.466, y: 213.137))
        pathRef53.addQuadCurve(to: CGPoint(x: 143.224, y: 210.852), control: CGPoint(x: 143.224, y: 212.352))
        pathRef53.addQuadCurve(to: CGPoint(x: 142.655, y: 209.27), control: CGPoint(x: 143.224, y: 209.879))
        pathRef53.addQuadCurve(to: CGPoint(x: 141.056, y: 208.661), control: CGPoint(x: 142.087, y: 208.661))
        pathRef53.addQuadCurve(to: CGPoint(x: 139.315, y: 209.411), control: CGPoint(x: 139.872, y: 208.661))
        pathRef53.addQuadCurve(to: CGPoint(x: 138.782, y: 211.414), control: CGPoint(x: 138.759, y: 210.161))
        pathRef53.addLine(to: CGPoint(x: 135.665, y: 211.414))
        pathRef53.addQuadCurve(to: CGPoint(x: 136.099, y: 209.012), control: CGPoint(x: 135.712, y: 210.149))
        pathRef53.addQuadCurve(to: CGPoint(x: 137.388, y: 207.172), control: CGPoint(x: 136.509, y: 208.016))
        pathRef53.addQuadCurve(to: CGPoint(x: 138.946, y: 206.258), control: CGPoint(x: 138.044, y: 206.575))
        pathRef53.addQuadCurve(to: CGPoint(x: 141.161, y: 205.942), control: CGPoint(x: 139.849, y: 205.942))
        pathRef53.addQuadCurve(to: CGPoint(x: 145.093, y: 207.202), control: CGPoint(x: 143.599, y: 205.942))
        pathRef53.addQuadCurve(to: CGPoint(x: 146.587, y: 210.582), control: CGPoint(x: 146.587, y: 208.461))
        pathRef53.addQuadCurve(to: CGPoint(x: 145.696, y: 213.114), control: CGPoint(x: 146.587, y: 212.082))
        pathRef53.addQuadCurve(to: CGPoint(x: 144.524, y: 213.993), control: CGPoint(x: 145.134, y: 213.758))
        pathRef53.addQuadCurve(to: CGPoint(x: 145.837, y: 214.778), control: CGPoint(x: 144.981, y: 213.993))
        pathRef53.addQuadCurve(to: CGPoint(x: 147.114, y: 218.012), control: CGPoint(x: 147.114, y: 215.961))
        pathRef53.addQuadCurve(to: CGPoint(x: 145.62, y: 221.803), control: CGPoint(x: 147.114, y: 220.168))
        pathRef53.addQuadCurve(to: CGPoint(x: 141.196, y: 223.438), control: CGPoint(x: 144.126, y: 223.438))
        pathRef53.addQuadCurve(to: CGPoint(x: 136.181, y: 221.082), control: CGPoint(x: 137.587, y: 223.438))
        pathRef53.addQuadCurve(to: CGPoint(x: 135.36, y: 217.801), control: CGPoint(x: 135.442, y: 219.829))
        pathRef53.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef53)
        ctx.fillPath()
        
        
        /*  Shape 54  */
        let pathRef54 = CGMutablePath()
        pathRef54.move(to: CGPoint(x: 152.235, y: 214.684))
        pathRef54.addQuadCurve(to: CGPoint(x: 152.716, y: 219.166), control: CGPoint(x: 152.235, y: 217.614))
        pathRef54.addQuadCurve(to: CGPoint(x: 154.685, y: 220.719), control: CGPoint(x: 153.196, y: 220.719))
        pathRef54.addQuadCurve(to: CGPoint(x: 156.636, y: 219.166), control: CGPoint(x: 156.173, y: 220.719))
        pathRef54.addQuadCurve(to: CGPoint(x: 157.099, y: 214.684), control: CGPoint(x: 157.099, y: 217.614))
        pathRef54.addQuadCurve(to: CGPoint(x: 156.636, y: 210.137), control: CGPoint(x: 157.099, y: 211.614))
        pathRef54.addQuadCurve(to: CGPoint(x: 154.685, y: 208.661), control: CGPoint(x: 156.173, y: 208.661))
        pathRef54.addQuadCurve(to: CGPoint(x: 152.716, y: 210.137), control: CGPoint(x: 153.196, y: 208.661))
        pathRef54.addQuadCurve(to: CGPoint(x: 152.235, y: 214.684), control: CGPoint(x: 152.235, y: 211.614))
        pathRef54.closeSubpath()
        pathRef54.move(to: CGPoint(x: 154.685, y: 205.907))
        pathRef54.addQuadCurve(to: CGPoint(x: 159.237, y: 208.192), control: CGPoint(x: 157.931, y: 205.907))
        pathRef54.addQuadCurve(to: CGPoint(x: 160.544, y: 214.684), control: CGPoint(x: 160.544, y: 210.477))
        pathRef54.addQuadCurve(to: CGPoint(x: 159.237, y: 221.164), control: CGPoint(x: 160.544, y: 218.891))
        pathRef54.addQuadCurve(to: CGPoint(x: 154.685, y: 223.438), control: CGPoint(x: 157.931, y: 223.438))
        pathRef54.addQuadCurve(to: CGPoint(x: 150.132, y: 221.164), control: CGPoint(x: 151.438, y: 223.438))
        pathRef54.addQuadCurve(to: CGPoint(x: 148.825, y: 214.684), control: CGPoint(x: 148.825, y: 218.891))
        pathRef54.addQuadCurve(to: CGPoint(x: 150.132, y: 208.192), control: CGPoint(x: 148.825, y: 210.477))
        pathRef54.addQuadCurve(to: CGPoint(x: 154.685, y: 205.907), control: CGPoint(x: 151.438, y: 205.907))
        pathRef54.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef54)
        ctx.fillPath()
        
        
        /*  Shape 55  */
        let pathRef55 = CGMutablePath()
        pathRef55.move(to: CGPoint(x: 477.229, y: 212))
        pathRef55.addQuadCurve(to: CGPoint(x: 478.805, y: 207.577), control: CGPoint(x: 477.229, y: 209.27))
        pathRef55.addQuadCurve(to: CGPoint(x: 482.9, y: 205.883), control: CGPoint(x: 480.381, y: 205.883))
        pathRef55.addQuadCurve(to: CGPoint(x: 488.221, y: 209.317), control: CGPoint(x: 486.779, y: 205.883))
        pathRef55.addQuadCurve(to: CGPoint(x: 489.041, y: 214.438), control: CGPoint(x: 489.041, y: 211.262))
        pathRef55.addQuadCurve(to: CGPoint(x: 488.256, y: 219.582), control: CGPoint(x: 489.041, y: 217.52))
        pathRef55.addQuadCurve(to: CGPoint(x: 482.748, y: 223.508), control: CGPoint(x: 486.756, y: 223.508))
        pathRef55.addQuadCurve(to: CGPoint(x: 479.314, y: 222.377), control: CGPoint(x: 480.838, y: 223.508))
        pathRef55.addQuadCurve(to: CGPoint(x: 477.568, y: 219.079), control: CGPoint(x: 477.791, y: 221.247))
        pathRef55.addLine(to: CGPoint(x: 480.897, y: 219.079))
        pathRef55.addQuadCurve(to: CGPoint(x: 481.529, y: 220.297), control: CGPoint(x: 481.014, y: 219.829))
        pathRef55.addQuadCurve(to: CGPoint(x: 482.9, y: 220.766), control: CGPoint(x: 482.045, y: 220.766))
        pathRef55.addQuadCurve(to: CGPoint(x: 485.221, y: 218.938), control: CGPoint(x: 484.553, y: 220.766))
        pathRef55.addQuadCurve(to: CGPoint(x: 485.678, y: 215.997), control: CGPoint(x: 485.584, y: 217.93))
        pathRef55.addQuadCurve(to: CGPoint(x: 484.705, y: 216.875), control: CGPoint(x: 485.221, y: 216.571))
        pathRef55.addQuadCurve(to: CGPoint(x: 482.397, y: 217.438), control: CGPoint(x: 483.768, y: 217.438))
        pathRef55.addQuadCurve(to: CGPoint(x: 478.799, y: 216.038), control: CGPoint(x: 480.369, y: 217.438))
        pathRef55.addQuadCurve(to: CGPoint(x: 477.229, y: 212), control: CGPoint(x: 477.229, y: 214.637))
        pathRef55.closeSubpath()
        pathRef55.move(to: CGPoint(x: 483.123, y: 214.719))
        pathRef55.addQuadCurve(to: CGPoint(x: 484.424, y: 214.321), control: CGPoint(x: 483.814, y: 214.719))
        pathRef55.addQuadCurve(to: CGPoint(x: 485.561, y: 211.801), control: CGPoint(x: 485.561, y: 213.594))
        pathRef55.addQuadCurve(to: CGPoint(x: 484.887, y: 209.516), control: CGPoint(x: 485.561, y: 210.36))
        pathRef55.addQuadCurve(to: CGPoint(x: 483.041, y: 208.672), control: CGPoint(x: 484.213, y: 208.672))
        pathRef55.addQuadCurve(to: CGPoint(x: 481.576, y: 209.153), control: CGPoint(x: 482.186, y: 208.672))
        pathRef55.addQuadCurve(to: CGPoint(x: 480.615, y: 211.696), control: CGPoint(x: 480.615, y: 209.903))
        pathRef55.addQuadCurve(to: CGPoint(x: 481.23, y: 213.963), control: CGPoint(x: 480.615, y: 213.207))
        pathRef55.addQuadCurve(to: CGPoint(x: 483.123, y: 214.719), control: CGPoint(x: 481.846, y: 214.719))
        pathRef55.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef55)
        ctx.fillPath()
        
        
        /*  Shape 56  */
        let pathRef56 = CGMutablePath()
        pathRef56.move(to: CGPoint(x: 494.022, y: 214.684))
        pathRef56.addQuadCurve(to: CGPoint(x: 494.502, y: 219.166), control: CGPoint(x: 494.022, y: 217.614))
        pathRef56.addQuadCurve(to: CGPoint(x: 496.471, y: 220.719), control: CGPoint(x: 494.982, y: 220.719))
        pathRef56.addQuadCurve(to: CGPoint(x: 498.422, y: 219.166), control: CGPoint(x: 497.959, y: 220.719))
        pathRef56.addQuadCurve(to: CGPoint(x: 498.885, y: 214.684), control: CGPoint(x: 498.885, y: 217.614))
        pathRef56.addQuadCurve(to: CGPoint(x: 498.422, y: 210.137), control: CGPoint(x: 498.885, y: 211.614))
        pathRef56.addQuadCurve(to: CGPoint(x: 496.471, y: 208.661), control: CGPoint(x: 497.959, y: 208.661))
        pathRef56.addQuadCurve(to: CGPoint(x: 494.502, y: 210.137), control: CGPoint(x: 494.982, y: 208.661))
        pathRef56.addQuadCurve(to: CGPoint(x: 494.022, y: 214.684), control: CGPoint(x: 494.022, y: 211.614))
        pathRef56.closeSubpath()
        pathRef56.move(to: CGPoint(x: 496.471, y: 205.907))
        pathRef56.addQuadCurve(to: CGPoint(x: 501.023, y: 208.192), control: CGPoint(x: 499.717, y: 205.907))
        pathRef56.addQuadCurve(to: CGPoint(x: 502.33, y: 214.684), control: CGPoint(x: 502.33, y: 210.477))
        pathRef56.addQuadCurve(to: CGPoint(x: 501.023, y: 221.164), control: CGPoint(x: 502.33, y: 218.891))
        pathRef56.addQuadCurve(to: CGPoint(x: 496.471, y: 223.438), control: CGPoint(x: 499.717, y: 223.438))
        pathRef56.addQuadCurve(to: CGPoint(x: 491.918, y: 221.164), control: CGPoint(x: 493.225, y: 223.438))
        pathRef56.addQuadCurve(to: CGPoint(x: 490.611, y: 214.684), control: CGPoint(x: 490.611, y: 218.891))
        pathRef56.addQuadCurve(to: CGPoint(x: 491.918, y: 208.192), control: CGPoint(x: 490.611, y: 210.477))
        pathRef56.addQuadCurve(to: CGPoint(x: 496.471, y: 205.907), control: CGPoint(x: 493.225, y: 205.907))
        pathRef56.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef56)
        ctx.fillPath()
        
        
        /*  Shape 57  */
        let pathRef57 = CGMutablePath()
        pathRef57.move(to: CGPoint(x: 222.58, y: 147.45))
        pathRef57.addLine(to: CGPoint(x: 220.658, y: 147.45))
        pathRef57.addLine(to: CGPoint(x: 220.658, y: 151.106))
        pathRef57.addLine(to: CGPoint(x: 217.389, y: 151.106))
        pathRef57.addLine(to: CGPoint(x: 217.389, y: 147.45))
        pathRef57.addLine(to: CGPoint(x: 210.662, y: 147.45))
        pathRef57.addLine(to: CGPoint(x: 210.662, y: 144.532))
        pathRef57.addLine(to: CGPoint(x: 216.908, y: 134.219))
        pathRef57.addLine(to: CGPoint(x: 220.658, y: 134.219))
        pathRef57.addLine(to: CGPoint(x: 220.658, y: 144.836))
        pathRef57.addLine(to: CGPoint(x: 222.58, y: 144.836))
        pathRef57.closeSubpath()
        pathRef57.move(to: CGPoint(x: 217.389, y: 144.836))
        pathRef57.addLine(to: CGPoint(x: 217.389, y: 137.5))
        pathRef57.addLine(to: CGPoint(x: 213.135, y: 144.836))
        pathRef57.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef57)
        ctx.fillPath()
        
        
        /*  Shape 58  */
        let pathRef58 = CGMutablePath()
        pathRef58.move(to: CGPoint(x: 227.338, y: 146.559))
        pathRef58.addQuadCurve(to: CGPoint(x: 228.1, y: 148.241), control: CGPoint(x: 227.537, y: 147.649))
        pathRef58.addQuadCurve(to: CGPoint(x: 229.74, y: 148.832), control: CGPoint(x: 228.662, y: 148.832))
        pathRef58.addQuadCurve(to: CGPoint(x: 231.633, y: 147.959), control: CGPoint(x: 230.983, y: 148.832))
        pathRef58.addQuadCurve(to: CGPoint(x: 232.283, y: 145.762), control: CGPoint(x: 232.283, y: 147.086))
        pathRef58.addQuadCurve(to: CGPoint(x: 231.674, y: 143.565), control: CGPoint(x: 232.283, y: 144.461))
        pathRef58.addQuadCurve(to: CGPoint(x: 229.776, y: 142.668), control: CGPoint(x: 231.065, y: 142.668))
        pathRef58.addQuadCurve(to: CGPoint(x: 228.721, y: 142.821), control: CGPoint(x: 229.166, y: 142.668))
        pathRef58.addQuadCurve(to: CGPoint(x: 227.537, y: 143.864), control: CGPoint(x: 227.936, y: 143.102))
        pathRef58.addLine(to: CGPoint(x: 224.537, y: 143.723))
        pathRef58.addLine(to: CGPoint(x: 225.733, y: 134.336))
        pathRef58.addLine(to: CGPoint(x: 235.096, y: 134.336))
        pathRef58.addLine(to: CGPoint(x: 235.096, y: 137.172))
        pathRef58.addLine(to: CGPoint(x: 228.147, y: 137.172))
        pathRef58.addLine(to: CGPoint(x: 227.537, y: 140.887))
        pathRef58.addQuadCurve(to: CGPoint(x: 228.744, y: 140.219), control: CGPoint(x: 228.311, y: 140.383))
        pathRef58.addQuadCurve(to: CGPoint(x: 230.514, y: 139.95), control: CGPoint(x: 229.471, y: 139.95))
        pathRef58.addQuadCurve(to: CGPoint(x: 234.194, y: 141.368), control: CGPoint(x: 232.623, y: 139.95))
        pathRef58.addQuadCurve(to: CGPoint(x: 235.764, y: 145.493), control: CGPoint(x: 235.764, y: 142.786))
        pathRef58.addQuadCurve(to: CGPoint(x: 234.252, y: 149.7), control: CGPoint(x: 235.764, y: 147.848))
        pathRef58.addQuadCurve(to: CGPoint(x: 229.729, y: 151.551), control: CGPoint(x: 232.74, y: 151.551))
        pathRef58.addQuadCurve(to: CGPoint(x: 225.744, y: 150.25), control: CGPoint(x: 227.303, y: 151.551))
        pathRef58.addQuadCurve(to: CGPoint(x: 224.01, y: 146.559), control: CGPoint(x: 224.186, y: 148.95))
        pathRef58.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef58)
        ctx.fillPath()
        
        
        /*  Shape 59  */
        let pathRef59 = CGMutablePath()
        pathRef59.move(to: CGPoint(x: 416.056, y: 136.95))
        pathRef59.addQuadCurve(to: CGPoint(x: 413.97, y: 139.58), control: CGPoint(x: 415.306, y: 137.688))
        pathRef59.addQuadCurve(to: CGPoint(x: 411.732, y: 143.489), control: CGPoint(x: 412.634, y: 141.473))
        pathRef59.addQuadCurve(to: CGPoint(x: 410.443, y: 147.356), control: CGPoint(x: 411.017, y: 145.071))
        pathRef59.addQuadCurve(to: CGPoint(x: 409.868, y: 151.106), control: CGPoint(x: 409.868, y: 149.641))
        pathRef59.addLine(to: CGPoint(x: 406.4, y: 151.106))
        pathRef59.addQuadCurve(to: CGPoint(x: 409.4, y: 141.602), control: CGPoint(x: 406.552, y: 146.536))
        pathRef59.addQuadCurve(to: CGPoint(x: 412.482, y: 137.336), control: CGPoint(x: 411.239, y: 138.543))
        pathRef59.addLine(to: CGPoint(x: 404.009, y: 137.336))
        pathRef59.addLine(to: CGPoint(x: 404.056, y: 134.336))
        pathRef59.addLine(to: CGPoint(x: 416.056, y: 134.336))
        pathRef59.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef59)
        ctx.fillPath()
        
        
        /*  Shape 60  */
        let pathRef60 = CGMutablePath()
        pathRef60.move(to: CGPoint(x: 420.708, y: 146.559))
        pathRef60.addQuadCurve(to: CGPoint(x: 421.47, y: 148.241), control: CGPoint(x: 420.907, y: 147.649))
        pathRef60.addQuadCurve(to: CGPoint(x: 423.111, y: 148.832), control: CGPoint(x: 422.032, y: 148.832))
        pathRef60.addQuadCurve(to: CGPoint(x: 425.003, y: 147.959), control: CGPoint(x: 424.353, y: 148.832))
        pathRef60.addQuadCurve(to: CGPoint(x: 425.654, y: 145.762), control: CGPoint(x: 425.654, y: 147.086))
        pathRef60.addQuadCurve(to: CGPoint(x: 425.044, y: 143.565), control: CGPoint(x: 425.654, y: 144.461))
        pathRef60.addQuadCurve(to: CGPoint(x: 423.146, y: 142.668), control: CGPoint(x: 424.435, y: 142.668))
        pathRef60.addQuadCurve(to: CGPoint(x: 422.091, y: 142.821), control: CGPoint(x: 422.536, y: 142.668))
        pathRef60.addQuadCurve(to: CGPoint(x: 420.907, y: 143.864), control: CGPoint(x: 421.306, y: 143.102))
        pathRef60.addLine(to: CGPoint(x: 417.907, y: 143.723))
        pathRef60.addLine(to: CGPoint(x: 419.103, y: 134.336))
        pathRef60.addLine(to: CGPoint(x: 428.466, y: 134.336))
        pathRef60.addLine(to: CGPoint(x: 428.466, y: 137.172))
        pathRef60.addLine(to: CGPoint(x: 421.517, y: 137.172))
        pathRef60.addLine(to: CGPoint(x: 420.907, y: 140.887))
        pathRef60.addQuadCurve(to: CGPoint(x: 422.114, y: 140.219), control: CGPoint(x: 421.681, y: 140.383))
        pathRef60.addQuadCurve(to: CGPoint(x: 423.884, y: 139.95), control: CGPoint(x: 422.841, y: 139.95))
        pathRef60.addQuadCurve(to: CGPoint(x: 427.564, y: 141.368), control: CGPoint(x: 425.993, y: 139.95))
        pathRef60.addQuadCurve(to: CGPoint(x: 429.134, y: 145.493), control: CGPoint(x: 429.134, y: 142.786))
        pathRef60.addQuadCurve(to: CGPoint(x: 427.622, y: 149.7), control: CGPoint(x: 429.134, y: 147.848))
        pathRef60.addQuadCurve(to: CGPoint(x: 423.099, y: 151.551), control: CGPoint(x: 426.111, y: 151.551))
        pathRef60.addQuadCurve(to: CGPoint(x: 419.114, y: 150.25), control: CGPoint(x: 420.673, y: 151.551))
        pathRef60.addQuadCurve(to: CGPoint(x: 417.38, y: 146.559), control: CGPoint(x: 417.556, y: 148.95))
        pathRef60.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef60)
        ctx.fillPath()
        

    }

}
