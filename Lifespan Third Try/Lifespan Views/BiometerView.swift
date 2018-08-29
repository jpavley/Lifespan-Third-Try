//
//  BiometerView.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 5/26/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

@IBDesignable
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
        shadowPath.addCurve(to: CGPoint(x: -70.97, y: 467.791), control1: CGPoint(x: -64.545, y: 468.486), control2: CGPoint(x: -68.146, y: 469.412))
        shadowPath.addLine(to: CGPoint(x: -314.828, y: 327.755))
        shadowPath.addLine(to: CGPoint(x: -557.949, y: 467.904))
        shadowPath.addCurve(to: CGPoint(x: -566.096, y: 465.784), control1: CGPoint(x: -560.789, y: 469.541), control2: CGPoint(x: -564.416, y: 468.597))
        shadowPath.addCurve(to: CGPoint(x: -605, y: 320.5), control1: CGPoint(x: -591.27, y: 423.654), control2: CGPoint(x: -604.331, y: 373.386))
        shadowPath.addCurve(to: CGPoint(x: -314.5, y: 30), control1: CGPoint(x: -605, y: 160.061), control2: CGPoint(x: -474.939, y: 30))
        shadowPath.closeSubpath()
        
        let clipPath = CGMutablePath()
        clipPath.move(to: CGPoint(x: 3, y: 1))
        clipPath.addLine(to: CGPoint(x: 638, y: 1))
        clipPath.addLine(to: CGPoint(x: 638, y: 497.707))
        clipPath.addLine(to: CGPoint(x: 3, y: 497.707))
        clipPath.closeSubpath()
        clipPath.move(to: CGPoint(x: 320.5, y: 30))
        clipPath.addCurve(to: CGPoint(x: 30, y: 320.5), control1: CGPoint(x: 160.061, y: 30), control2: CGPoint(x: 30, y: 160.061))
        clipPath.addCurve(to: CGPoint(x: 68.904, y: 465.784), control1: CGPoint(x: 30.669, y: 373.386), control2: CGPoint(x: 43.73, y: 423.654))
        clipPath.addCurve(to: CGPoint(x: 77.051, y: 467.904), control1: CGPoint(x: 70.584, y: 468.597), control2: CGPoint(x: 74.212, y: 469.541))
        clipPath.addLine(to: CGPoint(x: 320.172, y: 327.755))
        clipPath.addLine(to: CGPoint(x: 564.03, y: 467.791))
        clipPath.addCurve(to: CGPoint(x: 572.146, y: 465.703), control1: CGPoint(x: 566.854, y: 469.412), control2: CGPoint(x: 570.455, y: 468.486))
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
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
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
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef2)
        ctx.strokePath()
        
        /*  Inner Shadow  */
        let shadowColor2 = CGColor(colorSpace: colorSpace, components: [0, 0, 0, 0.75])
        
        let shadowPath2 = CGMutablePath()
        shadowPath2.move(to: CGPoint(x: -511.5, y: 41.5))
        shadowPath2.addLine(to: CGPoint(x: 42.5, y: 41.5))
        shadowPath2.addLine(to: CGPoint(x: 42.5, y: 476.477))
        shadowPath2.addLine(to: CGPoint(x: -511.5, y: 476.477))
        shadowPath2.closeSubpath()
        shadowPath2.move(to: CGPoint(x: -234.5, y: 71.5))
        shadowPath2.addLine(to: CGPoint(x: -234.501, y: 71.5))
        shadowPath2.addCurve(to: CGPoint(x: -483.5, y: 320.5), control1: CGPoint(x: -371.975, y: 73.241), control2: CGPoint(x: -482.958, y: 182.147))
        shadowPath2.addCurve(to: CGPoint(x: -450.162, y: 445.015), control1: CGPoint(x: -482.926, y: 365.837), control2: CGPoint(x: -471.728, y: 408.929))
        shadowPath2.addCurve(to: CGPoint(x: -446.089, y: 446.075), control1: CGPoint(x: -449.322, y: 446.422), control2: CGPoint(x: -447.508, y: 446.894))
        shadowPath2.addLine(to: CGPoint(x: -234.831, y: 324.294))
        shadowPath2.addLine(to: CGPoint(x: -22.868, y: 446.014))
        shadowPath2.addCurve(to: CGPoint(x: -18.81, y: 444.97), control1: CGPoint(x: -21.456, y: 446.824), control2: CGPoint(x: -19.656, y: 446.361))
        shadowPath2.addCurve(to: CGPoint(x: 14.5, y: 320.531), control1: CGPoint(x: 2.727, y: 409.52), control2: CGPoint(x: 14.036, y: 365.752))
        shadowPath2.addCurve(to: CGPoint(x: -234.5, y: 71.5), control1: CGPoint(x: 14.5, y: 182.981), control2: CGPoint(x: -96.981, y: 71.5))
        shadowPath2.closeSubpath()
        
        let clipPath2 = CGMutablePath()
        clipPath2.move(to: CGPoint(x: 320.5, y: 71.5))
        clipPath2.addCurve(to: CGPoint(x: 569.5, y: 320.531), control1: CGPoint(x: 458.019, y: 71.5), control2: CGPoint(x: 569.5, y: 182.981))
        clipPath2.addCurve(to: CGPoint(x: 536.19, y: 444.97), control1: CGPoint(x: 569.036, y: 365.752), control2: CGPoint(x: 557.727, y: 409.52))
        clipPath2.addCurve(to: CGPoint(x: 532.132, y: 446.014), control1: CGPoint(x: 535.344, y: 446.361), control2: CGPoint(x: 533.544, y: 446.824))
        clipPath2.addLine(to: CGPoint(x: 320.169, y: 324.294))
        clipPath2.addLine(to: CGPoint(x: 108.911, y: 446.075))
        clipPath2.addCurve(to: CGPoint(x: 104.838, y: 445.015), control1: CGPoint(x: 107.492, y: 446.894), control2: CGPoint(x: 105.678, y: 446.422))
        clipPath2.addCurve(to: CGPoint(x: 71.5, y: 320.5), control1: CGPoint(x: 83.272, y: 408.929), control2: CGPoint(x: 72.074, y: 365.837))
        clipPath2.addCurve(to: CGPoint(x: 320.499, y: 71.5), control1: CGPoint(x: 72.042, y: 182.147), control2: CGPoint(x: 183.025, y: 73.241))
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
        
        
        /*  Odometer Shapes  */
        /*  Shape 34  */
        let pathRef34 = CGMutablePath()
        pathRef34.move(to: CGPoint(x: 176, y: 455.333))
        pathRef34.addLine(to: CGPoint(x: 464, y: 455.333))
        pathRef34.addLine(to: CGPoint(x: 464, y: 503.333))
        pathRef34.addLine(to: CGPoint(x: 176, y: 503.333))
        pathRef34.addLine(to: CGPoint(x: 176, y: 455.333))
        pathRef34.closeSubpath()
        
        /*  Drop Shadow  */
        let shadowColor3 = CGColor(colorSpace: colorSpace, components: [0.722, 0.722, 0.722, 1])
        
        let shadowPath3 = CGMutablePath()
        shadowPath3.move(to: CGPoint(x: 141.5, y: 451.833))
        shadowPath3.addCurve(to: CGPoint(x: 145.5, y: 455.833), control1: CGPoint(x: 143.709, y: 451.833), control2: CGPoint(x: 145.5, y: 453.624))
        shadowPath3.addLine(to: CGPoint(x: 145.5, y: 503.833))
        shadowPath3.addCurve(to: CGPoint(x: 141.5, y: 507.833), control1: CGPoint(x: 145.5, y: 506.042), control2: CGPoint(x: 143.709, y: 507.833))
        shadowPath3.addLine(to: CGPoint(x: -146.5, y: 507.833))
        shadowPath3.addCurve(to: CGPoint(x: -150.5, y: 503.833), control1: CGPoint(x: -148.709, y: 507.833), control2: CGPoint(x: -150.5, y: 506.042))
        shadowPath3.addLine(to: CGPoint(x: -150.5, y: 455.833))
        shadowPath3.addCurve(to: CGPoint(x: -146.5, y: 451.833), control1: CGPoint(x: -150.5, y: 453.624), control2: CGPoint(x: -148.709, y: 451.833))
        shadowPath3.addLine(to: CGPoint(x: 141.5, y: 451.833))
        shadowPath3.closeSubpath()
        
        let clipPath3 = CGMutablePath()
        clipPath3.move(to: CGPoint(x: 159.5, y: 423.833))
        clipPath3.addLine(to: CGPoint(x: 481.5, y: 423.833))
        clipPath3.addLine(to: CGPoint(x: 481.5, y: 535.833))
        clipPath3.addLine(to: CGPoint(x: 159.5, y: 535.833))
        clipPath3.closeSubpath()
        clipPath3.move(to: CGPoint(x: 464.5, y: 451.833))
        clipPath3.addLine(to: CGPoint(x: 176.5, y: 451.833))
        clipPath3.addCurve(to: CGPoint(x: 172.5, y: 455.833), control1: CGPoint(x: 174.291, y: 451.833), control2: CGPoint(x: 172.5, y: 453.624))
        clipPath3.addLine(to: CGPoint(x: 172.5, y: 503.833))
        clipPath3.addCurve(to: CGPoint(x: 176.5, y: 507.833), control1: CGPoint(x: 172.5, y: 506.042), control2: CGPoint(x: 174.291, y: 507.833))
        clipPath3.addLine(to: CGPoint(x: 464.5, y: 507.833))
        clipPath3.addCurve(to: CGPoint(x: 468.5, y: 503.833), control1: CGPoint(x: 466.709, y: 507.833), control2: CGPoint(x: 468.5, y: 506.042))
        clipPath3.addLine(to: CGPoint(x: 468.5, y: 455.833))
        clipPath3.addCurve(to: CGPoint(x: 464.5, y: 451.833), control1: CGPoint(x: 468.5, y: 453.624), control2: CGPoint(x: 466.709, y: 451.833))
        clipPath3.closeSubpath()
        
        ctx.saveGState()
        ctx.addPath(clipPath3)
        ctx.clip()
        
        ctx.translateBy(x: 0, y: 15)
        ctx.setShadow(offset: CGSize(width: (323 * scaleFactor), height: 0), blur: (12 * scaleFactor), color: shadowColor3)
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(shadowPath3)
        ctx.fillPath()
        
        ctx.restoreGState()
        
        ctx.setFillColor(red: 1, green: 1, blue: 1, alpha: 1)
        ctx.addPath(pathRef34)
        ctx.fillPath()
        
        ctx.setLineWidth(8)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef34)
        ctx.strokePath()
        
        
        /*  Shape 35  */
        let pathRef35 = CGMutablePath()
        pathRef35.move(to: CGPoint(x: 176, y: 455.333))
        pathRef35.addLine(to: CGPoint(x: 224, y: 455.333))
        pathRef35.addLine(to: CGPoint(x: 224, y: 503.333))
        pathRef35.addLine(to: CGPoint(x: 176, y: 503.333))
        pathRef35.addLine(to: CGPoint(x: 176, y: 455.333))
        pathRef35.closeSubpath()
        
        /*  Gradient Fill  */
        ctx.saveGState()
        ctx.addPath(pathRef35)
        ctx.clip()
        
        let gradientColors2: [CGFloat] = [
            0.514, 0.514, 0.514, 1,
            0.933, 0.933, 0.933, 1,
            0.933, 0.933, 0.933, 1,
            0.51, 0.51, 0.51, 1]
        let gradientLocations2: [CGFloat] = [0, 0.554, 0.62, 1]
        
        guard let gradientRef2 = CGGradient(colorSpace: colorSpace, colorComponents: gradientColors2, locations: gradientLocations2, count: 4) else { return }
        ctx.drawLinearGradient(gradientRef2, start: CGPoint(x: 200.5, y: 503.833), end: CGPoint(x: 200.5, y: 455.833), options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        ctx.restoreGState()
        
        ctx.setLineWidth(3)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef35)
        ctx.strokePath()
        
        
        /*  Shape 36  */
        let pathRef36 = CGMutablePath()
        pathRef36.move(to: CGPoint(x: 224, y: 455.333))
        pathRef36.addLine(to: CGPoint(x: 272, y: 455.333))
        pathRef36.addLine(to: CGPoint(x: 272, y: 503.333))
        pathRef36.addLine(to: CGPoint(x: 224, y: 503.333))
        pathRef36.addLine(to: CGPoint(x: 224, y: 455.333))
        pathRef36.closeSubpath()
        
        /*  Gradient Fill  */
        ctx.saveGState()
        ctx.addPath(pathRef36)
        ctx.clip()
        
        let gradientColors3: [CGFloat] = [
            0.514, 0.514, 0.514, 1,
            0.933, 0.933, 0.933, 1,
            0.933, 0.933, 0.933, 1,
            0.51, 0.51, 0.51, 1]
        let gradientLocations3: [CGFloat] = [0, 0.493, 0.562, 1]
        
        guard let gradientRef3 = CGGradient(colorSpace: colorSpace, colorComponents: gradientColors3, locations: gradientLocations3, count: 4) else { return }
        ctx.drawLinearGradient(gradientRef3, start: CGPoint(x: 248.5, y: 503.833), end: CGPoint(x: 248.5, y: 455.833), options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        ctx.restoreGState()
        
        ctx.setLineWidth(3)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef36)
        ctx.strokePath()
        
        
        /*  Shape 37  */
        let pathRef37 = CGMutablePath()
        pathRef37.move(to: CGPoint(x: 272, y: 455.333))
        pathRef37.addLine(to: CGPoint(x: 320, y: 455.333))
        pathRef37.addLine(to: CGPoint(x: 320, y: 503.333))
        pathRef37.addLine(to: CGPoint(x: 272, y: 503.333))
        pathRef37.addLine(to: CGPoint(x: 272, y: 455.333))
        pathRef37.closeSubpath()
        
        /*  Gradient Fill  */
        ctx.saveGState()
        ctx.addPath(pathRef37)
        ctx.clip()
        
        let gradientColors4: [CGFloat] = [
            0.514, 0.514, 0.514, 1,
            0.933, 0.933, 0.933, 1,
            0.933, 0.933, 0.933, 1,
            0.51, 0.51, 0.51, 1]
        let gradientLocations4: [CGFloat] = [0, 0.554, 0.62, 1]
        
        guard let gradientRef4 = CGGradient(colorSpace: colorSpace, colorComponents: gradientColors4, locations: gradientLocations4, count: 4) else { return }
        ctx.drawLinearGradient(gradientRef4, start: CGPoint(x: 296.5, y: 503.833), end: CGPoint(x: 296.5, y: 455.833), options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        ctx.restoreGState()
        
        ctx.setLineWidth(3)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef37)
        ctx.strokePath()
        
        
        /*  Shape 38  */
        let pathRef38 = CGMutablePath()
        pathRef38.move(to: CGPoint(x: 320, y: 455.333))
        pathRef38.addLine(to: CGPoint(x: 368, y: 455.333))
        pathRef38.addLine(to: CGPoint(x: 368, y: 503.333))
        pathRef38.addLine(to: CGPoint(x: 320, y: 503.333))
        pathRef38.addLine(to: CGPoint(x: 320, y: 455.333))
        pathRef38.closeSubpath()
        
        /*  Gradient Fill  */
        ctx.saveGState()
        ctx.addPath(pathRef38)
        ctx.clip()
        
        let gradientColors5: [CGFloat] = [
            0.514, 0.514, 0.514, 1,
            0.933, 0.933, 0.933, 1,
            0.933, 0.933, 0.933, 1,
            0.51, 0.51, 0.51, 1]
        let gradientLocations5: [CGFloat] = [0, 0.644, 0.702, 1]
        
        guard let gradientRef5 = CGGradient(colorSpace: colorSpace, colorComponents: gradientColors5, locations: gradientLocations5, count: 4) else { return }
        ctx.drawLinearGradient(gradientRef5, start: CGPoint(x: 344.5, y: 503.833), end: CGPoint(x: 344.5, y: 455.833), options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        ctx.restoreGState()
        
        ctx.setLineWidth(3)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef38)
        ctx.strokePath()
        
        
        /*  Shape 39  */
        let pathRef39 = CGMutablePath()
        pathRef39.move(to: CGPoint(x: 368, y: 455.333))
        pathRef39.addLine(to: CGPoint(x: 416, y: 455.333))
        pathRef39.addLine(to: CGPoint(x: 416, y: 503.333))
        pathRef39.addLine(to: CGPoint(x: 368, y: 503.333))
        pathRef39.addLine(to: CGPoint(x: 368, y: 455.333))
        pathRef39.closeSubpath()
        
        /*  Gradient Fill  */
        ctx.saveGState()
        ctx.addPath(pathRef39)
        ctx.clip()
        
        let gradientColors6: [CGFloat] = [
            0.514, 0.514, 0.514, 1,
            0.933, 0.933, 0.933, 1,
            0.933, 0.933, 0.933, 1,
            0.51, 0.51, 0.51, 1]
        let gradientLocations6: [CGFloat] = [0, 0.554, 0.62, 1]
        
        guard let gradientRef6 = CGGradient(colorSpace: colorSpace, colorComponents: gradientColors6, locations: gradientLocations6, count: 4) else { return }
        ctx.drawLinearGradient(gradientRef6, start: CGPoint(x: 392.5, y: 503.833), end: CGPoint(x: 392.5, y: 455.833), options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        ctx.restoreGState()
        
        ctx.setLineWidth(3)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef39)
        ctx.strokePath()
        
        
        /*  Shape 40  */
        let pathRef40 = CGMutablePath()
        pathRef40.move(to: CGPoint(x: 416, y: 455.333))
        pathRef40.addLine(to: CGPoint(x: 464, y: 455.333))
        pathRef40.addLine(to: CGPoint(x: 464, y: 503.333))
        pathRef40.addLine(to: CGPoint(x: 416, y: 503.333))
        pathRef40.addLine(to: CGPoint(x: 416, y: 455.333))
        pathRef40.closeSubpath()
        
        /*  Gradient Fill  */
        ctx.saveGState()
        ctx.addPath(pathRef40)
        ctx.clip()
        
        let gradientColors7: [CGFloat] = [
            0.514, 0.514, 0.514, 1,
            0.933, 0.933, 0.933, 1,
            0.933, 0.933, 0.933, 1,
            0.51, 0.51, 0.51, 1]
        let gradientLocations7: [CGFloat] = [0, 0.484, 0.553, 1]
        
        guard let gradientRef7 = CGGradient(colorSpace: colorSpace, colorComponents: gradientColors7, locations: gradientLocations7, count: 4) else { return }
        ctx.drawLinearGradient(gradientRef7, start: CGPoint(x: 440.5, y: 503.833), end: CGPoint(x: 440.5, y: 455.833), options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        ctx.restoreGState()
        
        ctx.setLineWidth(3)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef40)
        ctx.strokePath()
        
        
        /*  Logo Shapes  */
        /*  Shape 41  */
        let pathRef41 = CGMutablePath()
        pathRef41.move(to: CGPoint(x: 263.02, y: 247.452))
        pathRef41.addLine(to: CGPoint(x: 263.746, y: 248.178))
        pathRef41.addQuadCurve(to: CGPoint(x: 260.383, y: 251.694), control: CGPoint(x: 261.824, y: 250.592))
        pathRef41.addQuadCurve(to: CGPoint(x: 258.262, y: 252.795), control: CGPoint(x: 258.941, y: 252.795))
        pathRef41.addQuadCurve(to: CGPoint(x: 257.699, y: 251.788), control: CGPoint(x: 257.699, y: 252.795))
        pathRef41.addQuadCurve(to: CGPoint(x: 261.004, y: 244.053), control: CGPoint(x: 257.699, y: 249.28))
        pathRef41.addQuadCurve(to: CGPoint(x: 263.793, y: 239.014), control: CGPoint(x: 263.793, y: 239.53))
        pathRef41.addQuadCurve(to: CGPoint(x: 263.418, y: 238.569), control: CGPoint(x: 263.793, y: 238.569))
        pathRef41.addQuadCurve(to: CGPoint(x: 260.113, y: 241.522), control: CGPoint(x: 262.762, y: 238.569))
        pathRef41.addQuadCurve(to: CGPoint(x: 253.574, y: 249.866), control: CGPoint(x: 257.465, y: 244.475))
        pathRef41.addQuadCurve(to: CGPoint(x: 247.527, y: 258.444), control: CGPoint(x: 249.168, y: 255.866))
        pathRef41.addQuadCurve(to: CGPoint(x: 252.648, y: 259.229), control: CGPoint(x: 250.645, y: 258.749))
        pathRef41.addQuadCurve(to: CGPoint(x: 258.461, y: 260.788), control: CGPoint(x: 254.652, y: 259.709))
        pathRef41.addQuadCurve(to: CGPoint(x: 264.074, y: 262.053), control: CGPoint(x: 262.27, y: 261.866))
        pathRef41.addQuadCurve(to: CGPoint(x: 261.039, y: 265.463), control: CGPoint(x: 261.871, y: 264.561))
        pathRef41.addQuadCurve(to: CGPoint(x: 259.762, y: 266.553), control: CGPoint(x: 260.207, y: 266.366))
        pathRef41.addQuadCurve(to: CGPoint(x: 257.676, y: 266.588), control: CGPoint(x: 259.059, y: 266.858))
        pathRef41.addQuadCurve(to: CGPoint(x: 253.293, y: 265.545), control: CGPoint(x: 256.293, y: 266.319))
        pathRef41.addQuadCurve(to: CGPoint(x: 247.68, y: 264.256), control: CGPoint(x: 250.293, y: 264.772))
        pathRef41.addQuadCurve(to: CGPoint(x: 242.91, y: 263.741), control: CGPoint(x: 245.066, y: 263.741))
        pathRef41.addQuadCurve(to: CGPoint(x: 240.812, y: 264.022), control: CGPoint(x: 241.691, y: 263.741))
        pathRef41.addQuadCurve(to: CGPoint(x: 238.375, y: 264.948), control: CGPoint(x: 239.934, y: 264.303))
        pathRef41.addQuadCurve(to: CGPoint(x: 236.184, y: 265.592), control: CGPoint(x: 236.816, y: 265.592))
        pathRef41.addQuadCurve(to: CGPoint(x: 235.27, y: 264.842), control: CGPoint(x: 235.27, y: 265.592))
        pathRef41.addQuadCurve(to: CGPoint(x: 235.574, y: 263.881), control: CGPoint(x: 235.27, y: 264.42))
        pathRef41.addQuadCurve(to: CGPoint(x: 237.074, y: 261.514), control: CGPoint(x: 236.348, y: 262.639))
        pathRef41.addQuadCurve(to: CGPoint(x: 238.621, y: 259.756), control: CGPoint(x: 237.801, y: 260.389))
        pathRef41.addQuadCurve(to: CGPoint(x: 240.988, y: 258.772), control: CGPoint(x: 239.441, y: 259.124))
        pathRef41.addQuadCurve(to: CGPoint(x: 245.066, y: 258.397), control: CGPoint(x: 242.535, y: 258.42))
        pathRef41.addQuadCurve(to: CGPoint(x: 252.191, y: 248.002), control: CGPoint(x: 248.887, y: 252.538))
        pathRef41.addQuadCurve(to: CGPoint(x: 258.203, y: 240.35), control: CGPoint(x: 255.496, y: 243.467))
        pathRef41.addQuadCurve(to: CGPoint(x: 262.949, y: 235.627), control: CGPoint(x: 260.91, y: 237.233))
        pathRef41.addQuadCurve(to: CGPoint(x: 266.184, y: 234.022), control: CGPoint(x: 264.988, y: 234.022))
        pathRef41.addQuadCurve(to: CGPoint(x: 267.496, y: 234.491), control: CGPoint(x: 267.027, y: 234.022))
        pathRef41.addQuadCurve(to: CGPoint(x: 267.965, y: 235.803), control: CGPoint(x: 267.965, y: 234.959))
        pathRef41.addQuadCurve(to: CGPoint(x: 263.02, y: 247.452), control: CGPoint(x: 267.965, y: 238.616))
        pathRef41.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef41)
        ctx.fillPath()
        
        
        /*  Shape 42  */
        let pathRef42 = CGMutablePath()
        pathRef42.move(to: CGPoint(x: 276.332, y: 247.358))
        pathRef42.addQuadCurve(to: CGPoint(x: 275.219, y: 246.913), control: CGPoint(x: 275.746, y: 247.358))
        pathRef42.addQuadCurve(to: CGPoint(x: 274.691, y: 245.788), control: CGPoint(x: 274.691, y: 246.467))
        pathRef42.addQuadCurve(to: CGPoint(x: 275.676, y: 243.491), control: CGPoint(x: 274.691, y: 244.756))
        pathRef42.addQuadCurve(to: CGPoint(x: 277.715, y: 242.225), control: CGPoint(x: 276.66, y: 242.225))
        pathRef42.addQuadCurve(to: CGPoint(x: 278.887, y: 242.659), control: CGPoint(x: 278.418, y: 242.225))
        pathRef42.addQuadCurve(to: CGPoint(x: 279.355, y: 243.913), control: CGPoint(x: 279.355, y: 243.092))
        pathRef42.addQuadCurve(to: CGPoint(x: 278.395, y: 246.139), control: CGPoint(x: 279.355, y: 244.92))
        pathRef42.addQuadCurve(to: CGPoint(x: 276.332, y: 247.358), control: CGPoint(x: 277.434, y: 247.358))
        pathRef42.closeSubpath()
        pathRef42.move(to: CGPoint(x: 277.926, y: 257.834))
        pathRef42.addLine(to: CGPoint(x: 277.926, y: 259.545))
        pathRef42.addQuadCurve(to: CGPoint(x: 273.684, y: 263.963), control: CGPoint(x: 275.652, y: 262.475))
        pathRef42.addQuadCurve(to: CGPoint(x: 270.332, y: 265.452), control: CGPoint(x: 271.715, y: 265.452))
        pathRef42.addQuadCurve(to: CGPoint(x: 267.473, y: 263.436), control: CGPoint(x: 268.41, y: 265.452))
        pathRef42.addQuadCurve(to: CGPoint(x: 266.535, y: 259.03), control: CGPoint(x: 266.535, y: 261.42))
        pathRef42.addQuadCurve(to: CGPoint(x: 266.723, y: 257.284), control: CGPoint(x: 266.535, y: 258.116))
        pathRef42.addQuadCurve(to: CGPoint(x: 267.168, y: 255.913), control: CGPoint(x: 266.91, y: 256.452))
        pathRef42.addQuadCurve(to: CGPoint(x: 268.129, y: 254.225), control: CGPoint(x: 267.426, y: 255.374))
        pathRef42.addQuadCurve(to: CGPoint(x: 274.223, y: 249.045), control: CGPoint(x: 271.457, y: 249.045))
        pathRef42.addQuadCurve(to: CGPoint(x: 275.652, y: 250.147), control: CGPoint(x: 275.652, y: 249.045))
        pathRef42.addQuadCurve(to: CGPoint(x: 274.727, y: 252.491), control: CGPoint(x: 275.652, y: 250.897))
        pathRef42.addQuadCurve(to: CGPoint(x: 273.074, y: 254.764), control: CGPoint(x: 273.801, y: 254.084))
        pathRef42.addQuadCurve(to: CGPoint(x: 270.414, y: 257.506), control: CGPoint(x: 271.035, y: 256.733))
        pathRef42.addQuadCurve(to: CGPoint(x: 269.793, y: 259.264), control: CGPoint(x: 269.793, y: 258.28))
        pathRef42.addQuadCurve(to: CGPoint(x: 270.426, y: 260.67), control: CGPoint(x: 269.793, y: 260.108))
        pathRef42.addQuadCurve(to: CGPoint(x: 272.066, y: 261.233), control: CGPoint(x: 271.059, y: 261.233))
        pathRef42.addQuadCurve(to: CGPoint(x: 274.492, y: 260.424), control: CGPoint(x: 273.168, y: 261.233))
        pathRef42.addQuadCurve(to: CGPoint(x: 277.926, y: 257.834), control: CGPoint(x: 275.816, y: 259.616))
        pathRef42.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef42)
        ctx.fillPath()
        
        
        /*  Shape 43  */
        let pathRef43 = CGMutablePath()
        pathRef43.move(to: CGPoint(x: 290.77, y: 257.834))
        pathRef43.addLine(to: CGPoint(x: 290.77, y: 259.452))
        pathRef43.addQuadCurve(to: CGPoint(x: 288.637, y: 261.491), control: CGPoint(x: 289.363, y: 260.858))
        pathRef43.addQuadCurve(to: CGPoint(x: 286.645, y: 262.78), control: CGPoint(x: 287.91, y: 262.124))
        pathRef43.addQuadCurve(to: CGPoint(x: 286.434, y: 266.413), control: CGPoint(x: 286.645, y: 264.913))
        pathRef43.addQuadCurve(to: CGPoint(x: 285.496, y: 269.565), control: CGPoint(x: 286.223, y: 267.913))
        pathRef43.addQuadCurve(to: CGPoint(x: 283.246, y: 273.186), control: CGPoint(x: 284.77, y: 271.217))
        pathRef43.addQuadCurve(to: CGPoint(x: 280.293, y: 276.174), control: CGPoint(x: 281.746, y: 275.131))
        pathRef43.addQuadCurve(to: CGPoint(x: 278.02, y: 277.217), control: CGPoint(x: 278.84, y: 277.217))
        pathRef43.addQuadCurve(to: CGPoint(x: 276.332, y: 275.717), control: CGPoint(x: 277.105, y: 277.217))
        pathRef43.addQuadCurve(to: CGPoint(x: 275.559, y: 271.991), control: CGPoint(x: 275.559, y: 274.217))
        pathRef43.addQuadCurve(to: CGPoint(x: 276.285, y: 267.491), control: CGPoint(x: 275.559, y: 269.858))
        pathRef43.addQuadCurve(to: CGPoint(x: 278.535, y: 261.374), control: CGPoint(x: 277.012, y: 265.124))
        pathRef43.addQuadCurve(to: CGPoint(x: 277.387, y: 258.397), control: CGPoint(x: 277.387, y: 259.874))
        pathRef43.addQuadCurve(to: CGPoint(x: 277.996, y: 256.569), control: CGPoint(x: 277.387, y: 257.202))
        pathRef43.addQuadCurve(to: CGPoint(x: 279.73, y: 255.42), control: CGPoint(x: 278.605, y: 255.936))
        pathRef43.addQuadCurve(to: CGPoint(x: 281.289, y: 253.229), control: CGPoint(x: 280.551, y: 254.131))
        pathRef43.addQuadCurve(to: CGPoint(x: 283.293, y: 250.827), control: CGPoint(x: 282.027, y: 252.327))
        pathRef43.addQuadCurve(to: CGPoint(x: 289.012, y: 239.108), control: CGPoint(x: 285.73, y: 244.827))
        pathRef43.addQuadCurve(to: CGPoint(x: 290.324, y: 236.963), control: CGPoint(x: 289.926, y: 237.514))
        pathRef43.addQuadCurve(to: CGPoint(x: 291.168, y: 236.413), control: CGPoint(x: 290.723, y: 236.413))
        pathRef43.addQuadCurve(to: CGPoint(x: 291.871, y: 236.999), control: CGPoint(x: 291.566, y: 236.413))
        pathRef43.addQuadCurve(to: CGPoint(x: 292.176, y: 238.522), control: CGPoint(x: 292.176, y: 237.584))
        pathRef43.addQuadCurve(to: CGPoint(x: 291.93, y: 240.631), control: CGPoint(x: 292.176, y: 239.67))
        pathRef43.addQuadCurve(to: CGPoint(x: 291.227, y: 242.565), control: CGPoint(x: 291.684, y: 241.592))
        pathRef43.addQuadCurve(to: CGPoint(x: 289.961, y: 244.897), control: CGPoint(x: 290.77, y: 243.538))
        pathRef43.addQuadCurve(to: CGPoint(x: 288.965, y: 246.584), control: CGPoint(x: 289.152, y: 246.256))
        pathRef43.addQuadCurve(to: CGPoint(x: 286.316, y: 251.155), control: CGPoint(x: 287.793, y: 248.647))
        pathRef43.addQuadCurve(to: CGPoint(x: 283.984, y: 255.116), control: CGPoint(x: 284.84, y: 253.663))
        pathRef43.addQuadCurve(to: CGPoint(x: 282.754, y: 257.295), control: CGPoint(x: 283.129, y: 256.569))
        pathRef43.addQuadCurve(to: CGPoint(x: 284.758, y: 259.194), control: CGPoint(x: 284.02, y: 258.397))
        pathRef43.addQuadCurve(to: CGPoint(x: 286.035, y: 261.092), control: CGPoint(x: 285.496, y: 259.991))
        pathRef43.addQuadCurve(to: CGPoint(x: 287.488, y: 260.366), control: CGPoint(x: 286.832, y: 260.788))
        pathRef43.addQuadCurve(to: CGPoint(x: 289.035, y: 259.206), control: CGPoint(x: 288.145, y: 259.944))
        pathRef43.addQuadCurve(to: CGPoint(x: 290.77, y: 257.834), control: CGPoint(x: 289.926, y: 258.467))
        pathRef43.closeSubpath()
        pathRef43.move(to: CGPoint(x: 283.762, y: 264.116))
        pathRef43.addLine(to: CGPoint(x: 283.715, y: 263.624))
        pathRef43.addQuadCurve(to: CGPoint(x: 282.66, y: 263.659), control: CGPoint(x: 283.059, y: 263.694))
        pathRef43.addQuadCurve(to: CGPoint(x: 281.734, y: 263.459), control: CGPoint(x: 282.262, y: 263.624))
        pathRef43.addQuadCurve(to: CGPoint(x: 280.914, y: 263.155), control: CGPoint(x: 281.207, y: 263.295))
        pathRef43.addQuadCurve(to: CGPoint(x: 280.27, y: 262.874), control: CGPoint(x: 280.621, y: 263.014))
        pathRef43.addQuadCurve(to: CGPoint(x: 278.488, y: 270.116), control: CGPoint(x: 278.488, y: 267.233))
        pathRef43.addQuadCurve(to: CGPoint(x: 278.922, y: 272.553), control: CGPoint(x: 278.488, y: 271.545))
        pathRef43.addQuadCurve(to: CGPoint(x: 279.941, y: 273.561), control: CGPoint(x: 279.355, y: 273.561))
        pathRef43.addQuadCurve(to: CGPoint(x: 281.477, y: 272.483), control: CGPoint(x: 280.551, y: 273.561))
        pathRef43.addQuadCurve(to: CGPoint(x: 283.082, y: 269.295), control: CGPoint(x: 282.402, y: 271.405))
        pathRef43.addQuadCurve(to: CGPoint(x: 283.762, y: 264.116), control: CGPoint(x: 283.762, y: 267.186))
        pathRef43.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef43)
        ctx.fillPath()
        
        
        /*  Shape 44  */
        let pathRef44 = CGMutablePath()
        pathRef44.move(to: CGPoint(x: 293.84, y: 258.678))
        pathRef44.addLine(to: CGPoint(x: 293.84, y: 259.264))
        pathRef44.addQuadCurve(to: CGPoint(x: 294.52, y: 261.42), control: CGPoint(x: 293.84, y: 260.647))
        pathRef44.addQuadCurve(to: CGPoint(x: 296.301, y: 262.194), control: CGPoint(x: 295.199, y: 262.194))
        pathRef44.addQuadCurve(to: CGPoint(x: 298.68, y: 261.655), control: CGPoint(x: 297.449, y: 262.194))
        pathRef44.addQuadCurve(to: CGPoint(x: 301.129, y: 260.225), control: CGPoint(x: 299.91, y: 261.116))
        pathRef44.addQuadCurve(to: CGPoint(x: 304.105, y: 257.834), control: CGPoint(x: 302.348, y: 259.334))
        pathRef44.addLine(to: CGPoint(x: 304.105, y: 259.264))
        pathRef44.addQuadCurve(to: CGPoint(x: 299.137, y: 264.151), control: CGPoint(x: 301.457, y: 262.452))
        pathRef44.addQuadCurve(to: CGPoint(x: 294.426, y: 265.85), control: CGPoint(x: 296.816, y: 265.85))
        pathRef44.addQuadCurve(to: CGPoint(x: 291.121, y: 264.233), control: CGPoint(x: 292.34, y: 265.85))
        pathRef44.addQuadCurve(to: CGPoint(x: 289.902, y: 259.803), control: CGPoint(x: 289.902, y: 262.616))
        pathRef44.addQuadCurve(to: CGPoint(x: 291.051, y: 255.338), control: CGPoint(x: 289.902, y: 257.342))
        pathRef44.addQuadCurve(to: CGPoint(x: 294.801, y: 251.108), control: CGPoint(x: 292.199, y: 253.334))
        pathRef44.addQuadCurve(to: CGPoint(x: 298.34, y: 248.811), control: CGPoint(x: 296.582, y: 249.584))
        pathRef44.addQuadCurve(to: CGPoint(x: 301.48, y: 248.038), control: CGPoint(x: 300.098, y: 248.038))
        pathRef44.addQuadCurve(to: CGPoint(x: 303.227, y: 248.541), control: CGPoint(x: 302.582, y: 248.038))
        pathRef44.addQuadCurve(to: CGPoint(x: 303.871, y: 250.053), control: CGPoint(x: 303.871, y: 249.045))
        pathRef44.addQuadCurve(to: CGPoint(x: 302.77, y: 252.995), control: CGPoint(x: 303.871, y: 251.53))
        pathRef44.addQuadCurve(to: CGPoint(x: 299.406, y: 255.901), control: CGPoint(x: 301.668, y: 254.459))
        pathRef44.addQuadCurve(to: CGPoint(x: 293.84, y: 258.678), control: CGPoint(x: 297.145, y: 257.342))
        pathRef44.closeSubpath()
        pathRef44.move(to: CGPoint(x: 294.074, y: 257.155))
        pathRef44.addQuadCurve(to: CGPoint(x: 297.684, y: 255.116), control: CGPoint(x: 296.184, y: 256.334))
        pathRef44.addQuadCurve(to: CGPoint(x: 299.898, y: 252.784), control: CGPoint(x: 299.184, y: 253.897))
        pathRef44.addQuadCurve(to: CGPoint(x: 300.613, y: 251.155), control: CGPoint(x: 300.613, y: 251.67))
        pathRef44.addQuadCurve(to: CGPoint(x: 300.121, y: 250.616), control: CGPoint(x: 300.613, y: 250.616))
        pathRef44.addQuadCurve(to: CGPoint(x: 298.75, y: 251.155), control: CGPoint(x: 299.699, y: 250.616))
        pathRef44.addQuadCurve(to: CGPoint(x: 296.828, y: 252.561), control: CGPoint(x: 297.801, y: 251.694))
        pathRef44.addQuadCurve(to: CGPoint(x: 295.082, y: 254.6), control: CGPoint(x: 295.855, y: 253.428))
        pathRef44.addQuadCurve(to: CGPoint(x: 294.074, y: 257.155), control: CGPoint(x: 294.309, y: 255.772))
        pathRef44.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef44)
        ctx.fillPath()
        
        
        /*  Shape 45  */
        let pathRef45 = CGMutablePath()
        pathRef45.move(to: CGPoint(x: 335.395, y: 263.061))
        pathRef45.addLine(to: CGPoint(x: 326.559, y: 258.749))
        pathRef45.addQuadCurve(to: CGPoint(x: 322.785, y: 264.842), control: CGPoint(x: 323.184, y: 263.366))
        pathRef45.addQuadCurve(to: CGPoint(x: 321.531, y: 266.612), control: CGPoint(x: 322.504, y: 265.897))
        pathRef45.addQuadCurve(to: CGPoint(x: 320.137, y: 267.327), control: CGPoint(x: 320.559, y: 267.327))
        pathRef45.addQuadCurve(to: CGPoint(x: 318.941, y: 266.413), control: CGPoint(x: 318.941, y: 267.327))
        pathRef45.addQuadCurve(to: CGPoint(x: 320.359, y: 263.448), control: CGPoint(x: 318.941, y: 265.897))
        pathRef45.addQuadCurve(to: CGPoint(x: 324.262, y: 257.67), control: CGPoint(x: 321.777, y: 260.999))
        pathRef45.addQuadCurve(to: CGPoint(x: 322.551, y: 256.92), control: CGPoint(x: 322.879, y: 257.108))
        pathRef45.addQuadCurve(to: CGPoint(x: 322.293, y: 256.206), control: CGPoint(x: 322.223, y: 256.733))
        pathRef45.addQuadCurve(to: CGPoint(x: 323.113, y: 254.553), control: CGPoint(x: 322.363, y: 255.678))
        pathRef45.addQuadCurve(to: CGPoint(x: 324.098, y: 253.229), control: CGPoint(x: 323.77, y: 253.569))
        pathRef45.addQuadCurve(to: CGPoint(x: 324.871, y: 252.69), control: CGPoint(x: 324.426, y: 252.889))
        pathRef45.addQuadCurve(to: CGPoint(x: 325.809, y: 252.42), control: CGPoint(x: 325.316, y: 252.491))
        pathRef45.addQuadCurve(to: CGPoint(x: 328.574, y: 252.069), control: CGPoint(x: 326.301, y: 252.35))
        pathRef45.addQuadCurve(to: CGPoint(x: 332.594, y: 246.655), control: CGPoint(x: 330.426, y: 249.561))
        pathRef45.addQuadCurve(to: CGPoint(x: 335.98, y: 242.131), control: CGPoint(x: 334.762, y: 243.749))
        pathRef45.addQuadCurve(to: CGPoint(x: 330.848, y: 242.952), control: CGPoint(x: 332.301, y: 242.624))
        pathRef45.addQuadCurve(to: CGPoint(x: 328.258, y: 243.456), control: CGPoint(x: 329.301, y: 243.256))
        pathRef45.addQuadCurve(to: CGPoint(x: 326.793, y: 243.807), control: CGPoint(x: 327.215, y: 243.655))
        pathRef45.addQuadCurve(to: CGPoint(x: 326.371, y: 244.241), control: CGPoint(x: 326.371, y: 243.959))
        pathRef45.addQuadCurve(to: CGPoint(x: 326.887, y: 244.592), control: CGPoint(x: 326.371, y: 244.499))
        pathRef45.addQuadCurve(to: CGPoint(x: 328.187, y: 244.686), control: CGPoint(x: 327.402, y: 244.686))
        pathRef45.addQuadCurve(to: CGPoint(x: 329.406, y: 244.745), control: CGPoint(x: 328.973, y: 244.686))
        pathRef45.addQuadCurve(to: CGPoint(x: 329.84, y: 245.014), control: CGPoint(x: 329.84, y: 244.803))
        pathRef45.addQuadCurve(to: CGPoint(x: 329.266, y: 245.284), control: CGPoint(x: 329.84, y: 245.249))
        pathRef45.addQuadCurve(to: CGPoint(x: 326.043, y: 245.436), control: CGPoint(x: 328.691, y: 245.319))
        pathRef45.addQuadCurve(to: CGPoint(x: 323.523, y: 245.53), control: CGPoint(x: 324.543, y: 245.483))
        pathRef45.addQuadCurve(to: CGPoint(x: 322.105, y: 245.577), control: CGPoint(x: 322.504, y: 245.577))
        pathRef45.addQuadCurve(to: CGPoint(x: 321.262, y: 245.249), control: CGPoint(x: 321.566, y: 245.577))
        pathRef45.addQuadCurve(to: CGPoint(x: 320.957, y: 244.381), control: CGPoint(x: 320.957, y: 244.92))
        pathRef45.addQuadCurve(to: CGPoint(x: 321.402, y: 242.905), control: CGPoint(x: 320.957, y: 243.983))
        pathRef45.addQuadCurve(to: CGPoint(x: 322.668, y: 240.725), control: CGPoint(x: 321.848, y: 241.827))
        pathRef45.addQuadCurve(to: CGPoint(x: 324.543, y: 239.014), control: CGPoint(x: 323.488, y: 239.624))
        pathRef45.addQuadCurve(to: CGPoint(x: 328.258, y: 237.549), control: CGPoint(x: 325.738, y: 238.288))
        pathRef45.addQuadCurve(to: CGPoint(x: 333.859, y: 236.354), control: CGPoint(x: 330.777, y: 236.811))
        pathRef45.addQuadCurve(to: CGPoint(x: 339.965, y: 235.897), control: CGPoint(x: 336.941, y: 235.897))
        pathRef45.addQuadCurve(to: CGPoint(x: 343.539, y: 236.108), control: CGPoint(x: 341.793, y: 235.897))
        pathRef45.addQuadCurve(to: CGPoint(x: 346.703, y: 236.624), control: CGPoint(x: 345.285, y: 236.319))
        pathRef45.addQuadCurve(to: CGPoint(x: 348.941, y: 237.233), control: CGPoint(x: 348.121, y: 236.928))
        pathRef45.addQuadCurve(to: CGPoint(x: 352.211, y: 239.366), control: CGPoint(x: 351.074, y: 237.936))
        pathRef45.addQuadCurve(to: CGPoint(x: 353.348, y: 242.506), control: CGPoint(x: 353.348, y: 240.795))
        pathRef45.addQuadCurve(to: CGPoint(x: 352.773, y: 245.752), control: CGPoint(x: 353.348, y: 244.17))
        pathRef45.addQuadCurve(to: CGPoint(x: 351.016, y: 248.682), control: CGPoint(x: 352.199, y: 247.334))
        pathRef45.addQuadCurve(to: CGPoint(x: 348.168, y: 250.874), control: CGPoint(x: 349.832, y: 250.03))
        pathRef45.addQuadCurve(to: CGPoint(x: 344.043, y: 252.303), control: CGPoint(x: 346.809, y: 251.577))
        pathRef45.addQuadCurve(to: CGPoint(x: 337.363, y: 253.592), control: CGPoint(x: 341.277, y: 253.03))
        pathRef45.addQuadCurve(to: CGPoint(x: 328.621, y: 254.413), control: CGPoint(x: 333.449, y: 254.155))
        pathRef45.addQuadCurve(to: CGPoint(x: 335.359, y: 256.956), control: CGPoint(x: 332.23, y: 255.678))
        pathRef45.addQuadCurve(to: CGPoint(x: 340.633, y: 259.229), control: CGPoint(x: 338.488, y: 258.233))
        pathRef45.addQuadCurve(to: CGPoint(x: 343.996, y: 260.858), control: CGPoint(x: 342.777, y: 260.225))
        pathRef45.addQuadCurve(to: CGPoint(x: 346.223, y: 262.147), control: CGPoint(x: 345.707, y: 261.749))
        pathRef45.addQuadCurve(to: CGPoint(x: 346.902, y: 263.178), control: CGPoint(x: 346.738, y: 262.545))
        pathRef45.addQuadCurve(to: CGPoint(x: 347.066, y: 265.264), control: CGPoint(x: 347.066, y: 263.811))
        pathRef45.addQuadCurve(to: CGPoint(x: 346.867, y: 267.69), control: CGPoint(x: 347.066, y: 266.905))
        pathRef45.addQuadCurve(to: CGPoint(x: 346.012, y: 268.475), control: CGPoint(x: 346.668, y: 268.475))
        pathRef45.addQuadCurve(to: CGPoint(x: 344.898, y: 268.018), control: CGPoint(x: 345.801, y: 268.475))
        pathRef45.addQuadCurve(to: CGPoint(x: 342.402, y: 266.682), control: CGPoint(x: 343.996, y: 267.561))
        pathRef45.addQuadCurve(to: CGPoint(x: 339.508, y: 265.112), control: CGPoint(x: 340.809, y: 265.803))
        pathRef45.addQuadCurve(to: CGPoint(x: 335.395, y: 263.061), control: CGPoint(x: 338.207, y: 264.42))
        pathRef45.closeSubpath()
        pathRef45.move(to: CGPoint(x: 337.457, y: 241.897))
        pathRef45.addQuadCurve(to: CGPoint(x: 337.492, y: 242.202), control: CGPoint(x: 337.48, y: 242.061))
        pathRef45.addQuadCurve(to: CGPoint(x: 337.504, y: 242.6), control: CGPoint(x: 337.504, y: 242.342))
        pathRef45.addQuadCurve(to: CGPoint(x: 337.094, y: 244.112), control: CGPoint(x: 337.504, y: 243.256))
        pathRef45.addQuadCurve(to: CGPoint(x: 336.039, y: 245.87), control: CGPoint(x: 336.684, y: 244.967))
        pathRef45.addQuadCurve(to: CGPoint(x: 334.117, y: 248.448), control: CGPoint(x: 335.395, y: 246.772))
        pathRef45.addQuadCurve(to: CGPoint(x: 331.762, y: 251.53), control: CGPoint(x: 332.84, y: 250.124))
        pathRef45.addQuadCurve(to: CGPoint(x: 340.164, y: 249.725), control: CGPoint(x: 336.684, y: 250.592))
        pathRef45.addQuadCurve(to: CGPoint(x: 345.895, y: 247.979), control: CGPoint(x: 343.645, y: 248.858))
        pathRef45.addQuadCurve(to: CGPoint(x: 349.281, y: 246.127), control: CGPoint(x: 348.145, y: 247.1))
        pathRef45.addQuadCurve(to: CGPoint(x: 350.418, y: 244.1), control: CGPoint(x: 350.418, y: 245.155))
        pathRef45.addQuadCurve(to: CGPoint(x: 348.039, y: 242.26), control: CGPoint(x: 350.418, y: 242.928))
        pathRef45.addQuadCurve(to: CGPoint(x: 342.215, y: 241.592), control: CGPoint(x: 345.66, y: 241.592))
        pathRef45.addQuadCurve(to: CGPoint(x: 340.727, y: 241.627), control: CGPoint(x: 341.512, y: 241.592))
        pathRef45.addQuadCurve(to: CGPoint(x: 338.852, y: 241.768), control: CGPoint(x: 339.941, y: 241.663))
        pathRef45.addQuadCurve(to: CGPoint(x: 337.457, y: 241.897), control: CGPoint(x: 337.762, y: 241.874))
        pathRef45.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef45)
        ctx.fillPath()
        
        
        /*  Shape 46  */
        let pathRef46 = CGMutablePath()
        pathRef46.move(to: CGPoint(x: 351.801, y: 253.639))
        pathRef46.addQuadCurve(to: CGPoint(x: 358.715, y: 248.834), control: CGPoint(x: 355.363, y: 250.405))
        pathRef46.addQuadCurve(to: CGPoint(x: 363.895, y: 247.264), control: CGPoint(x: 362.066, y: 247.264))
        pathRef46.addQuadCurve(to: CGPoint(x: 364.809, y: 247.674), control: CGPoint(x: 364.387, y: 247.264))
        pathRef46.addQuadCurve(to: CGPoint(x: 365.477, y: 248.624), control: CGPoint(x: 365.23, y: 248.084))
        pathRef46.addQuadCurve(to: CGPoint(x: 365.723, y: 249.42), control: CGPoint(x: 365.723, y: 249.163))
        pathRef46.addQuadCurve(to: CGPoint(x: 365.395, y: 250.041), control: CGPoint(x: 365.723, y: 249.842))
        pathRef46.addQuadCurve(to: CGPoint(x: 364.246, y: 250.522), control: CGPoint(x: 365.066, y: 250.241))
        pathRef46.addQuadCurve(to: CGPoint(x: 364.668, y: 251.483), control: CGPoint(x: 364.41, y: 250.897))
        pathRef46.addQuadCurve(to: CGPoint(x: 365.066, y: 252.432), control: CGPoint(x: 364.926, y: 252.069))
        pathRef46.addQuadCurve(to: CGPoint(x: 365.207, y: 253.077), control: CGPoint(x: 365.207, y: 252.795))
        pathRef46.addQuadCurve(to: CGPoint(x: 364.07, y: 255.174), control: CGPoint(x: 365.207, y: 253.639))
        pathRef46.addQuadCurve(to: CGPoint(x: 362.477, y: 257.436), control: CGPoint(x: 362.934, y: 256.709))
        pathRef46.addQuadCurve(to: CGPoint(x: 362.02, y: 259.217), control: CGPoint(x: 362.02, y: 258.163))
        pathRef46.addQuadCurve(to: CGPoint(x: 363.613, y: 260.952), control: CGPoint(x: 362.02, y: 260.952))
        pathRef46.addQuadCurve(to: CGPoint(x: 368.746, y: 257.881), control: CGPoint(x: 365.254, y: 260.952))
        pathRef46.addLine(to: CGPoint(x: 368.746, y: 259.311))
        pathRef46.addQuadCurve(to: CGPoint(x: 360.262, y: 265.897), control: CGPoint(x: 362.816, y: 265.897))
        pathRef46.addQuadCurve(to: CGPoint(x: 358.961, y: 265.299), control: CGPoint(x: 359.348, y: 265.897))
        pathRef46.addQuadCurve(to: CGPoint(x: 358.574, y: 263.53), control: CGPoint(x: 358.574, y: 264.702))
        pathRef46.addQuadCurve(to: CGPoint(x: 359.91, y: 258.163), control: CGPoint(x: 358.574, y: 261.678))
        pathRef46.addQuadCurve(to: CGPoint(x: 354.824, y: 263.565), control: CGPoint(x: 356.488, y: 261.959))
        pathRef46.addQuadCurve(to: CGPoint(x: 352.082, y: 265.17), control: CGPoint(x: 353.16, y: 265.17))
        pathRef46.addQuadCurve(to: CGPoint(x: 350.793, y: 264.28), control: CGPoint(x: 351.566, y: 265.17))
        pathRef46.addQuadCurve(to: CGPoint(x: 349.422, y: 261.971), control: CGPoint(x: 350.02, y: 263.389))
        pathRef46.addQuadCurve(to: CGPoint(x: 348.824, y: 259.03), control: CGPoint(x: 348.824, y: 260.553))
        pathRef46.addQuadCurve(to: CGPoint(x: 349.035, y: 257.19), control: CGPoint(x: 348.824, y: 257.928))
        pathRef46.addQuadCurve(to: CGPoint(x: 349.855, y: 255.678), control: CGPoint(x: 349.246, y: 256.452))
        pathRef46.addQuadCurve(to: CGPoint(x: 351.801, y: 253.639), control: CGPoint(x: 350.465, y: 254.905))
        pathRef46.closeSubpath()
        pathRef46.move(to: CGPoint(x: 363.027, y: 251.061))
        pathRef46.addQuadCurve(to: CGPoint(x: 354.344, y: 255.795), control: CGPoint(x: 356.934, y: 253.85))
        pathRef46.addQuadCurve(to: CGPoint(x: 351.754, y: 259.803), control: CGPoint(x: 351.754, y: 257.741))
        pathRef46.addQuadCurve(to: CGPoint(x: 352.012, y: 261.034), control: CGPoint(x: 351.754, y: 260.553))
        pathRef46.addQuadCurve(to: CGPoint(x: 352.715, y: 261.514), control: CGPoint(x: 352.27, y: 261.514))
        pathRef46.addQuadCurve(to: CGPoint(x: 353.629, y: 261.186), control: CGPoint(x: 352.973, y: 261.514))
        pathRef46.addQuadCurve(to: CGPoint(x: 358.129, y: 257.401), control: CGPoint(x: 356.09, y: 259.733))
        pathRef46.addQuadCurve(to: CGPoint(x: 363.027, y: 251.061), control: CGPoint(x: 360.168, y: 255.069))
        pathRef46.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef46)
        ctx.fillPath()
        
        
        /*  Shape 47  */
        let pathRef47 = CGMutablePath()
        pathRef47.move(to: CGPoint(x: 384.332, y: 253.592))
        pathRef47.addQuadCurve(to: CGPoint(x: 380.207, y: 259.991), control: CGPoint(x: 380.207, y: 258.186))
        pathRef47.addQuadCurve(to: CGPoint(x: 381.027, y: 260.999), control: CGPoint(x: 380.207, y: 260.999))
        pathRef47.addQuadCurve(to: CGPoint(x: 382.797, y: 260.284), control: CGPoint(x: 381.707, y: 260.999))
        pathRef47.addQuadCurve(to: CGPoint(x: 386.207, y: 257.741), control: CGPoint(x: 383.887, y: 259.569))
        pathRef47.addLine(to: CGPoint(x: 386.207, y: 259.358))
        pathRef47.addQuadCurve(to: CGPoint(x: 381.098, y: 264.092), control: CGPoint(x: 382.879, y: 262.639))
        pathRef47.addQuadCurve(to: CGPoint(x: 378.191, y: 265.545), control: CGPoint(x: 379.316, y: 265.545))
        pathRef47.addQuadCurve(to: CGPoint(x: 376.27, y: 263.014), control: CGPoint(x: 376.27, y: 265.545))
        pathRef47.addQuadCurve(to: CGPoint(x: 376.504, y: 261.538), control: CGPoint(x: 376.27, y: 262.264))
        pathRef47.addQuadCurve(to: CGPoint(x: 377.148, y: 260.026), control: CGPoint(x: 376.738, y: 260.811))
        pathRef47.addQuadCurve(to: CGPoint(x: 378.402, y: 257.776), control: CGPoint(x: 377.559, y: 259.241))
        pathRef47.addQuadCurve(to: CGPoint(x: 380.348, y: 254.459), control: CGPoint(x: 379.246, y: 256.311))
        pathRef47.addQuadCurve(to: CGPoint(x: 376.996, y: 257.155), control: CGPoint(x: 379.012, y: 255.139))
        pathRef47.addQuadCurve(to: CGPoint(x: 374.77, y: 259.557), control: CGPoint(x: 375.684, y: 258.42))
        pathRef47.addQuadCurve(to: CGPoint(x: 372.812, y: 262.088), control: CGPoint(x: 373.855, y: 260.694))
        pathRef47.addQuadCurve(to: CGPoint(x: 371.289, y: 263.963), control: CGPoint(x: 371.77, y: 263.483))
        pathRef47.addQuadCurve(to: CGPoint(x: 370.316, y: 264.444), control: CGPoint(x: 370.809, y: 264.444))
        pathRef47.addQuadCurve(to: CGPoint(x: 368.934, y: 262.874), control: CGPoint(x: 369.566, y: 264.444))
        pathRef47.addQuadCurve(to: CGPoint(x: 368.301, y: 259.217), control: CGPoint(x: 368.301, y: 261.303))
        pathRef47.addQuadCurve(to: CGPoint(x: 368.594, y: 257.202), control: CGPoint(x: 368.301, y: 257.928))
        pathRef47.addQuadCurve(to: CGPoint(x: 369.754, y: 255.139), control: CGPoint(x: 368.887, y: 256.475))
        pathRef47.addQuadCurve(to: CGPoint(x: 372.543, y: 251.495), control: CGPoint(x: 371.371, y: 252.655))
        pathRef47.addQuadCurve(to: CGPoint(x: 374.793, y: 250.334), control: CGPoint(x: 373.715, y: 250.334))
        pathRef47.addQuadCurve(to: CGPoint(x: 376, y: 250.592), control: CGPoint(x: 375.543, y: 250.334))
        pathRef47.addQuadCurve(to: CGPoint(x: 376.457, y: 251.389), control: CGPoint(x: 376.457, y: 250.85))
        pathRef47.addQuadCurve(to: CGPoint(x: 376.316, y: 251.881), control: CGPoint(x: 376.457, y: 251.624))
        pathRef47.addQuadCurve(to: CGPoint(x: 376, y: 252.35), control: CGPoint(x: 376.176, y: 252.139))
        pathRef47.addQuadCurve(to: CGPoint(x: 375.262, y: 253.17), control: CGPoint(x: 375.824, y: 252.561))
        pathRef47.addQuadCurve(to: CGPoint(x: 371.559, y: 258.491), control: CGPoint(x: 371.559, y: 257.272))
        pathRef47.addQuadCurve(to: CGPoint(x: 372.004, y: 259.17), control: CGPoint(x: 371.559, y: 259.17))
        pathRef47.addQuadCurve(to: CGPoint(x: 373.094, y: 258.268), control: CGPoint(x: 372.285, y: 259.17))
        pathRef47.addQuadCurve(to: CGPoint(x: 375.18, y: 255.901), control: CGPoint(x: 373.902, y: 257.366))
        pathRef47.addQuadCurve(to: CGPoint(x: 378.203, y: 252.842), control: CGPoint(x: 376.457, y: 254.436))
        pathRef47.addQuadCurve(to: CGPoint(x: 382.176, y: 249.772), control: CGPoint(x: 379.949, y: 251.249))
        pathRef47.addQuadCurve(to: CGPoint(x: 384.238, y: 248.905), control: CGPoint(x: 383.418, y: 248.905))
        pathRef47.addQuadCurve(to: CGPoint(x: 384.977, y: 249.936), control: CGPoint(x: 384.613, y: 248.905))
        pathRef47.addQuadCurve(to: CGPoint(x: 385.34, y: 252.022), control: CGPoint(x: 385.34, y: 250.967))
        pathRef47.addQuadCurve(to: CGPoint(x: 384.332, y: 253.592), control: CGPoint(x: 385.34, y: 252.538))
        pathRef47.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef47)
        ctx.fillPath()
        
        
        /*  Shape 48  */
        let pathRef48 = CGMutablePath()
        pathRef48.move(to: CGPoint(x: 404.699, y: 259.405))
        pathRef48.addLine(to: CGPoint(x: 396.918, y: 265.803))
        pathRef48.addQuadCurve(to: CGPoint(x: 390.941, y: 274.276), control: CGPoint(x: 393.637, y: 271.475))
        pathRef48.addQuadCurve(to: CGPoint(x: 386.934, y: 277.077), control: CGPoint(x: 388.246, y: 277.077))
        pathRef48.addQuadCurve(to: CGPoint(x: 386.23, y: 276.209), control: CGPoint(x: 386.23, y: 277.077))
        pathRef48.addQuadCurve(to: CGPoint(x: 387.941, y: 271.897), control: CGPoint(x: 386.23, y: 274.522))
        pathRef48.addQuadCurve(to: CGPoint(x: 389.5, y: 269.881), control: CGPoint(x: 388.621, y: 270.866))
        pathRef48.addQuadCurve(to: CGPoint(x: 391.164, y: 268.182), control: CGPoint(x: 390.379, y: 268.897))
        pathRef48.addQuadCurve(to: CGPoint(x: 393.238, y: 266.401), control: CGPoint(x: 391.949, y: 267.467))
        pathRef48.addQuadCurve(to: CGPoint(x: 394.996, y: 264.936), control: CGPoint(x: 394.527, y: 265.334))
        pathRef48.addQuadCurve(to: CGPoint(x: 398.371, y: 257.624), control: CGPoint(x: 397.34, y: 260.155))
        pathRef48.addQuadCurve(to: CGPoint(x: 394.527, y: 261.467), control: CGPoint(x: 396.168, y: 259.967))
        pathRef48.addQuadCurve(to: CGPoint(x: 391.516, y: 263.776), control: CGPoint(x: 392.887, y: 262.967))
        pathRef48.addQuadCurve(to: CGPoint(x: 389.043, y: 264.584), control: CGPoint(x: 390.145, y: 264.584))
        pathRef48.addQuadCurve(to: CGPoint(x: 386.84, y: 262.674), control: CGPoint(x: 387.848, y: 264.584))
        pathRef48.addQuadCurve(to: CGPoint(x: 385.832, y: 258.749), control: CGPoint(x: 385.832, y: 260.764))
        pathRef48.addQuadCurve(to: CGPoint(x: 386.266, y: 256.78), control: CGPoint(x: 385.832, y: 257.811))
        pathRef48.addQuadCurve(to: CGPoint(x: 387.625, y: 254.577), control: CGPoint(x: 386.699, y: 255.749))
        pathRef48.addQuadCurve(to: CGPoint(x: 389.98, y: 252.174), control: CGPoint(x: 388.551, y: 253.405))
        pathRef48.addQuadCurve(to: CGPoint(x: 393.332, y: 249.772), control: CGPoint(x: 391.41, y: 250.944))
        pathRef48.addQuadCurve(to: CGPoint(x: 398.98, y: 247.499), control: CGPoint(x: 396.965, y: 247.499))
        pathRef48.addQuadCurve(to: CGPoint(x: 400.48, y: 248.6), control: CGPoint(x: 400.48, y: 247.499))
        pathRef48.addQuadCurve(to: CGPoint(x: 397.223, y: 251.577), control: CGPoint(x: 400.48, y: 250.124))
        pathRef48.addQuadCurve(to: CGPoint(x: 393.273, y: 253.874), control: CGPoint(x: 395.23, y: 252.444))
        pathRef48.addQuadCurve(to: CGPoint(x: 390.109, y: 256.909), control: CGPoint(x: 391.316, y: 255.303))
        pathRef48.addQuadCurve(to: CGPoint(x: 388.902, y: 259.803), control: CGPoint(x: 388.902, y: 258.514))
        pathRef48.addQuadCurve(to: CGPoint(x: 389.207, y: 260.811), control: CGPoint(x: 388.902, y: 260.436))
        pathRef48.addQuadCurve(to: CGPoint(x: 390.004, y: 261.186), control: CGPoint(x: 389.512, y: 261.186))
        pathRef48.addQuadCurve(to: CGPoint(x: 391.879, y: 260.436), control: CGPoint(x: 390.824, y: 261.186))
        pathRef48.addQuadCurve(to: CGPoint(x: 394.996, y: 257.788), control: CGPoint(x: 392.934, y: 259.686))
        pathRef48.addQuadCurve(to: CGPoint(x: 397.492, y: 254.987), control: CGPoint(x: 395.934, y: 256.92))
        pathRef48.addQuadCurve(to: CGPoint(x: 400.07, y: 252.034), control: CGPoint(x: 399.051, y: 253.053))
        pathRef48.addQuadCurve(to: CGPoint(x: 401.91, y: 251.014), control: CGPoint(x: 401.09, y: 251.014))
        pathRef48.addQuadCurve(to: CGPoint(x: 402.672, y: 251.307), control: CGPoint(x: 402.379, y: 251.014))
        pathRef48.addQuadCurve(to: CGPoint(x: 402.965, y: 252.163), control: CGPoint(x: 402.965, y: 251.6))
        pathRef48.addQuadCurve(to: CGPoint(x: 402.109, y: 255.291), control: CGPoint(x: 402.965, y: 253.241))
        pathRef48.addQuadCurve(to: CGPoint(x: 399.027, y: 262.006), control: CGPoint(x: 401.254, y: 257.342))
        pathRef48.addLine(to: CGPoint(x: 404.699, y: 257.881))
        pathRef48.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef48)
        ctx.fillPath()
        
        
        /*  Shape 49  */
        let pathRef49 = CGMutablePath()
        pathRef49.move(to: CGPoint(x: 408.285, y: 258.678))
        pathRef49.addLine(to: CGPoint(x: 408.285, y: 259.264))
        pathRef49.addQuadCurve(to: CGPoint(x: 408.965, y: 261.42), control: CGPoint(x: 408.285, y: 260.647))
        pathRef49.addQuadCurve(to: CGPoint(x: 410.746, y: 262.194), control: CGPoint(x: 409.645, y: 262.194))
        pathRef49.addQuadCurve(to: CGPoint(x: 413.125, y: 261.655), control: CGPoint(x: 411.895, y: 262.194))
        pathRef49.addQuadCurve(to: CGPoint(x: 415.574, y: 260.225), control: CGPoint(x: 414.355, y: 261.116))
        pathRef49.addQuadCurve(to: CGPoint(x: 418.551, y: 257.834), control: CGPoint(x: 416.793, y: 259.334))
        pathRef49.addLine(to: CGPoint(x: 418.551, y: 259.264))
        pathRef49.addQuadCurve(to: CGPoint(x: 413.582, y: 264.151), control: CGPoint(x: 415.902, y: 262.452))
        pathRef49.addQuadCurve(to: CGPoint(x: 408.871, y: 265.85), control: CGPoint(x: 411.262, y: 265.85))
        pathRef49.addQuadCurve(to: CGPoint(x: 405.566, y: 264.233), control: CGPoint(x: 406.785, y: 265.85))
        pathRef49.addQuadCurve(to: CGPoint(x: 404.348, y: 259.803), control: CGPoint(x: 404.348, y: 262.616))
        pathRef49.addQuadCurve(to: CGPoint(x: 405.496, y: 255.338), control: CGPoint(x: 404.348, y: 257.342))
        pathRef49.addQuadCurve(to: CGPoint(x: 409.246, y: 251.108), control: CGPoint(x: 406.645, y: 253.334))
        pathRef49.addQuadCurve(to: CGPoint(x: 412.785, y: 248.811), control: CGPoint(x: 411.027, y: 249.584))
        pathRef49.addQuadCurve(to: CGPoint(x: 415.926, y: 248.038), control: CGPoint(x: 414.543, y: 248.038))
        pathRef49.addQuadCurve(to: CGPoint(x: 417.672, y: 248.541), control: CGPoint(x: 417.027, y: 248.038))
        pathRef49.addQuadCurve(to: CGPoint(x: 418.316, y: 250.053), control: CGPoint(x: 418.316, y: 249.045))
        pathRef49.addQuadCurve(to: CGPoint(x: 417.215, y: 252.995), control: CGPoint(x: 418.316, y: 251.53))
        pathRef49.addQuadCurve(to: CGPoint(x: 413.852, y: 255.901), control: CGPoint(x: 416.113, y: 254.459))
        pathRef49.addQuadCurve(to: CGPoint(x: 408.285, y: 258.678), control: CGPoint(x: 411.59, y: 257.342))
        pathRef49.closeSubpath()
        pathRef49.move(to: CGPoint(x: 408.52, y: 257.155))
        pathRef49.addQuadCurve(to: CGPoint(x: 412.129, y: 255.116), control: CGPoint(x: 410.629, y: 256.334))
        pathRef49.addQuadCurve(to: CGPoint(x: 414.344, y: 252.784), control: CGPoint(x: 413.629, y: 253.897))
        pathRef49.addQuadCurve(to: CGPoint(x: 415.059, y: 251.155), control: CGPoint(x: 415.059, y: 251.67))
        pathRef49.addQuadCurve(to: CGPoint(x: 414.566, y: 250.616), control: CGPoint(x: 415.059, y: 250.616))
        pathRef49.addQuadCurve(to: CGPoint(x: 413.195, y: 251.155), control: CGPoint(x: 414.145, y: 250.616))
        pathRef49.addQuadCurve(to: CGPoint(x: 411.273, y: 252.561), control: CGPoint(x: 412.246, y: 251.694))
        pathRef49.addQuadCurve(to: CGPoint(x: 409.527, y: 254.6), control: CGPoint(x: 410.301, y: 253.428))
        pathRef49.addQuadCurve(to: CGPoint(x: 408.52, y: 257.155), control: CGPoint(x: 408.754, y: 255.772))
        pathRef49.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef49)
        ctx.fillPath()
        
        
        /*  Text  */
        /*  Text   */
        let attributedStr = NSMutableAttributedString(string: "0")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let textAttribs = [
            .font: UIFont(name: "Helvetica-Bold", size: 48)!,
            .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            .paragraphStyle: paragraphStyle
            ] as [NSAttributedString.Key: Any]
        attributedStr.setAttributes(textAttribs, range: NSRange(location: 0, length: 1))
        
        let textBox = CGRect(x: 136.333, y: 391.167, width: 26.695, height: 60)
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
        
        /*  Text 2  */
        let attributedStr2 = NSMutableAttributedString(string: "120")
        let paragraphStyle2 = NSMutableParagraphStyle()
        paragraphStyle2.alignment = .center
        let textAttribs2 = [
            .font: UIFont(name: "Helvetica-Bold", size: 48)!,
            .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            .paragraphStyle: paragraphStyle2
            ] as [NSAttributedString.Key: Any]
        attributedStr2.setAttributes(textAttribs2, range: NSRange(location: 0, length: 3))
        
        let textBox2 = CGRect(x: 410.609, y: 391.167, width: 103.409, height: 60)
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
        
        /*  Text 3  */
        let attributedStr3 = NSMutableAttributedString(string: "60")
        let paragraphStyle3 = NSMutableParagraphStyle()
        paragraphStyle3.alignment = .center
        let textAttribs3 = [
            .font: UIFont(name: "Helvetica-Bold", size: 48)!,
            .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            .paragraphStyle: paragraphStyle3
            ] as [NSAttributedString.Key: Any]
        attributedStr3.setAttributes(textAttribs3, range: NSRange(location: 0, length: 2))
        
        let textBox3 = CGRect(x: 268.703, y: 95.268, width: 103.409, height: 60)
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
        
        /*  Text 4  */
        let attributedStr4 = NSMutableAttributedString(string: "15")
        let paragraphStyle4 = NSMutableParagraphStyle()
        paragraphStyle4.alignment = .center
        let textAttribs4 = [
            .font: UIFont(name: "Helvetica-Bold", size: 24)!,
            .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            .paragraphStyle: paragraphStyle4
            ] as [NSAttributedString.Key: Any]
        attributedStr4.setAttributes(textAttribs4, range: NSRange(location: 0, length: 2))
        
        let textBox4 = CGRect(x: 87.268, y: 305, width: 63.89, height: 30)
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
        
        /*  Text 5  */
        let attributedStr5 = NSMutableAttributedString(string: "105")
        let paragraphStyle5 = NSMutableParagraphStyle()
        paragraphStyle5.alignment = .center
        let textAttribs5 = [
            .font: UIFont(name: "Helvetica-Bold", size: 24)!,
            .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            .paragraphStyle: paragraphStyle5
            ] as [NSAttributedString.Key: Any]
        attributedStr5.setAttributes(textAttribs5, range: NSRange(location: 0, length: 3))
        
        let textBox5 = CGRect(x: 475.342, y: 305, width: 74.39, height: 30)
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
        
        /*  Text 6  */
        let attributedStr6 = NSMutableAttributedString(string: "30")
        let paragraphStyle6 = NSMutableParagraphStyle()
        paragraphStyle6.alignment = .center
        let textAttribs6 = [
            .font: UIFont(name: "Helvetica-Bold", size: 48)!,
            .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            .paragraphStyle: paragraphStyle6
            ] as [NSAttributedString.Key: Any]
        attributedStr6.setAttributes(textAttribs6, range: NSRange(location: 0, length: 2))
        
        let textBox6 = CGRect(x: 132.835, y: 193.016, width: 59.814, height: 60)
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
        
        /*  Text 7  */
        let attributedStr7 = NSMutableAttributedString(string: "90")
        let paragraphStyle7 = NSMutableParagraphStyle()
        paragraphStyle7.alignment = .center
        let textAttribs7 = [
            .font: UIFont(name: "Helvetica-Bold", size: 48)!,
            .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            .paragraphStyle: paragraphStyle7
            ] as [NSAttributedString.Key: Any]
        attributedStr7.setAttributes(textAttribs7, range: NSRange(location: 0, length: 2))
        
        let textBox7 = CGRect(x: 442.371, y: 193.349, width: 72.314, height: 60)
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
        
        /*  Text 8  */
        let attributedStr8 = NSMutableAttributedString(string: "45")
        let paragraphStyle8 = NSMutableParagraphStyle()
        paragraphStyle8.alignment = .center
        let textAttribs8 = [
            .font: UIFont(name: "Helvetica-Bold", size: 24)!,
            .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            .paragraphStyle: paragraphStyle8
            ] as [NSAttributedString.Key: Any]
        attributedStr8.setAttributes(textAttribs8, range: NSRange(location: 0, length: 2))
        
        let textBox8 = CGRect(x: 193.677, y: 128.106, width: 59.401, height: 30.621)
        let textBoxPath8 = CGPath(rect: CGRect(x: 0, y: 0, width: textBox8.size.width, height: textBox8.size.height), transform: nil)
        let framesetter8 = CTFramesetterCreateWithAttributedString(attributedStr8)
        let frameRef8 = CTFramesetterCreateFrame(framesetter8, CFRange(location: 0, length: 0), textBoxPath8, nil)
        ctx.saveGState()
        ctx.translateBy(x: textBox8.origin.x, y: textBox8.origin.y)
        
        ctx.textMatrix = .identity
        ctx.translateBy(x: 0.0, y: textBox8.size.height)
        ctx.scaleBy(x: 1.0, y: -1.0)
        CTFrameDraw(frameRef8, ctx)
        
        ctx.restoreGState()
        
        /*  Text 9  */
        let attributedStr9 = NSMutableAttributedString(string: "75")
        let paragraphStyle9 = NSMutableParagraphStyle()
        paragraphStyle9.alignment = .center
        let textAttribs9 = [
            .font: UIFont(name: "Helvetica-Bold", size: 24)!,
            .foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1),
            .paragraphStyle: paragraphStyle9
            ] as [NSAttributedString.Key: Any]
        attributedStr9.setAttributes(textAttribs9, range: NSRange(location: 0, length: 2))
        
        let textBox9 = CGRect(x: 387.047, y: 128.106, width: 59.401, height: 30.621)
        let textBoxPath9 = CGPath(rect: CGRect(x: 0, y: 0, width: textBox9.size.width, height: textBox9.size.height), transform: nil)
        let framesetter9 = CTFramesetterCreateWithAttributedString(attributedStr9)
        let frameRef9 = CTFramesetterCreateFrame(framesetter9, CFRange(location: 0, length: 0), textBoxPath9, nil)
        ctx.saveGState()
        ctx.translateBy(x: textBox9.origin.x, y: textBox9.origin.y)
        
        ctx.textMatrix = .identity
        ctx.translateBy(x: 0.0, y: textBox9.size.height)
        ctx.scaleBy(x: 1.0, y: -1.0)
        CTFrameDraw(frameRef9, ctx)
        
        ctx.restoreGState()

    }

}
