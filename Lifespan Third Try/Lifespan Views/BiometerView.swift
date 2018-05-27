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
        pathRef34.move(to: CGPoint(x: 168.3, y: 456))
        pathRef34.addLine(to: CGPoint(x: 456.3, y: 456))
        pathRef34.addLine(to: CGPoint(x: 456.3, y: 504))
        pathRef34.addLine(to: CGPoint(x: 168.3, y: 504))
        pathRef34.addLine(to: CGPoint(x: 168.3, y: 456))
        pathRef34.closeSubpath()
        
        /*  Drop Shadow  */
        let shadowColor3 = CGColor(colorSpace: colorSpace, components: [0.722, 0.722, 0.722, 1])
        
        let shadowPath3 = CGMutablePath()
        shadowPath3.move(to: CGPoint(x: 133.8, y: 452.5))
        shadowPath3.addCurve(to: CGPoint(x: 137.8, y: 456.5), control1: CGPoint(x: 136.009, y: 452.5), control2: CGPoint(x: 137.8, y: 454.291))
        shadowPath3.addLine(to: CGPoint(x: 137.8, y: 504.5))
        shadowPath3.addCurve(to: CGPoint(x: 133.8, y: 508.5), control1: CGPoint(x: 137.8, y: 506.709), control2: CGPoint(x: 136.009, y: 508.5))
        shadowPath3.addLine(to: CGPoint(x: -154.2, y: 508.5))
        shadowPath3.addCurve(to: CGPoint(x: -158.2, y: 504.5), control1: CGPoint(x: -156.409, y: 508.5), control2: CGPoint(x: -158.2, y: 506.709))
        shadowPath3.addLine(to: CGPoint(x: -158.2, y: 456.5))
        shadowPath3.addCurve(to: CGPoint(x: -154.2, y: 452.5), control1: CGPoint(x: -158.2, y: 454.291), control2: CGPoint(x: -156.409, y: 452.5))
        shadowPath3.addLine(to: CGPoint(x: 133.8, y: 452.5))
        shadowPath3.closeSubpath()
        
        let clipPath3 = CGMutablePath()
        clipPath3.move(to: CGPoint(x: 151.8, y: 424.5))
        clipPath3.addLine(to: CGPoint(x: 473.8, y: 424.5))
        clipPath3.addLine(to: CGPoint(x: 473.8, y: 536.5))
        clipPath3.addLine(to: CGPoint(x: 151.8, y: 536.5))
        clipPath3.closeSubpath()
        clipPath3.move(to: CGPoint(x: 456.8, y: 452.5))
        clipPath3.addLine(to: CGPoint(x: 168.8, y: 452.5))
        clipPath3.addCurve(to: CGPoint(x: 164.8, y: 456.5), control1: CGPoint(x: 166.591, y: 452.5), control2: CGPoint(x: 164.8, y: 454.291))
        clipPath3.addLine(to: CGPoint(x: 164.8, y: 504.5))
        clipPath3.addCurve(to: CGPoint(x: 168.8, y: 508.5), control1: CGPoint(x: 164.8, y: 506.709), control2: CGPoint(x: 166.591, y: 508.5))
        clipPath3.addLine(to: CGPoint(x: 456.8, y: 508.5))
        clipPath3.addCurve(to: CGPoint(x: 460.8, y: 504.5), control1: CGPoint(x: 459.009, y: 508.5), control2: CGPoint(x: 460.8, y: 506.709))
        clipPath3.addLine(to: CGPoint(x: 460.8, y: 456.5))
        clipPath3.addCurve(to: CGPoint(x: 456.8, y: 452.5), control1: CGPoint(x: 460.8, y: 454.291), control2: CGPoint(x: 459.009, y: 452.5))
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
        pathRef35.move(to: CGPoint(x: 168.3, y: 456))
        pathRef35.addLine(to: CGPoint(x: 216.3, y: 456))
        pathRef35.addLine(to: CGPoint(x: 216.3, y: 504))
        pathRef35.addLine(to: CGPoint(x: 168.3, y: 504))
        pathRef35.addLine(to: CGPoint(x: 168.3, y: 456))
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
        ctx.drawLinearGradient(gradientRef2, start: CGPoint(x: 192.8, y: 504.5), end: CGPoint(x: 192.8, y: 456.5), options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        ctx.restoreGState()
        
        ctx.setLineWidth(3)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef35)
        ctx.strokePath()
        
        
        /*  Shape 36  */
        let pathRef36 = CGMutablePath()
        pathRef36.move(to: CGPoint(x: 216.3, y: 456))
        pathRef36.addLine(to: CGPoint(x: 264.3, y: 456))
        pathRef36.addLine(to: CGPoint(x: 264.3, y: 504))
        pathRef36.addLine(to: CGPoint(x: 216.3, y: 504))
        pathRef36.addLine(to: CGPoint(x: 216.3, y: 456))
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
        ctx.drawLinearGradient(gradientRef3, start: CGPoint(x: 240.8, y: 504.5), end: CGPoint(x: 240.8, y: 456.5), options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        ctx.restoreGState()
        
        ctx.setLineWidth(3)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef36)
        ctx.strokePath()
        
        
        /*  Shape 37  */
        let pathRef37 = CGMutablePath()
        pathRef37.move(to: CGPoint(x: 264.3, y: 456))
        pathRef37.addLine(to: CGPoint(x: 312.3, y: 456))
        pathRef37.addLine(to: CGPoint(x: 312.3, y: 504))
        pathRef37.addLine(to: CGPoint(x: 264.3, y: 504))
        pathRef37.addLine(to: CGPoint(x: 264.3, y: 456))
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
        ctx.drawLinearGradient(gradientRef4, start: CGPoint(x: 288.8, y: 504.5), end: CGPoint(x: 288.8, y: 456.5), options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        ctx.restoreGState()
        
        ctx.setLineWidth(3)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef37)
        ctx.strokePath()
        
        
        /*  Shape 38  */
        let pathRef38 = CGMutablePath()
        pathRef38.move(to: CGPoint(x: 312.3, y: 456))
        pathRef38.addLine(to: CGPoint(x: 360.3, y: 456))
        pathRef38.addLine(to: CGPoint(x: 360.3, y: 504))
        pathRef38.addLine(to: CGPoint(x: 312.3, y: 504))
        pathRef38.addLine(to: CGPoint(x: 312.3, y: 456))
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
        ctx.drawLinearGradient(gradientRef5, start: CGPoint(x: 336.8, y: 504.5), end: CGPoint(x: 336.8, y: 456.5), options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        ctx.restoreGState()
        
        ctx.setLineWidth(3)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef38)
        ctx.strokePath()
        
        
        /*  Shape 39  */
        let pathRef39 = CGMutablePath()
        pathRef39.move(to: CGPoint(x: 360.3, y: 456))
        pathRef39.addLine(to: CGPoint(x: 408.3, y: 456))
        pathRef39.addLine(to: CGPoint(x: 408.3, y: 504))
        pathRef39.addLine(to: CGPoint(x: 360.3, y: 504))
        pathRef39.addLine(to: CGPoint(x: 360.3, y: 456))
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
        ctx.drawLinearGradient(gradientRef6, start: CGPoint(x: 384.8, y: 504.5), end: CGPoint(x: 384.8, y: 456.5), options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
        ctx.restoreGState()
        
        ctx.setLineWidth(3)
        ctx.setLineCap(.round)
        ctx.setLineJoin(.round)
        ctx.setStrokeColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef39)
        ctx.strokePath()
        
        
        /*  Shape 40  */
        let pathRef40 = CGMutablePath()
        pathRef40.move(to: CGPoint(x: 408.3, y: 456))
        pathRef40.addLine(to: CGPoint(x: 456.3, y: 456))
        pathRef40.addLine(to: CGPoint(x: 456.3, y: 504))
        pathRef40.addLine(to: CGPoint(x: 408.3, y: 504))
        pathRef40.addLine(to: CGPoint(x: 408.3, y: 456))
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
        ctx.drawLinearGradient(gradientRef7, start: CGPoint(x: 432.8, y: 504.5), end: CGPoint(x: 432.8, y: 456.5), options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
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
        pathRef41.move(to: CGPoint(x: 262.758, y: 247.734))
        pathRef41.addLine(to: CGPoint(x: 263.484, y: 248.461))
        pathRef41.addQuadCurve(to: CGPoint(x: 260.121, y: 251.977), control: CGPoint(x: 261.562, y: 250.875))
        pathRef41.addQuadCurve(to: CGPoint(x: 258, y: 253.078), control: CGPoint(x: 258.68, y: 253.078))
        pathRef41.addQuadCurve(to: CGPoint(x: 257.438, y: 252.07), control: CGPoint(x: 257.438, y: 253.078))
        pathRef41.addQuadCurve(to: CGPoint(x: 260.742, y: 244.336), control: CGPoint(x: 257.438, y: 249.562))
        pathRef41.addQuadCurve(to: CGPoint(x: 263.531, y: 239.297), control: CGPoint(x: 263.531, y: 239.812))
        pathRef41.addQuadCurve(to: CGPoint(x: 263.156, y: 238.852), control: CGPoint(x: 263.531, y: 238.852))
        pathRef41.addQuadCurve(to: CGPoint(x: 259.852, y: 241.805), control: CGPoint(x: 262.5, y: 238.852))
        pathRef41.addQuadCurve(to: CGPoint(x: 253.312, y: 250.148), control: CGPoint(x: 257.203, y: 244.758))
        pathRef41.addQuadCurve(to: CGPoint(x: 247.266, y: 258.727), control: CGPoint(x: 248.906, y: 256.148))
        pathRef41.addQuadCurve(to: CGPoint(x: 252.387, y: 259.512), control: CGPoint(x: 250.383, y: 259.031))
        pathRef41.addQuadCurve(to: CGPoint(x: 258.199, y: 261.07), control: CGPoint(x: 254.391, y: 259.992))
        pathRef41.addQuadCurve(to: CGPoint(x: 263.812, y: 262.336), control: CGPoint(x: 262.008, y: 262.148))
        pathRef41.addQuadCurve(to: CGPoint(x: 260.777, y: 265.746), control: CGPoint(x: 261.609, y: 264.844))
        pathRef41.addQuadCurve(to: CGPoint(x: 259.5, y: 266.836), control: CGPoint(x: 259.945, y: 266.648))
        pathRef41.addQuadCurve(to: CGPoint(x: 257.414, y: 266.871), control: CGPoint(x: 258.797, y: 267.141))
        pathRef41.addQuadCurve(to: CGPoint(x: 253.031, y: 265.828), control: CGPoint(x: 256.031, y: 266.602))
        pathRef41.addQuadCurve(to: CGPoint(x: 247.418, y: 264.539), control: CGPoint(x: 250.031, y: 265.055))
        pathRef41.addQuadCurve(to: CGPoint(x: 242.648, y: 264.023), control: CGPoint(x: 244.805, y: 264.023))
        pathRef41.addQuadCurve(to: CGPoint(x: 240.551, y: 264.305), control: CGPoint(x: 241.43, y: 264.023))
        pathRef41.addQuadCurve(to: CGPoint(x: 238.113, y: 265.23), control: CGPoint(x: 239.672, y: 264.586))
        pathRef41.addQuadCurve(to: CGPoint(x: 235.922, y: 265.875), control: CGPoint(x: 236.555, y: 265.875))
        pathRef41.addQuadCurve(to: CGPoint(x: 235.008, y: 265.125), control: CGPoint(x: 235.008, y: 265.875))
        pathRef41.addQuadCurve(to: CGPoint(x: 235.312, y: 264.164), control: CGPoint(x: 235.008, y: 264.703))
        pathRef41.addQuadCurve(to: CGPoint(x: 236.812, y: 261.797), control: CGPoint(x: 236.086, y: 262.922))
        pathRef41.addQuadCurve(to: CGPoint(x: 238.359, y: 260.039), control: CGPoint(x: 237.539, y: 260.672))
        pathRef41.addQuadCurve(to: CGPoint(x: 240.727, y: 259.055), control: CGPoint(x: 239.18, y: 259.406))
        pathRef41.addQuadCurve(to: CGPoint(x: 244.805, y: 258.68), control: CGPoint(x: 242.273, y: 258.703))
        pathRef41.addQuadCurve(to: CGPoint(x: 251.93, y: 248.285), control: CGPoint(x: 248.625, y: 252.82))
        pathRef41.addQuadCurve(to: CGPoint(x: 257.941, y: 240.633), control: CGPoint(x: 255.234, y: 243.75))
        pathRef41.addQuadCurve(to: CGPoint(x: 262.688, y: 235.91), control: CGPoint(x: 260.648, y: 237.516))
        pathRef41.addQuadCurve(to: CGPoint(x: 265.922, y: 234.305), control: CGPoint(x: 264.727, y: 234.305))
        pathRef41.addQuadCurve(to: CGPoint(x: 267.234, y: 234.773), control: CGPoint(x: 266.766, y: 234.305))
        pathRef41.addQuadCurve(to: CGPoint(x: 267.703, y: 236.086), control: CGPoint(x: 267.703, y: 235.242))
        pathRef41.addQuadCurve(to: CGPoint(x: 262.758, y: 247.734), control: CGPoint(x: 267.703, y: 238.898))
        pathRef41.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef41)
        ctx.fillPath()
        
        
        /*  Shape 42  */
        let pathRef42 = CGMutablePath()
        pathRef42.move(to: CGPoint(x: 276.07, y: 247.641))
        pathRef42.addQuadCurve(to: CGPoint(x: 274.957, y: 247.195), control: CGPoint(x: 275.484, y: 247.641))
        pathRef42.addQuadCurve(to: CGPoint(x: 274.43, y: 246.07), control: CGPoint(x: 274.43, y: 246.75))
        pathRef42.addQuadCurve(to: CGPoint(x: 275.414, y: 243.773), control: CGPoint(x: 274.43, y: 245.039))
        pathRef42.addQuadCurve(to: CGPoint(x: 277.453, y: 242.508), control: CGPoint(x: 276.398, y: 242.508))
        pathRef42.addQuadCurve(to: CGPoint(x: 278.625, y: 242.941), control: CGPoint(x: 278.156, y: 242.508))
        pathRef42.addQuadCurve(to: CGPoint(x: 279.094, y: 244.195), control: CGPoint(x: 279.094, y: 243.375))
        pathRef42.addQuadCurve(to: CGPoint(x: 278.133, y: 246.422), control: CGPoint(x: 279.094, y: 245.203))
        pathRef42.addQuadCurve(to: CGPoint(x: 276.07, y: 247.641), control: CGPoint(x: 277.172, y: 247.641))
        pathRef42.closeSubpath()
        pathRef42.move(to: CGPoint(x: 277.664, y: 258.117))
        pathRef42.addLine(to: CGPoint(x: 277.664, y: 259.828))
        pathRef42.addQuadCurve(to: CGPoint(x: 273.422, y: 264.246), control: CGPoint(x: 275.391, y: 262.758))
        pathRef42.addQuadCurve(to: CGPoint(x: 270.07, y: 265.734), control: CGPoint(x: 271.453, y: 265.734))
        pathRef42.addQuadCurve(to: CGPoint(x: 267.211, y: 263.719), control: CGPoint(x: 268.148, y: 265.734))
        pathRef42.addQuadCurve(to: CGPoint(x: 266.273, y: 259.312), control: CGPoint(x: 266.273, y: 261.703))
        pathRef42.addQuadCurve(to: CGPoint(x: 266.461, y: 257.566), control: CGPoint(x: 266.273, y: 258.398))
        pathRef42.addQuadCurve(to: CGPoint(x: 266.906, y: 256.195), control: CGPoint(x: 266.648, y: 256.734))
        pathRef42.addQuadCurve(to: CGPoint(x: 267.867, y: 254.508), control: CGPoint(x: 267.164, y: 255.656))
        pathRef42.addQuadCurve(to: CGPoint(x: 273.961, y: 249.328), control: CGPoint(x: 271.195, y: 249.328))
        pathRef42.addQuadCurve(to: CGPoint(x: 275.391, y: 250.43), control: CGPoint(x: 275.391, y: 249.328))
        pathRef42.addQuadCurve(to: CGPoint(x: 274.465, y: 252.773), control: CGPoint(x: 275.391, y: 251.18))
        pathRef42.addQuadCurve(to: CGPoint(x: 272.812, y: 255.047), control: CGPoint(x: 273.539, y: 254.367))
        pathRef42.addQuadCurve(to: CGPoint(x: 270.152, y: 257.789), control: CGPoint(x: 270.773, y: 257.016))
        pathRef42.addQuadCurve(to: CGPoint(x: 269.531, y: 259.547), control: CGPoint(x: 269.531, y: 258.562))
        pathRef42.addQuadCurve(to: CGPoint(x: 270.164, y: 260.953), control: CGPoint(x: 269.531, y: 260.391))
        pathRef42.addQuadCurve(to: CGPoint(x: 271.805, y: 261.516), control: CGPoint(x: 270.797, y: 261.516))
        pathRef42.addQuadCurve(to: CGPoint(x: 274.23, y: 260.707), control: CGPoint(x: 272.906, y: 261.516))
        pathRef42.addQuadCurve(to: CGPoint(x: 277.664, y: 258.117), control: CGPoint(x: 275.555, y: 259.898))
        pathRef42.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef42)
        ctx.fillPath()
        
        
        /*  Shape 43  */
        let pathRef43 = CGMutablePath()
        pathRef43.move(to: CGPoint(x: 290.508, y: 258.117))
        pathRef43.addLine(to: CGPoint(x: 290.508, y: 259.734))
        pathRef43.addQuadCurve(to: CGPoint(x: 288.375, y: 261.773), control: CGPoint(x: 289.102, y: 261.141))
        pathRef43.addQuadCurve(to: CGPoint(x: 286.383, y: 263.062), control: CGPoint(x: 287.648, y: 262.406))
        pathRef43.addQuadCurve(to: CGPoint(x: 286.172, y: 266.695), control: CGPoint(x: 286.383, y: 265.195))
        pathRef43.addQuadCurve(to: CGPoint(x: 285.234, y: 269.848), control: CGPoint(x: 285.961, y: 268.195))
        pathRef43.addQuadCurve(to: CGPoint(x: 282.984, y: 273.469), control: CGPoint(x: 284.508, y: 271.5))
        pathRef43.addQuadCurve(to: CGPoint(x: 280.031, y: 276.457), control: CGPoint(x: 281.484, y: 275.414))
        pathRef43.addQuadCurve(to: CGPoint(x: 277.758, y: 277.5), control: CGPoint(x: 278.578, y: 277.5))
        pathRef43.addQuadCurve(to: CGPoint(x: 276.07, y: 276), control: CGPoint(x: 276.844, y: 277.5))
        pathRef43.addQuadCurve(to: CGPoint(x: 275.297, y: 272.273), control: CGPoint(x: 275.297, y: 274.5))
        pathRef43.addQuadCurve(to: CGPoint(x: 276.023, y: 267.773), control: CGPoint(x: 275.297, y: 270.141))
        pathRef43.addQuadCurve(to: CGPoint(x: 278.273, y: 261.656), control: CGPoint(x: 276.75, y: 265.406))
        pathRef43.addQuadCurve(to: CGPoint(x: 277.125, y: 258.68), control: CGPoint(x: 277.125, y: 260.156))
        pathRef43.addQuadCurve(to: CGPoint(x: 277.734, y: 256.852), control: CGPoint(x: 277.125, y: 257.484))
        pathRef43.addQuadCurve(to: CGPoint(x: 279.469, y: 255.703), control: CGPoint(x: 278.344, y: 256.219))
        pathRef43.addQuadCurve(to: CGPoint(x: 281.027, y: 253.512), control: CGPoint(x: 280.289, y: 254.414))
        pathRef43.addQuadCurve(to: CGPoint(x: 283.031, y: 251.109), control: CGPoint(x: 281.766, y: 252.609))
        pathRef43.addQuadCurve(to: CGPoint(x: 288.75, y: 239.391), control: CGPoint(x: 285.469, y: 245.109))
        pathRef43.addQuadCurve(to: CGPoint(x: 290.062, y: 237.246), control: CGPoint(x: 289.664, y: 237.797))
        pathRef43.addQuadCurve(to: CGPoint(x: 290.906, y: 236.695), control: CGPoint(x: 290.461, y: 236.695))
        pathRef43.addQuadCurve(to: CGPoint(x: 291.609, y: 237.281), control: CGPoint(x: 291.305, y: 236.695))
        pathRef43.addQuadCurve(to: CGPoint(x: 291.914, y: 238.805), control: CGPoint(x: 291.914, y: 237.867))
        pathRef43.addQuadCurve(to: CGPoint(x: 291.668, y: 240.914), control: CGPoint(x: 291.914, y: 239.953))
        pathRef43.addQuadCurve(to: CGPoint(x: 290.965, y: 242.848), control: CGPoint(x: 291.422, y: 241.875))
        pathRef43.addQuadCurve(to: CGPoint(x: 289.699, y: 245.18), control: CGPoint(x: 290.508, y: 243.82))
        pathRef43.addQuadCurve(to: CGPoint(x: 288.703, y: 246.867), control: CGPoint(x: 288.891, y: 246.539))
        pathRef43.addQuadCurve(to: CGPoint(x: 286.055, y: 251.438), control: CGPoint(x: 287.531, y: 248.93))
        pathRef43.addQuadCurve(to: CGPoint(x: 283.723, y: 255.398), control: CGPoint(x: 284.578, y: 253.945))
        pathRef43.addQuadCurve(to: CGPoint(x: 282.492, y: 257.578), control: CGPoint(x: 282.867, y: 256.852))
        pathRef43.addQuadCurve(to: CGPoint(x: 284.496, y: 259.477), control: CGPoint(x: 283.758, y: 258.68))
        pathRef43.addQuadCurve(to: CGPoint(x: 285.773, y: 261.375), control: CGPoint(x: 285.234, y: 260.273))
        pathRef43.addQuadCurve(to: CGPoint(x: 287.227, y: 260.648), control: CGPoint(x: 286.57, y: 261.07))
        pathRef43.addQuadCurve(to: CGPoint(x: 288.773, y: 259.488), control: CGPoint(x: 287.883, y: 260.227))
        pathRef43.addQuadCurve(to: CGPoint(x: 290.508, y: 258.117), control: CGPoint(x: 289.664, y: 258.75))
        pathRef43.closeSubpath()
        pathRef43.move(to: CGPoint(x: 283.5, y: 264.398))
        pathRef43.addLine(to: CGPoint(x: 283.453, y: 263.906))
        pathRef43.addQuadCurve(to: CGPoint(x: 282.398, y: 263.941), control: CGPoint(x: 282.797, y: 263.977))
        pathRef43.addQuadCurve(to: CGPoint(x: 281.473, y: 263.742), control: CGPoint(x: 282, y: 263.906))
        pathRef43.addQuadCurve(to: CGPoint(x: 280.652, y: 263.438), control: CGPoint(x: 280.945, y: 263.578))
        pathRef43.addQuadCurve(to: CGPoint(x: 280.008, y: 263.156), control: CGPoint(x: 280.359, y: 263.297))
        pathRef43.addQuadCurve(to: CGPoint(x: 278.227, y: 270.398), control: CGPoint(x: 278.227, y: 267.516))
        pathRef43.addQuadCurve(to: CGPoint(x: 278.66, y: 272.836), control: CGPoint(x: 278.227, y: 271.828))
        pathRef43.addQuadCurve(to: CGPoint(x: 279.68, y: 273.844), control: CGPoint(x: 279.094, y: 273.844))
        pathRef43.addQuadCurve(to: CGPoint(x: 281.215, y: 272.766), control: CGPoint(x: 280.289, y: 273.844))
        pathRef43.addQuadCurve(to: CGPoint(x: 282.82, y: 269.578), control: CGPoint(x: 282.141, y: 271.688))
        pathRef43.addQuadCurve(to: CGPoint(x: 283.5, y: 264.398), control: CGPoint(x: 283.5, y: 267.469))
        pathRef43.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef43)
        ctx.fillPath()
        
        
        /*  Shape 44  */
        let pathRef44 = CGMutablePath()
        pathRef44.move(to: CGPoint(x: 293.578, y: 258.961))
        pathRef44.addLine(to: CGPoint(x: 293.578, y: 259.547))
        pathRef44.addQuadCurve(to: CGPoint(x: 294.258, y: 261.703), control: CGPoint(x: 293.578, y: 260.93))
        pathRef44.addQuadCurve(to: CGPoint(x: 296.039, y: 262.477), control: CGPoint(x: 294.938, y: 262.477))
        pathRef44.addQuadCurve(to: CGPoint(x: 298.418, y: 261.938), control: CGPoint(x: 297.188, y: 262.477))
        pathRef44.addQuadCurve(to: CGPoint(x: 300.867, y: 260.508), control: CGPoint(x: 299.648, y: 261.398))
        pathRef44.addQuadCurve(to: CGPoint(x: 303.844, y: 258.117), control: CGPoint(x: 302.086, y: 259.617))
        pathRef44.addLine(to: CGPoint(x: 303.844, y: 259.547))
        pathRef44.addQuadCurve(to: CGPoint(x: 298.875, y: 264.434), control: CGPoint(x: 301.195, y: 262.734))
        pathRef44.addQuadCurve(to: CGPoint(x: 294.164, y: 266.133), control: CGPoint(x: 296.555, y: 266.133))
        pathRef44.addQuadCurve(to: CGPoint(x: 290.859, y: 264.516), control: CGPoint(x: 292.078, y: 266.133))
        pathRef44.addQuadCurve(to: CGPoint(x: 289.641, y: 260.086), control: CGPoint(x: 289.641, y: 262.898))
        pathRef44.addQuadCurve(to: CGPoint(x: 290.789, y: 255.621), control: CGPoint(x: 289.641, y: 257.625))
        pathRef44.addQuadCurve(to: CGPoint(x: 294.539, y: 251.391), control: CGPoint(x: 291.938, y: 253.617))
        pathRef44.addQuadCurve(to: CGPoint(x: 298.078, y: 249.094), control: CGPoint(x: 296.32, y: 249.867))
        pathRef44.addQuadCurve(to: CGPoint(x: 301.219, y: 248.32), control: CGPoint(x: 299.836, y: 248.32))
        pathRef44.addQuadCurve(to: CGPoint(x: 302.965, y: 248.824), control: CGPoint(x: 302.32, y: 248.32))
        pathRef44.addQuadCurve(to: CGPoint(x: 303.609, y: 250.336), control: CGPoint(x: 303.609, y: 249.328))
        pathRef44.addQuadCurve(to: CGPoint(x: 302.508, y: 253.277), control: CGPoint(x: 303.609, y: 251.812))
        pathRef44.addQuadCurve(to: CGPoint(x: 299.145, y: 256.184), control: CGPoint(x: 301.406, y: 254.742))
        pathRef44.addQuadCurve(to: CGPoint(x: 293.578, y: 258.961), control: CGPoint(x: 296.883, y: 257.625))
        pathRef44.closeSubpath()
        pathRef44.move(to: CGPoint(x: 293.812, y: 257.438))
        pathRef44.addQuadCurve(to: CGPoint(x: 297.422, y: 255.398), control: CGPoint(x: 295.922, y: 256.617))
        pathRef44.addQuadCurve(to: CGPoint(x: 299.637, y: 253.066), control: CGPoint(x: 298.922, y: 254.18))
        pathRef44.addQuadCurve(to: CGPoint(x: 300.352, y: 251.438), control: CGPoint(x: 300.352, y: 251.953))
        pathRef44.addQuadCurve(to: CGPoint(x: 299.859, y: 250.898), control: CGPoint(x: 300.352, y: 250.898))
        pathRef44.addQuadCurve(to: CGPoint(x: 298.488, y: 251.438), control: CGPoint(x: 299.438, y: 250.898))
        pathRef44.addQuadCurve(to: CGPoint(x: 296.566, y: 252.844), control: CGPoint(x: 297.539, y: 251.977))
        pathRef44.addQuadCurve(to: CGPoint(x: 294.82, y: 254.883), control: CGPoint(x: 295.594, y: 253.711))
        pathRef44.addQuadCurve(to: CGPoint(x: 293.812, y: 257.438), control: CGPoint(x: 294.047, y: 256.055))
        pathRef44.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef44)
        ctx.fillPath()
        
        
        /*  Shape 45  */
        let pathRef45 = CGMutablePath()
        pathRef45.move(to: CGPoint(x: 341.578, y: 258.727))
        pathRef45.addQuadCurve(to: CGPoint(x: 339.82, y: 256.781), control: CGPoint(x: 340.992, y: 257.648))
        pathRef45.addQuadCurve(to: CGPoint(x: 337.184, y: 255.387), control: CGPoint(x: 338.648, y: 255.914))
        pathRef45.addQuadCurve(to: CGPoint(x: 334.125, y: 254.602), control: CGPoint(x: 335.719, y: 254.859))
        pathRef45.addQuadCurve(to: CGPoint(x: 325.289, y: 251.531), control: CGPoint(x: 329.391, y: 253.898))
        pathRef45.addQuadCurve(to: CGPoint(x: 324.539, y: 250.734), control: CGPoint(x: 324.938, y: 251.344))
        pathRef45.addQuadCurve(to: CGPoint(x: 324.141, y: 249.562), control: CGPoint(x: 324.141, y: 250.125))
        pathRef45.addQuadCurve(to: CGPoint(x: 324.832, y: 245.426), control: CGPoint(x: 324.141, y: 247.5))
        pathRef45.addQuadCurve(to: CGPoint(x: 326.602, y: 242.18), control: CGPoint(x: 325.523, y: 243.352))
        pathRef45.addQuadCurve(to: CGPoint(x: 332.848, y: 238.781), control: CGPoint(x: 328.336, y: 240.234))
        pathRef45.addQuadCurve(to: CGPoint(x: 343.008, y: 237.328), control: CGPoint(x: 337.359, y: 237.328))
        pathRef45.addQuadCurve(to: CGPoint(x: 348.223, y: 237.844), control: CGPoint(x: 346.383, y: 237.328))
        pathRef45.addQuadCurve(to: CGPoint(x: 350.062, y: 239.438), control: CGPoint(x: 350.062, y: 238.359))
        pathRef45.addQuadCurve(to: CGPoint(x: 349.582, y: 242.156), control: CGPoint(x: 350.062, y: 241.195))
        pathRef45.addQuadCurve(to: CGPoint(x: 348.551, y: 243.434), control: CGPoint(x: 349.102, y: 243.117))
        pathRef45.addQuadCurve(to: CGPoint(x: 346.617, y: 244.289), control: CGPoint(x: 348, y: 243.75))
        pathRef45.addQuadCurve(to: CGPoint(x: 344.051, y: 245.367), control: CGPoint(x: 345.141, y: 244.805))
        pathRef45.addQuadCurve(to: CGPoint(x: 342.188, y: 246.445), control: CGPoint(x: 342.961, y: 245.93))
        pathRef45.addQuadCurve(to: CGPoint(x: 341.227, y: 246.961), control: CGPoint(x: 341.414, y: 246.961))
        pathRef45.addQuadCurve(to: CGPoint(x: 340.992, y: 246.773), control: CGPoint(x: 340.992, y: 246.961))
        pathRef45.addQuadCurve(to: CGPoint(x: 341.824, y: 245.566), control: CGPoint(x: 340.992, y: 246.375))
        pathRef45.addQuadCurve(to: CGPoint(x: 343.875, y: 244.148), control: CGPoint(x: 342.656, y: 244.758))
        pathRef45.addQuadCurve(to: CGPoint(x: 345.164, y: 243.281), control: CGPoint(x: 345.164, y: 243.469))
        pathRef45.addQuadCurve(to: CGPoint(x: 343.734, y: 242.977), control: CGPoint(x: 345.164, y: 242.977))
        pathRef45.addQuadCurve(to: CGPoint(x: 335.719, y: 243.75), control: CGPoint(x: 339.398, y: 242.977))
        pathRef45.addQuadCurve(to: CGPoint(x: 329.918, y: 245.789), control: CGPoint(x: 332.039, y: 244.523))
        pathRef45.addQuadCurve(to: CGPoint(x: 327.797, y: 248.367), control: CGPoint(x: 327.797, y: 247.055))
        pathRef45.addQuadCurve(to: CGPoint(x: 328.676, y: 249.527), control: CGPoint(x: 327.797, y: 249.188))
        pathRef45.addQuadCurve(to: CGPoint(x: 332.555, y: 250.664), control: CGPoint(x: 329.555, y: 249.867))
        pathRef45.addQuadCurve(to: CGPoint(x: 337.922, y: 252.492), control: CGPoint(x: 335.555, y: 251.461))
        pathRef45.addQuadCurve(to: CGPoint(x: 342.961, y: 255.516), control: CGPoint(x: 341.32, y: 253.945))
        pathRef45.addQuadCurve(to: CGPoint(x: 344.602, y: 259.031), control: CGPoint(x: 344.602, y: 257.086))
        pathRef45.addQuadCurve(to: CGPoint(x: 343.957, y: 261.715), control: CGPoint(x: 344.602, y: 260.367))
        pathRef45.addQuadCurve(to: CGPoint(x: 342.07, y: 264.188), control: CGPoint(x: 343.312, y: 263.062))
        pathRef45.addQuadCurve(to: CGPoint(x: 339.211, y: 266.039), control: CGPoint(x: 340.828, y: 265.312))
        pathRef45.addQuadCurve(to: CGPoint(x: 335.73, y: 267.141), control: CGPoint(x: 337.828, y: 266.625))
        pathRef45.addQuadCurve(to: CGPoint(x: 331.184, y: 267.949), control: CGPoint(x: 333.633, y: 267.656))
        pathRef45.addQuadCurve(to: CGPoint(x: 326.508, y: 268.242), control: CGPoint(x: 328.734, y: 268.242))
        pathRef45.addQuadCurve(to: CGPoint(x: 319.91, y: 267.469), control: CGPoint(x: 322.406, y: 268.242))
        pathRef45.addQuadCurve(to: CGPoint(x: 317.414, y: 265.125), control: CGPoint(x: 317.414, y: 266.695))
        pathRef45.addQuadCurve(to: CGPoint(x: 318.258, y: 262.934), control: CGPoint(x: 317.414, y: 264.422))
        pathRef45.addQuadCurve(to: CGPoint(x: 320.25, y: 260.93), control: CGPoint(x: 319.102, y: 261.445))
        pathRef45.addQuadCurve(to: CGPoint(x: 322.195, y: 260.473), control: CGPoint(x: 321.258, y: 260.531))
        pathRef45.addQuadCurve(to: CGPoint(x: 323.133, y: 260.695), control: CGPoint(x: 323.133, y: 260.414))
        pathRef45.addQuadCurve(to: CGPoint(x: 323.062, y: 260.836), control: CGPoint(x: 323.133, y: 260.766))
        pathRef45.addQuadCurve(to: CGPoint(x: 322.898, y: 260.953), control: CGPoint(x: 322.992, y: 260.906))
        pathRef45.addQuadCurve(to: CGPoint(x: 322.711, y: 261.047), control: CGPoint(x: 322.805, y: 261))
        pathRef45.addQuadCurve(to: CGPoint(x: 321.949, y: 261.34), control: CGPoint(x: 322.242, y: 261.234))
        pathRef45.addQuadCurve(to: CGPoint(x: 321.48, y: 261.551), control: CGPoint(x: 321.656, y: 261.445))
        pathRef45.addQuadCurve(to: CGPoint(x: 321.305, y: 261.844), control: CGPoint(x: 321.305, y: 261.656))
        pathRef45.addQuadCurve(to: CGPoint(x: 326.156, y: 262.336), control: CGPoint(x: 321.305, y: 262.336))
        pathRef45.addQuadCurve(to: CGPoint(x: 333.07, y: 262.031), control: CGPoint(x: 330.375, y: 262.336))
        pathRef45.addQuadCurve(to: CGPoint(x: 337.828, y: 260.93), control: CGPoint(x: 335.766, y: 261.727))
        pathRef45.addQuadCurve(to: CGPoint(x: 341.578, y: 258.727), control: CGPoint(x: 339.891, y: 260.133))
        pathRef45.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef45)
        ctx.fillPath()
        
        
        /*  Shape 46  */
        let pathRef46 = CGMutablePath()
        pathRef46.move(to: CGPoint(x: 348.047, y: 260.086))
        pathRef46.addLine(to: CGPoint(x: 348.047, y: 258.445))
        pathRef46.addQuadCurve(to: CGPoint(x: 353.707, y: 251.742), control: CGPoint(x: 351.328, y: 254.883))
        pathRef46.addQuadCurve(to: CGPoint(x: 357.469, y: 246.75), control: CGPoint(x: 356.086, y: 248.602))
        pathRef46.addQuadCurve(to: CGPoint(x: 359.906, y: 244.137), control: CGPoint(x: 358.852, y: 244.898))
        pathRef46.addQuadCurve(to: CGPoint(x: 362.555, y: 243.375), control: CGPoint(x: 360.961, y: 243.375))
        pathRef46.addQuadCurve(to: CGPoint(x: 363.352, y: 243.984), control: CGPoint(x: 363.352, y: 243.375))
        pathRef46.addQuadCurve(to: CGPoint(x: 362.707, y: 245.438), control: CGPoint(x: 363.352, y: 244.477))
        pathRef46.addQuadCurve(to: CGPoint(x: 361.055, y: 247.406), control: CGPoint(x: 362.062, y: 246.398))
        pathRef46.addQuadCurve(to: CGPoint(x: 358.441, y: 250.699), control: CGPoint(x: 359.719, y: 248.719))
        pathRef46.addQuadCurve(to: CGPoint(x: 355.547, y: 255.75), control: CGPoint(x: 357.164, y: 252.68))
        pathRef46.addQuadCurve(to: CGPoint(x: 358.465, y: 253.418), control: CGPoint(x: 356.812, y: 254.766))
        pathRef46.addQuadCurve(to: CGPoint(x: 361.16, y: 251.309), control: CGPoint(x: 360.117, y: 252.07))
        pathRef46.addQuadCurve(to: CGPoint(x: 363.223, y: 250.102), control: CGPoint(x: 362.203, y: 250.547))
        pathRef46.addQuadCurve(to: CGPoint(x: 365.273, y: 249.656), control: CGPoint(x: 364.242, y: 249.656))
        pathRef46.addQuadCurve(to: CGPoint(x: 366.129, y: 249.891), control: CGPoint(x: 365.93, y: 249.656))
        pathRef46.addQuadCurve(to: CGPoint(x: 366.328, y: 250.805), control: CGPoint(x: 366.328, y: 250.125))
        pathRef46.addQuadCurve(to: CGPoint(x: 365.461, y: 254.285), control: CGPoint(x: 366.328, y: 252.586))
        pathRef46.addQuadCurve(to: CGPoint(x: 362.977, y: 257.812), control: CGPoint(x: 364.594, y: 255.984))
        pathRef46.addQuadCurve(to: CGPoint(x: 358.992, y: 261.797), control: CGPoint(x: 361.359, y: 259.641))
        pathRef46.addQuadCurve(to: CGPoint(x: 360.68, y: 262.102), control: CGPoint(x: 359.812, y: 262.102))
        pathRef46.addQuadCurve(to: CGPoint(x: 367.969, y: 257.953), control: CGPoint(x: 363.398, y: 262.102))
        pathRef46.addLine(to: CGPoint(x: 367.969, y: 259.641))
        pathRef46.addQuadCurve(to: CGPoint(x: 364.488, y: 262.641), control: CGPoint(x: 366.188, y: 261.234))
        pathRef46.addQuadCurve(to: CGPoint(x: 361.289, y: 264.891), control: CGPoint(x: 362.789, y: 264.047))
        pathRef46.addQuadCurve(to: CGPoint(x: 358.523, y: 265.734), control: CGPoint(x: 359.789, y: 265.734))
        pathRef46.addQuadCurve(to: CGPoint(x: 357.527, y: 265.629), control: CGPoint(x: 358.055, y: 265.734))
        pathRef46.addQuadCurve(to: CGPoint(x: 356.555, y: 265.371), control: CGPoint(x: 357, y: 265.523))
        pathRef46.addQuadCurve(to: CGPoint(x: 355.406, y: 264.938), control: CGPoint(x: 356.109, y: 265.219))
        pathRef46.addQuadCurve(to: CGPoint(x: 354.328, y: 264.539), control: CGPoint(x: 354.703, y: 264.656))
        pathRef46.addQuadCurve(to: CGPoint(x: 353.484, y: 264.727), control: CGPoint(x: 353.578, y: 264.727))
        pathRef46.addQuadCurve(to: CGPoint(x: 351.562, y: 264.07), control: CGPoint(x: 352.664, y: 264.727))
        pathRef46.addQuadCurve(to: CGPoint(x: 349.863, y: 267.949), control: CGPoint(x: 350.789, y: 265.57))
        pathRef46.addQuadCurve(to: CGPoint(x: 348.305, y: 271.734), control: CGPoint(x: 348.938, y: 270.328))
        pathRef46.addQuadCurve(to: CGPoint(x: 346.617, y: 274.43), control: CGPoint(x: 347.672, y: 273.141))
        pathRef46.addQuadCurve(to: CGPoint(x: 345.797, y: 275.016), control: CGPoint(x: 346.031, y: 275.016))
        pathRef46.addQuadCurve(to: CGPoint(x: 344.789, y: 273.234), control: CGPoint(x: 344.789, y: 275.016))
        pathRef46.addQuadCurve(to: CGPoint(x: 345.41, y: 270.012), control: CGPoint(x: 344.789, y: 271.688))
        pathRef46.addQuadCurve(to: CGPoint(x: 346.934, y: 266.836), control: CGPoint(x: 346.031, y: 268.336))
        pathRef46.addQuadCurve(to: CGPoint(x: 348.914, y: 263.801), control: CGPoint(x: 347.836, y: 265.336))
        pathRef46.addQuadCurve(to: CGPoint(x: 350.438, y: 261.516), control: CGPoint(x: 349.992, y: 262.266))
        pathRef46.addQuadCurve(to: CGPoint(x: 356.203, y: 250.664), control: CGPoint(x: 354.141, y: 255.141))
        pathRef46.addQuadCurve(to: CGPoint(x: 348.047, y: 260.086), control: CGPoint(x: 350.812, y: 257.227))
        pathRef46.closeSubpath()
        pathRef46.move(to: CGPoint(x: 357.562, y: 261.234))
        pathRef46.addQuadCurve(to: CGPoint(x: 361.02, y: 257.086), control: CGPoint(x: 359.883, y: 258.797))
        pathRef46.addQuadCurve(to: CGPoint(x: 362.156, y: 254.461), control: CGPoint(x: 362.156, y: 255.375))
        pathRef46.addQuadCurve(to: CGPoint(x: 361.289, y: 253.594), control: CGPoint(x: 362.156, y: 253.594))
        pathRef46.addQuadCurve(to: CGPoint(x: 357.996, y: 255.527), control: CGPoint(x: 360.117, y: 253.594))
        pathRef46.addQuadCurve(to: CGPoint(x: 353.625, y: 260.742), control: CGPoint(x: 355.875, y: 257.461))
        pathRef46.addQuadCurve(to: CGPoint(x: 355.945, y: 260.613), control: CGPoint(x: 355.359, y: 260.555))
        pathRef46.addQuadCurve(to: CGPoint(x: 357.562, y: 261.234), control: CGPoint(x: 356.531, y: 260.672))
        pathRef46.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef46)
        ctx.fillPath()
        
        
        /*  Shape 47  */
        let pathRef47 = CGMutablePath()
        pathRef47.move(to: CGPoint(x: 370.547, y: 253.922))
        pathRef47.addQuadCurve(to: CGPoint(x: 377.461, y: 249.117), control: CGPoint(x: 374.109, y: 250.688))
        pathRef47.addQuadCurve(to: CGPoint(x: 382.641, y: 247.547), control: CGPoint(x: 380.812, y: 247.547))
        pathRef47.addQuadCurve(to: CGPoint(x: 383.555, y: 247.957), control: CGPoint(x: 383.133, y: 247.547))
        pathRef47.addQuadCurve(to: CGPoint(x: 384.223, y: 248.906), control: CGPoint(x: 383.977, y: 248.367))
        pathRef47.addQuadCurve(to: CGPoint(x: 384.469, y: 249.703), control: CGPoint(x: 384.469, y: 249.445))
        pathRef47.addQuadCurve(to: CGPoint(x: 384.141, y: 250.324), control: CGPoint(x: 384.469, y: 250.125))
        pathRef47.addQuadCurve(to: CGPoint(x: 382.992, y: 250.805), control: CGPoint(x: 383.812, y: 250.523))
        pathRef47.addQuadCurve(to: CGPoint(x: 383.414, y: 251.766), control: CGPoint(x: 383.156, y: 251.18))
        pathRef47.addQuadCurve(to: CGPoint(x: 383.812, y: 252.715), control: CGPoint(x: 383.672, y: 252.352))
        pathRef47.addQuadCurve(to: CGPoint(x: 383.953, y: 253.359), control: CGPoint(x: 383.953, y: 253.078))
        pathRef47.addQuadCurve(to: CGPoint(x: 382.816, y: 255.457), control: CGPoint(x: 383.953, y: 253.922))
        pathRef47.addQuadCurve(to: CGPoint(x: 381.223, y: 257.719), control: CGPoint(x: 381.68, y: 256.992))
        pathRef47.addQuadCurve(to: CGPoint(x: 380.766, y: 259.5), control: CGPoint(x: 380.766, y: 258.445))
        pathRef47.addQuadCurve(to: CGPoint(x: 382.359, y: 261.234), control: CGPoint(x: 380.766, y: 261.234))
        pathRef47.addQuadCurve(to: CGPoint(x: 387.492, y: 258.164), control: CGPoint(x: 384, y: 261.234))
        pathRef47.addLine(to: CGPoint(x: 387.492, y: 259.594))
        pathRef47.addQuadCurve(to: CGPoint(x: 379.008, y: 266.18), control: CGPoint(x: 381.562, y: 266.18))
        pathRef47.addQuadCurve(to: CGPoint(x: 377.707, y: 265.582), control: CGPoint(x: 378.094, y: 266.18))
        pathRef47.addQuadCurve(to: CGPoint(x: 377.32, y: 263.812), control: CGPoint(x: 377.32, y: 264.984))
        pathRef47.addQuadCurve(to: CGPoint(x: 378.656, y: 258.445), control: CGPoint(x: 377.32, y: 261.961))
        pathRef47.addQuadCurve(to: CGPoint(x: 373.57, y: 263.848), control: CGPoint(x: 375.234, y: 262.242))
        pathRef47.addQuadCurve(to: CGPoint(x: 370.828, y: 265.453), control: CGPoint(x: 371.906, y: 265.453))
        pathRef47.addQuadCurve(to: CGPoint(x: 369.539, y: 264.562), control: CGPoint(x: 370.312, y: 265.453))
        pathRef47.addQuadCurve(to: CGPoint(x: 368.168, y: 262.254), control: CGPoint(x: 368.766, y: 263.672))
        pathRef47.addQuadCurve(to: CGPoint(x: 367.57, y: 259.312), control: CGPoint(x: 367.57, y: 260.836))
        pathRef47.addQuadCurve(to: CGPoint(x: 367.781, y: 257.473), control: CGPoint(x: 367.57, y: 258.211))
        pathRef47.addQuadCurve(to: CGPoint(x: 368.602, y: 255.961), control: CGPoint(x: 367.992, y: 256.734))
        pathRef47.addQuadCurve(to: CGPoint(x: 370.547, y: 253.922), control: CGPoint(x: 369.211, y: 255.188))
        pathRef47.closeSubpath()
        pathRef47.move(to: CGPoint(x: 381.773, y: 251.344))
        pathRef47.addQuadCurve(to: CGPoint(x: 373.09, y: 256.078), control: CGPoint(x: 375.68, y: 254.133))
        pathRef47.addQuadCurve(to: CGPoint(x: 370.5, y: 260.086), control: CGPoint(x: 370.5, y: 258.023))
        pathRef47.addQuadCurve(to: CGPoint(x: 370.758, y: 261.316), control: CGPoint(x: 370.5, y: 260.836))
        pathRef47.addQuadCurve(to: CGPoint(x: 371.461, y: 261.797), control: CGPoint(x: 371.016, y: 261.797))
        pathRef47.addQuadCurve(to: CGPoint(x: 372.375, y: 261.469), control: CGPoint(x: 371.719, y: 261.797))
        pathRef47.addQuadCurve(to: CGPoint(x: 376.875, y: 257.684), control: CGPoint(x: 374.836, y: 260.016))
        pathRef47.addQuadCurve(to: CGPoint(x: 381.773, y: 251.344), control: CGPoint(x: 378.914, y: 255.352))
        pathRef47.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef47)
        ctx.fillPath()
        
        
        /*  Shape 48  */
        let pathRef48 = CGMutablePath()
        pathRef48.move(to: CGPoint(x: 403.078, y: 253.875))
        pathRef48.addQuadCurve(to: CGPoint(x: 398.953, y: 260.273), control: CGPoint(x: 398.953, y: 258.469))
        pathRef48.addQuadCurve(to: CGPoint(x: 399.773, y: 261.281), control: CGPoint(x: 398.953, y: 261.281))
        pathRef48.addQuadCurve(to: CGPoint(x: 401.543, y: 260.566), control: CGPoint(x: 400.453, y: 261.281))
        pathRef48.addQuadCurve(to: CGPoint(x: 404.953, y: 258.023), control: CGPoint(x: 402.633, y: 259.852))
        pathRef48.addLine(to: CGPoint(x: 404.953, y: 259.641))
        pathRef48.addQuadCurve(to: CGPoint(x: 399.844, y: 264.375), control: CGPoint(x: 401.625, y: 262.922))
        pathRef48.addQuadCurve(to: CGPoint(x: 396.938, y: 265.828), control: CGPoint(x: 398.062, y: 265.828))
        pathRef48.addQuadCurve(to: CGPoint(x: 395.016, y: 263.297), control: CGPoint(x: 395.016, y: 265.828))
        pathRef48.addQuadCurve(to: CGPoint(x: 395.25, y: 261.82), control: CGPoint(x: 395.016, y: 262.547))
        pathRef48.addQuadCurve(to: CGPoint(x: 395.895, y: 260.309), control: CGPoint(x: 395.484, y: 261.094))
        pathRef48.addQuadCurve(to: CGPoint(x: 397.148, y: 258.059), control: CGPoint(x: 396.305, y: 259.523))
        pathRef48.addQuadCurve(to: CGPoint(x: 399.094, y: 254.742), control: CGPoint(x: 397.992, y: 256.594))
        pathRef48.addQuadCurve(to: CGPoint(x: 395.742, y: 257.438), control: CGPoint(x: 397.758, y: 255.422))
        pathRef48.addQuadCurve(to: CGPoint(x: 393.516, y: 259.84), control: CGPoint(x: 394.43, y: 258.703))
        pathRef48.addQuadCurve(to: CGPoint(x: 391.559, y: 262.371), control: CGPoint(x: 392.602, y: 260.977))
        pathRef48.addQuadCurve(to: CGPoint(x: 390.035, y: 264.246), control: CGPoint(x: 390.516, y: 263.766))
        pathRef48.addQuadCurve(to: CGPoint(x: 389.062, y: 264.727), control: CGPoint(x: 389.555, y: 264.727))
        pathRef48.addQuadCurve(to: CGPoint(x: 387.68, y: 263.156), control: CGPoint(x: 388.312, y: 264.727))
        pathRef48.addQuadCurve(to: CGPoint(x: 387.047, y: 259.5), control: CGPoint(x: 387.047, y: 261.586))
        pathRef48.addQuadCurve(to: CGPoint(x: 387.34, y: 257.484), control: CGPoint(x: 387.047, y: 258.211))
        pathRef48.addQuadCurve(to: CGPoint(x: 388.5, y: 255.422), control: CGPoint(x: 387.633, y: 256.758))
        pathRef48.addQuadCurve(to: CGPoint(x: 391.289, y: 251.777), control: CGPoint(x: 390.117, y: 252.938))
        pathRef48.addQuadCurve(to: CGPoint(x: 393.539, y: 250.617), control: CGPoint(x: 392.461, y: 250.617))
        pathRef48.addQuadCurve(to: CGPoint(x: 394.746, y: 250.875), control: CGPoint(x: 394.289, y: 250.617))
        pathRef48.addQuadCurve(to: CGPoint(x: 395.203, y: 251.672), control: CGPoint(x: 395.203, y: 251.133))
        pathRef48.addQuadCurve(to: CGPoint(x: 395.062, y: 252.164), control: CGPoint(x: 395.203, y: 251.906))
        pathRef48.addQuadCurve(to: CGPoint(x: 394.746, y: 252.633), control: CGPoint(x: 394.922, y: 252.422))
        pathRef48.addQuadCurve(to: CGPoint(x: 394.008, y: 253.453), control: CGPoint(x: 394.57, y: 252.844))
        pathRef48.addQuadCurve(to: CGPoint(x: 390.305, y: 258.773), control: CGPoint(x: 390.305, y: 257.555))
        pathRef48.addQuadCurve(to: CGPoint(x: 390.75, y: 259.453), control: CGPoint(x: 390.305, y: 259.453))
        pathRef48.addQuadCurve(to: CGPoint(x: 391.84, y: 258.551), control: CGPoint(x: 391.031, y: 259.453))
        pathRef48.addQuadCurve(to: CGPoint(x: 393.926, y: 256.184), control: CGPoint(x: 392.648, y: 257.648))
        pathRef48.addQuadCurve(to: CGPoint(x: 396.949, y: 253.125), control: CGPoint(x: 395.203, y: 254.719))
        pathRef48.addQuadCurve(to: CGPoint(x: 400.922, y: 250.055), control: CGPoint(x: 398.695, y: 251.531))
        pathRef48.addQuadCurve(to: CGPoint(x: 402.984, y: 249.188), control: CGPoint(x: 402.164, y: 249.188))
        pathRef48.addQuadCurve(to: CGPoint(x: 403.723, y: 250.219), control: CGPoint(x: 403.359, y: 249.188))
        pathRef48.addQuadCurve(to: CGPoint(x: 404.086, y: 252.305), control: CGPoint(x: 404.086, y: 251.25))
        pathRef48.addQuadCurve(to: CGPoint(x: 403.078, y: 253.875), control: CGPoint(x: 404.086, y: 252.82))
        pathRef48.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef48)
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
            ] as [NSAttributedStringKey: Any]
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
            ] as [NSAttributedStringKey: Any]
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
            ] as [NSAttributedStringKey: Any]
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
            ] as [NSAttributedStringKey: Any]
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
            ] as [NSAttributedStringKey: Any]
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
            ] as [NSAttributedStringKey: Any]
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
            ] as [NSAttributedStringKey: Any]
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
            ] as [NSAttributedStringKey: Any]
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
            ] as [NSAttributedStringKey: Any]
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
