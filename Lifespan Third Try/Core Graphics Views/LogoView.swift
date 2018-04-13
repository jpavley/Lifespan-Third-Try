//
//  LogoView.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 4/12/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

class LogoView: CoreGraphicsView {
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        drawLogo()
        
    }
    
    /// Code generated by Graphics.app.
    private func drawLogo() {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        // enable the following lines for flipped coordinate systems
        // ctx.translateBy(x: 0, y: self.bounds.size.height)
        // ctx.scaleBy(x: 1, y: -1)
        
        /*  Shape   */
        let pathRef = CGMutablePath()
        pathRef.move(to: CGPoint(x: 262.227, y: 247.761))
        pathRef.addLine(to: CGPoint(x: 262.953, y: 248.487))
        pathRef.addQuadCurve(to: CGPoint(x: 259.59, y: 252.003), control: CGPoint(x: 261.031, y: 250.901))
        pathRef.addQuadCurve(to: CGPoint(x: 257.469, y: 253.104), control: CGPoint(x: 258.148, y: 253.104))
        pathRef.addQuadCurve(to: CGPoint(x: 256.906, y: 252.097), control: CGPoint(x: 256.906, y: 253.104))
        pathRef.addQuadCurve(to: CGPoint(x: 260.211, y: 244.362), control: CGPoint(x: 256.906, y: 249.589))
        pathRef.addQuadCurve(to: CGPoint(x: 263, y: 239.323), control: CGPoint(x: 263, y: 239.839))
        pathRef.addQuadCurve(to: CGPoint(x: 262.625, y: 238.878), control: CGPoint(x: 263, y: 238.878))
        pathRef.addQuadCurve(to: CGPoint(x: 259.32, y: 241.831), control: CGPoint(x: 261.969, y: 238.878))
        pathRef.addQuadCurve(to: CGPoint(x: 252.781, y: 250.175), control: CGPoint(x: 256.672, y: 244.784))
        pathRef.addQuadCurve(to: CGPoint(x: 246.734, y: 258.753), control: CGPoint(x: 248.375, y: 256.175))
        pathRef.addQuadCurve(to: CGPoint(x: 251.855, y: 259.538), control: CGPoint(x: 249.852, y: 259.057))
        pathRef.addQuadCurve(to: CGPoint(x: 257.668, y: 261.097), control: CGPoint(x: 253.859, y: 260.018))
        pathRef.addQuadCurve(to: CGPoint(x: 263.281, y: 262.362), control: CGPoint(x: 261.477, y: 262.175))
        pathRef.addQuadCurve(to: CGPoint(x: 260.246, y: 265.772), control: CGPoint(x: 261.078, y: 264.87))
        pathRef.addQuadCurve(to: CGPoint(x: 258.969, y: 266.862), control: CGPoint(x: 259.414, y: 266.675))
        pathRef.addQuadCurve(to: CGPoint(x: 256.883, y: 266.897), control: CGPoint(x: 258.266, y: 267.167))
        pathRef.addQuadCurve(to: CGPoint(x: 252.5, y: 265.854), control: CGPoint(x: 255.5, y: 266.628))
        pathRef.addQuadCurve(to: CGPoint(x: 246.887, y: 264.565), control: CGPoint(x: 249.5, y: 265.081))
        pathRef.addQuadCurve(to: CGPoint(x: 242.117, y: 264.05), control: CGPoint(x: 244.273, y: 264.05))
        pathRef.addQuadCurve(to: CGPoint(x: 240.02, y: 264.331), control: CGPoint(x: 240.898, y: 264.05))
        pathRef.addQuadCurve(to: CGPoint(x: 237.582, y: 265.257), control: CGPoint(x: 239.141, y: 264.612))
        pathRef.addQuadCurve(to: CGPoint(x: 235.391, y: 265.901), control: CGPoint(x: 236.023, y: 265.901))
        pathRef.addQuadCurve(to: CGPoint(x: 234.477, y: 265.151), control: CGPoint(x: 234.477, y: 265.901))
        pathRef.addQuadCurve(to: CGPoint(x: 234.781, y: 264.19), control: CGPoint(x: 234.477, y: 264.729))
        pathRef.addQuadCurve(to: CGPoint(x: 236.281, y: 261.823), control: CGPoint(x: 235.555, y: 262.948))
        pathRef.addQuadCurve(to: CGPoint(x: 237.828, y: 260.065), control: CGPoint(x: 237.008, y: 260.698))
        pathRef.addQuadCurve(to: CGPoint(x: 240.195, y: 259.081), control: CGPoint(x: 238.648, y: 259.432))
        pathRef.addQuadCurve(to: CGPoint(x: 244.273, y: 258.706), control: CGPoint(x: 241.742, y: 258.729))
        pathRef.addQuadCurve(to: CGPoint(x: 251.398, y: 248.311), control: CGPoint(x: 248.094, y: 252.847))
        pathRef.addQuadCurve(to: CGPoint(x: 257.41, y: 240.659), control: CGPoint(x: 254.703, y: 243.776))
        pathRef.addQuadCurve(to: CGPoint(x: 262.156, y: 235.936), control: CGPoint(x: 260.117, y: 237.542))
        pathRef.addQuadCurve(to: CGPoint(x: 265.391, y: 234.331), control: CGPoint(x: 264.195, y: 234.331))
        pathRef.addQuadCurve(to: CGPoint(x: 266.703, y: 234.8), control: CGPoint(x: 266.234, y: 234.331))
        pathRef.addQuadCurve(to: CGPoint(x: 267.172, y: 236.112), control: CGPoint(x: 267.172, y: 235.268))
        pathRef.addQuadCurve(to: CGPoint(x: 262.227, y: 247.761), control: CGPoint(x: 267.172, y: 238.925))
        pathRef.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef)
        ctx.fillPath()
        
        
        /*  Shape 2  */
        let pathRef2 = CGMutablePath()
        pathRef2.move(to: CGPoint(x: 275.539, y: 247.667))
        pathRef2.addQuadCurve(to: CGPoint(x: 274.426, y: 247.222), control: CGPoint(x: 274.953, y: 247.667))
        pathRef2.addQuadCurve(to: CGPoint(x: 273.898, y: 246.097), control: CGPoint(x: 273.898, y: 246.776))
        pathRef2.addQuadCurve(to: CGPoint(x: 274.883, y: 243.8), control: CGPoint(x: 273.898, y: 245.065))
        pathRef2.addQuadCurve(to: CGPoint(x: 276.922, y: 242.534), control: CGPoint(x: 275.867, y: 242.534))
        pathRef2.addQuadCurve(to: CGPoint(x: 278.094, y: 242.968), control: CGPoint(x: 277.625, y: 242.534))
        pathRef2.addQuadCurve(to: CGPoint(x: 278.562, y: 244.222), control: CGPoint(x: 278.562, y: 243.401))
        pathRef2.addQuadCurve(to: CGPoint(x: 277.602, y: 246.448), control: CGPoint(x: 278.562, y: 245.229))
        pathRef2.addQuadCurve(to: CGPoint(x: 275.539, y: 247.667), control: CGPoint(x: 276.641, y: 247.667))
        pathRef2.closeSubpath()
        pathRef2.move(to: CGPoint(x: 277.133, y: 258.143))
        pathRef2.addLine(to: CGPoint(x: 277.133, y: 259.854))
        pathRef2.addQuadCurve(to: CGPoint(x: 272.891, y: 264.272), control: CGPoint(x: 274.859, y: 262.784))
        pathRef2.addQuadCurve(to: CGPoint(x: 269.539, y: 265.761), control: CGPoint(x: 270.922, y: 265.761))
        pathRef2.addQuadCurve(to: CGPoint(x: 266.68, y: 263.745), control: CGPoint(x: 267.617, y: 265.761))
        pathRef2.addQuadCurve(to: CGPoint(x: 265.742, y: 259.339), control: CGPoint(x: 265.742, y: 261.729))
        pathRef2.addQuadCurve(to: CGPoint(x: 265.93, y: 257.593), control: CGPoint(x: 265.742, y: 258.425))
        pathRef2.addQuadCurve(to: CGPoint(x: 266.375, y: 256.222), control: CGPoint(x: 266.117, y: 256.761))
        pathRef2.addQuadCurve(to: CGPoint(x: 267.336, y: 254.534), control: CGPoint(x: 266.633, y: 255.682))
        pathRef2.addQuadCurve(to: CGPoint(x: 273.43, y: 249.354), control: CGPoint(x: 270.664, y: 249.354))
        pathRef2.addQuadCurve(to: CGPoint(x: 274.859, y: 250.456), control: CGPoint(x: 274.859, y: 249.354))
        pathRef2.addQuadCurve(to: CGPoint(x: 273.934, y: 252.8), control: CGPoint(x: 274.859, y: 251.206))
        pathRef2.addQuadCurve(to: CGPoint(x: 272.281, y: 255.073), control: CGPoint(x: 273.008, y: 254.393))
        pathRef2.addQuadCurve(to: CGPoint(x: 269.621, y: 257.815), control: CGPoint(x: 270.242, y: 257.042))
        pathRef2.addQuadCurve(to: CGPoint(x: 269, y: 259.573), control: CGPoint(x: 269, y: 258.589))
        pathRef2.addQuadCurve(to: CGPoint(x: 269.633, y: 260.979), control: CGPoint(x: 269, y: 260.417))
        pathRef2.addQuadCurve(to: CGPoint(x: 271.273, y: 261.542), control: CGPoint(x: 270.266, y: 261.542))
        pathRef2.addQuadCurve(to: CGPoint(x: 273.699, y: 260.733), control: CGPoint(x: 272.375, y: 261.542))
        pathRef2.addQuadCurve(to: CGPoint(x: 277.133, y: 258.143), control: CGPoint(x: 275.023, y: 259.925))
        pathRef2.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef2)
        ctx.fillPath()
        
        
        /*  Shape 3  */
        let pathRef3 = CGMutablePath()
        pathRef3.move(to: CGPoint(x: 289.977, y: 258.143))
        pathRef3.addLine(to: CGPoint(x: 289.977, y: 259.761))
        pathRef3.addQuadCurve(to: CGPoint(x: 287.844, y: 261.8), control: CGPoint(x: 288.57, y: 261.167))
        pathRef3.addQuadCurve(to: CGPoint(x: 285.852, y: 263.089), control: CGPoint(x: 287.117, y: 262.432))
        pathRef3.addQuadCurve(to: CGPoint(x: 285.641, y: 266.722), control: CGPoint(x: 285.852, y: 265.222))
        pathRef3.addQuadCurve(to: CGPoint(x: 284.703, y: 269.874), control: CGPoint(x: 285.43, y: 268.222))
        pathRef3.addQuadCurve(to: CGPoint(x: 282.453, y: 273.495), control: CGPoint(x: 283.977, y: 271.526))
        pathRef3.addQuadCurve(to: CGPoint(x: 279.5, y: 276.483), control: CGPoint(x: 280.953, y: 275.44))
        pathRef3.addQuadCurve(to: CGPoint(x: 277.227, y: 277.526), control: CGPoint(x: 278.047, y: 277.526))
        pathRef3.addQuadCurve(to: CGPoint(x: 275.539, y: 276.026), control: CGPoint(x: 276.312, y: 277.526))
        pathRef3.addQuadCurve(to: CGPoint(x: 274.766, y: 272.3), control: CGPoint(x: 274.766, y: 274.526))
        pathRef3.addQuadCurve(to: CGPoint(x: 275.492, y: 267.8), control: CGPoint(x: 274.766, y: 270.167))
        pathRef3.addQuadCurve(to: CGPoint(x: 277.742, y: 261.682), control: CGPoint(x: 276.219, y: 265.432))
        pathRef3.addQuadCurve(to: CGPoint(x: 276.594, y: 258.706), control: CGPoint(x: 276.594, y: 260.182))
        pathRef3.addQuadCurve(to: CGPoint(x: 277.203, y: 256.878), control: CGPoint(x: 276.594, y: 257.511))
        pathRef3.addQuadCurve(to: CGPoint(x: 278.938, y: 255.729), control: CGPoint(x: 277.812, y: 256.245))
        pathRef3.addQuadCurve(to: CGPoint(x: 280.496, y: 253.538), control: CGPoint(x: 279.758, y: 254.44))
        pathRef3.addQuadCurve(to: CGPoint(x: 282.5, y: 251.136), control: CGPoint(x: 281.234, y: 252.636))
        pathRef3.addQuadCurve(to: CGPoint(x: 288.219, y: 239.417), control: CGPoint(x: 284.938, y: 245.136))
        pathRef3.addQuadCurve(to: CGPoint(x: 289.531, y: 237.272), control: CGPoint(x: 289.133, y: 237.823))
        pathRef3.addQuadCurve(to: CGPoint(x: 290.375, y: 236.722), control: CGPoint(x: 289.93, y: 236.722))
        pathRef3.addQuadCurve(to: CGPoint(x: 291.078, y: 237.307), control: CGPoint(x: 290.773, y: 236.722))
        pathRef3.addQuadCurve(to: CGPoint(x: 291.383, y: 238.831), control: CGPoint(x: 291.383, y: 237.893))
        pathRef3.addQuadCurve(to: CGPoint(x: 291.137, y: 240.94), control: CGPoint(x: 291.383, y: 239.979))
        pathRef3.addQuadCurve(to: CGPoint(x: 290.434, y: 242.874), control: CGPoint(x: 290.891, y: 241.901))
        pathRef3.addQuadCurve(to: CGPoint(x: 289.168, y: 245.206), control: CGPoint(x: 289.977, y: 243.847))
        pathRef3.addQuadCurve(to: CGPoint(x: 288.172, y: 246.893), control: CGPoint(x: 288.359, y: 246.565))
        pathRef3.addQuadCurve(to: CGPoint(x: 285.523, y: 251.464), control: CGPoint(x: 287, y: 248.956))
        pathRef3.addQuadCurve(to: CGPoint(x: 283.191, y: 255.425), control: CGPoint(x: 284.047, y: 253.972))
        pathRef3.addQuadCurve(to: CGPoint(x: 281.961, y: 257.604), control: CGPoint(x: 282.336, y: 256.878))
        pathRef3.addQuadCurve(to: CGPoint(x: 283.965, y: 259.503), control: CGPoint(x: 283.227, y: 258.706))
        pathRef3.addQuadCurve(to: CGPoint(x: 285.242, y: 261.401), control: CGPoint(x: 284.703, y: 260.3))
        pathRef3.addQuadCurve(to: CGPoint(x: 286.695, y: 260.675), control: CGPoint(x: 286.039, y: 261.097))
        pathRef3.addQuadCurve(to: CGPoint(x: 288.242, y: 259.515), control: CGPoint(x: 287.352, y: 260.253))
        pathRef3.addQuadCurve(to: CGPoint(x: 289.977, y: 258.143), control: CGPoint(x: 289.133, y: 258.776))
        pathRef3.closeSubpath()
        pathRef3.move(to: CGPoint(x: 282.969, y: 264.425))
        pathRef3.addLine(to: CGPoint(x: 282.922, y: 263.932))
        pathRef3.addQuadCurve(to: CGPoint(x: 281.867, y: 263.968), control: CGPoint(x: 282.266, y: 264.003))
        pathRef3.addQuadCurve(to: CGPoint(x: 280.941, y: 263.768), control: CGPoint(x: 281.469, y: 263.932))
        pathRef3.addQuadCurve(to: CGPoint(x: 280.121, y: 263.464), control: CGPoint(x: 280.414, y: 263.604))
        pathRef3.addQuadCurve(to: CGPoint(x: 279.477, y: 263.182), control: CGPoint(x: 279.828, y: 263.323))
        pathRef3.addQuadCurve(to: CGPoint(x: 277.695, y: 270.425), control: CGPoint(x: 277.695, y: 267.542))
        pathRef3.addQuadCurve(to: CGPoint(x: 278.129, y: 272.862), control: CGPoint(x: 277.695, y: 271.854))
        pathRef3.addQuadCurve(to: CGPoint(x: 279.148, y: 273.87), control: CGPoint(x: 278.562, y: 273.87))
        pathRef3.addQuadCurve(to: CGPoint(x: 280.684, y: 272.792), control: CGPoint(x: 279.758, y: 273.87))
        pathRef3.addQuadCurve(to: CGPoint(x: 282.289, y: 269.604), control: CGPoint(x: 281.609, y: 271.714))
        pathRef3.addQuadCurve(to: CGPoint(x: 282.969, y: 264.425), control: CGPoint(x: 282.969, y: 267.495))
        pathRef3.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef3)
        ctx.fillPath()
        
        
        /*  Shape 4  */
        let pathRef4 = CGMutablePath()
        pathRef4.move(to: CGPoint(x: 293.047, y: 258.987))
        pathRef4.addLine(to: CGPoint(x: 293.047, y: 259.573))
        pathRef4.addQuadCurve(to: CGPoint(x: 293.727, y: 261.729), control: CGPoint(x: 293.047, y: 260.956))
        pathRef4.addQuadCurve(to: CGPoint(x: 295.508, y: 262.503), control: CGPoint(x: 294.406, y: 262.503))
        pathRef4.addQuadCurve(to: CGPoint(x: 297.887, y: 261.964), control: CGPoint(x: 296.656, y: 262.503))
        pathRef4.addQuadCurve(to: CGPoint(x: 300.336, y: 260.534), control: CGPoint(x: 299.117, y: 261.425))
        pathRef4.addQuadCurve(to: CGPoint(x: 303.312, y: 258.143), control: CGPoint(x: 301.555, y: 259.643))
        pathRef4.addLine(to: CGPoint(x: 303.312, y: 259.573))
        pathRef4.addQuadCurve(to: CGPoint(x: 298.344, y: 264.46), control: CGPoint(x: 300.664, y: 262.761))
        pathRef4.addQuadCurve(to: CGPoint(x: 293.633, y: 266.159), control: CGPoint(x: 296.023, y: 266.159))
        pathRef4.addQuadCurve(to: CGPoint(x: 290.328, y: 264.542), control: CGPoint(x: 291.547, y: 266.159))
        pathRef4.addQuadCurve(to: CGPoint(x: 289.109, y: 260.112), control: CGPoint(x: 289.109, y: 262.925))
        pathRef4.addQuadCurve(to: CGPoint(x: 290.258, y: 255.647), control: CGPoint(x: 289.109, y: 257.651))
        pathRef4.addQuadCurve(to: CGPoint(x: 294.008, y: 251.417), control: CGPoint(x: 291.406, y: 253.643))
        pathRef4.addQuadCurve(to: CGPoint(x: 297.547, y: 249.12), control: CGPoint(x: 295.789, y: 249.893))
        pathRef4.addQuadCurve(to: CGPoint(x: 300.688, y: 248.347), control: CGPoint(x: 299.305, y: 248.347))
        pathRef4.addQuadCurve(to: CGPoint(x: 302.434, y: 248.85), control: CGPoint(x: 301.789, y: 248.347))
        pathRef4.addQuadCurve(to: CGPoint(x: 303.078, y: 250.362), control: CGPoint(x: 303.078, y: 249.354))
        pathRef4.addQuadCurve(to: CGPoint(x: 301.977, y: 253.304), control: CGPoint(x: 303.078, y: 251.839))
        pathRef4.addQuadCurve(to: CGPoint(x: 298.613, y: 256.21), control: CGPoint(x: 300.875, y: 254.768))
        pathRef4.addQuadCurve(to: CGPoint(x: 293.047, y: 258.987), control: CGPoint(x: 296.352, y: 257.651))
        pathRef4.closeSubpath()
        pathRef4.move(to: CGPoint(x: 293.281, y: 257.464))
        pathRef4.addQuadCurve(to: CGPoint(x: 296.891, y: 255.425), control: CGPoint(x: 295.391, y: 256.643))
        pathRef4.addQuadCurve(to: CGPoint(x: 299.105, y: 253.093), control: CGPoint(x: 298.391, y: 254.206))
        pathRef4.addQuadCurve(to: CGPoint(x: 299.82, y: 251.464), control: CGPoint(x: 299.82, y: 251.979))
        pathRef4.addQuadCurve(to: CGPoint(x: 299.328, y: 250.925), control: CGPoint(x: 299.82, y: 250.925))
        pathRef4.addQuadCurve(to: CGPoint(x: 297.957, y: 251.464), control: CGPoint(x: 298.906, y: 250.925))
        pathRef4.addQuadCurve(to: CGPoint(x: 296.035, y: 252.87), control: CGPoint(x: 297.008, y: 252.003))
        pathRef4.addQuadCurve(to: CGPoint(x: 294.289, y: 254.909), control: CGPoint(x: 295.062, y: 253.737))
        pathRef4.addQuadCurve(to: CGPoint(x: 293.281, y: 257.464), control: CGPoint(x: 293.516, y: 256.081))
        pathRef4.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef4)
        ctx.fillPath()
        
        
        /*  Shape 5  */
        let pathRef5 = CGMutablePath()
        pathRef5.move(to: CGPoint(x: 345.992, y: 258.05))
        pathRef5.addLine(to: CGPoint(x: 345.992, y: 259.573))
        pathRef5.addQuadCurve(to: CGPoint(x: 338.762, y: 266.804), control: CGPoint(x: 342.055, y: 263.956))
        pathRef5.addQuadCurve(to: CGPoint(x: 332.328, y: 271.186), control: CGPoint(x: 335.469, y: 269.651))
        pathRef5.addQuadCurve(to: CGPoint(x: 326.258, y: 272.722), control: CGPoint(x: 329.188, y: 272.722))
        pathRef5.addQuadCurve(to: CGPoint(x: 321.91, y: 271.714), control: CGPoint(x: 323.727, y: 272.722))
        pathRef5.addQuadCurve(to: CGPoint(x: 319.168, y: 268.772), control: CGPoint(x: 320.094, y: 270.706))
        pathRef5.addQuadCurve(to: CGPoint(x: 318.242, y: 264.19), control: CGPoint(x: 318.242, y: 266.839))
        pathRef5.addQuadCurve(to: CGPoint(x: 318.91, y: 259.772), control: CGPoint(x: 318.242, y: 262.104))
        pathRef5.addQuadCurve(to: CGPoint(x: 320.844, y: 255.061), control: CGPoint(x: 319.578, y: 257.44))
        pathRef5.addQuadCurve(to: CGPoint(x: 323.949, y: 250.151), control: CGPoint(x: 322.109, y: 252.682))
        pathRef5.addQuadCurve(to: CGPoint(x: 328.273, y: 244.831), control: CGPoint(x: 325.789, y: 247.62))
        pathRef5.addQuadCurve(to: CGPoint(x: 333.359, y: 239.85), control: CGPoint(x: 330.852, y: 241.948))
        pathRef5.addQuadCurve(to: CGPoint(x: 337.906, y: 236.557), control: CGPoint(x: 335.867, y: 237.753))
        pathRef5.addQuadCurve(to: CGPoint(x: 341.691, y: 234.776), control: CGPoint(x: 339.945, y: 235.362))
        pathRef5.addQuadCurve(to: CGPoint(x: 344.586, y: 234.19), control: CGPoint(x: 343.438, y: 234.19))
        pathRef5.addQuadCurve(to: CGPoint(x: 346.578, y: 234.753), control: CGPoint(x: 345.758, y: 234.19))
        pathRef5.addQuadCurve(to: CGPoint(x: 347.844, y: 236.393), control: CGPoint(x: 347.398, y: 235.315))
        pathRef5.addQuadCurve(to: CGPoint(x: 348.289, y: 238.878), control: CGPoint(x: 348.289, y: 237.472))
        pathRef5.addQuadCurve(to: CGPoint(x: 346.484, y: 244.772), control: CGPoint(x: 348.289, y: 241.526))
        pathRef5.addQuadCurve(to: CGPoint(x: 341.984, y: 251.042), control: CGPoint(x: 344.68, y: 248.018))
        pathRef5.addQuadCurve(to: CGPoint(x: 336.84, y: 255.975), control: CGPoint(x: 339.289, y: 254.065))
        pathRef5.addQuadCurve(to: CGPoint(x: 333.312, y: 257.886), control: CGPoint(x: 334.391, y: 257.886))
        pathRef5.addQuadCurve(to: CGPoint(x: 331.965, y: 257.311), control: CGPoint(x: 332.586, y: 257.886))
        pathRef5.addQuadCurve(to: CGPoint(x: 331.344, y: 256.011), control: CGPoint(x: 331.344, y: 256.737))
        pathRef5.addQuadCurve(to: CGPoint(x: 332.762, y: 252.776), control: CGPoint(x: 331.344, y: 254.675))
        pathRef5.addQuadCurve(to: CGPoint(x: 335.855, y: 249.296), control: CGPoint(x: 334.18, y: 250.878))
        pathRef5.addQuadCurve(to: CGPoint(x: 337.859, y: 247.714), control: CGPoint(x: 337.531, y: 247.714))
        pathRef5.addQuadCurve(to: CGPoint(x: 338.023, y: 247.854), control: CGPoint(x: 338.023, y: 247.714))
        pathRef5.addQuadCurve(to: CGPoint(x: 337.777, y: 248.581), control: CGPoint(x: 338.023, y: 248.065))
        pathRef5.addQuadCurve(to: CGPoint(x: 337.531, y: 249.214), control: CGPoint(x: 337.531, y: 249.097))
        pathRef5.addQuadCurve(to: CGPoint(x: 337.672, y: 249.401), control: CGPoint(x: 337.531, y: 249.401))
        pathRef5.addQuadCurve(to: CGPoint(x: 339.969, y: 247.268), control: CGPoint(x: 338.07, y: 249.401))
        pathRef5.addQuadCurve(to: CGPoint(x: 343.449, y: 242.569), control: CGPoint(x: 341.867, y: 245.136))
        pathRef5.addQuadCurve(to: CGPoint(x: 345.031, y: 238.362), control: CGPoint(x: 345.031, y: 240.003))
        pathRef5.addQuadCurve(to: CGPoint(x: 344.738, y: 237.319), control: CGPoint(x: 345.031, y: 237.682))
        pathRef5.addQuadCurve(to: CGPoint(x: 343.859, y: 236.956), control: CGPoint(x: 344.445, y: 236.956))
        pathRef5.addQuadCurve(to: CGPoint(x: 338.879, y: 239.616), control: CGPoint(x: 342.219, y: 236.956))
        pathRef5.addQuadCurve(to: CGPoint(x: 332.035, y: 246.39), control: CGPoint(x: 335.539, y: 242.276))
        pathRef5.addQuadCurve(to: CGPoint(x: 326.188, y: 254.886), control: CGPoint(x: 328.531, y: 250.503))
        pathRef5.addQuadCurve(to: CGPoint(x: 323.844, y: 262.597), control: CGPoint(x: 323.844, y: 259.268))
        pathRef5.addQuadCurve(to: CGPoint(x: 324.418, y: 265.807), control: CGPoint(x: 323.844, y: 264.518))
        pathRef5.addQuadCurve(to: CGPoint(x: 326.105, y: 267.8), control: CGPoint(x: 324.992, y: 267.097))
        pathRef5.addQuadCurve(to: CGPoint(x: 328.789, y: 268.503), control: CGPoint(x: 327.219, y: 268.503))
        pathRef5.addQuadCurve(to: CGPoint(x: 336.5, y: 265.854), control: CGPoint(x: 332.188, y: 268.503))
        pathRef5.addQuadCurve(to: CGPoint(x: 345.992, y: 258.05), control: CGPoint(x: 340.812, y: 263.206))
        pathRef5.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef5)
        ctx.fillPath()
        
        
        /*  Shape 6  */
        let pathRef6 = CGMutablePath()
        pathRef6.move(to: CGPoint(x: 356.984, y: 257.886))
        pathRef6.addLine(to: CGPoint(x: 356.984, y: 259.62))
        pathRef6.addQuadCurve(to: CGPoint(x: 349.016, y: 266.112), control: CGPoint(x: 352.086, y: 266.112))
        pathRef6.addQuadCurve(to: CGPoint(x: 346.402, y: 264.296), control: CGPoint(x: 347.352, y: 266.112))
        pathRef6.addQuadCurve(to: CGPoint(x: 345.453, y: 259.526), control: CGPoint(x: 345.453, y: 262.479))
        pathRef6.addQuadCurve(to: CGPoint(x: 346.578, y: 253.843), control: CGPoint(x: 345.453, y: 257.136))
        pathRef6.addQuadCurve(to: CGPoint(x: 349.59, y: 247.163), control: CGPoint(x: 347.703, y: 250.55))
        pathRef6.addQuadCurve(to: CGPoint(x: 353.504, y: 241.257), control: CGPoint(x: 351.477, y: 243.776))
        pathRef6.addQuadCurve(to: CGPoint(x: 357.266, y: 237.729), control: CGPoint(x: 355.531, y: 238.737))
        pathRef6.addQuadCurve(to: CGPoint(x: 358.367, y: 237.307), control: CGPoint(x: 357.969, y: 237.307))
        pathRef6.addQuadCurve(to: CGPoint(x: 359.023, y: 237.741), control: CGPoint(x: 358.859, y: 237.307))
        pathRef6.addQuadCurve(to: CGPoint(x: 359.188, y: 239.229), control: CGPoint(x: 359.188, y: 238.175))
        pathRef6.addQuadCurve(to: CGPoint(x: 356.539, y: 247.233), control: CGPoint(x: 359.188, y: 242.487))
        pathRef6.addQuadCurve(to: CGPoint(x: 349.156, y: 256.925), control: CGPoint(x: 353.891, y: 251.979))
        pathRef6.addQuadCurve(to: CGPoint(x: 348.922, y: 258.8), control: CGPoint(x: 348.922, y: 258.143))
        pathRef6.addQuadCurve(to: CGPoint(x: 349.566, y: 261.237), control: CGPoint(x: 348.922, y: 260.3))
        pathRef6.addQuadCurve(to: CGPoint(x: 351.359, y: 262.175), control: CGPoint(x: 350.211, y: 262.175))
        pathRef6.addQuadCurve(to: CGPoint(x: 352.625, y: 261.718), control: CGPoint(x: 351.945, y: 262.175))
        pathRef6.addQuadCurve(to: CGPoint(x: 354.055, y: 260.581), control: CGPoint(x: 353.305, y: 261.261))
        pathRef6.addQuadCurve(to: CGPoint(x: 356.984, y: 257.886), control: CGPoint(x: 354.805, y: 259.901))
        pathRef6.closeSubpath()
        pathRef6.move(to: CGPoint(x: 349.977, y: 253.667))
        pathRef6.addQuadCurve(to: CGPoint(x: 352.332, y: 250.948), control: CGPoint(x: 351.195, y: 252.472))
        pathRef6.addQuadCurve(to: CGPoint(x: 354.477, y: 247.69), control: CGPoint(x: 353.469, y: 249.425))
        pathRef6.addQuadCurve(to: CGPoint(x: 356.059, y: 244.573), control: CGPoint(x: 355.484, y: 245.956))
        pathRef6.addQuadCurve(to: CGPoint(x: 356.633, y: 242.487), control: CGPoint(x: 356.633, y: 243.19))
        pathRef6.addQuadCurve(to: CGPoint(x: 356.258, y: 241.948), control: CGPoint(x: 356.633, y: 241.948))
        pathRef6.addQuadCurve(to: CGPoint(x: 355.719, y: 242.206), control: CGPoint(x: 356.117, y: 241.948))
        pathRef6.addQuadCurve(to: CGPoint(x: 352.508, y: 246.788), control: CGPoint(x: 354.289, y: 243.378))
        pathRef6.addQuadCurve(to: CGPoint(x: 349.977, y: 253.667), control: CGPoint(x: 350.727, y: 250.198))
        pathRef6.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef6)
        ctx.fillPath()
        
        
        /*  Shape 7  */
        let pathRef7 = CGMutablePath()
        pathRef7.move(to: CGPoint(x: 371.844, y: 258.097))
        pathRef7.addLine(to: CGPoint(x: 371.844, y: 259.667))
        pathRef7.addQuadCurve(to: CGPoint(x: 369.359, y: 261.542), control: CGPoint(x: 370.297, y: 261.073))
        pathRef7.addQuadCurve(to: CGPoint(x: 366.664, y: 261.917), control: CGPoint(x: 368.422, y: 262.011))
        pathRef7.addQuadCurve(to: CGPoint(x: 361.297, y: 265.526), control: CGPoint(x: 363.617, y: 265.526))
        pathRef7.addQuadCurve(to: CGPoint(x: 358.906, y: 264.659), control: CGPoint(x: 359.984, y: 265.526))
        pathRef7.addQuadCurve(to: CGPoint(x: 357.184, y: 262.292), control: CGPoint(x: 357.828, y: 263.792))
        pathRef7.addQuadCurve(to: CGPoint(x: 356.539, y: 258.94), control: CGPoint(x: 356.539, y: 260.792))
        pathRef7.addQuadCurve(to: CGPoint(x: 357.535, y: 255.612), control: CGPoint(x: 356.539, y: 257.44))
        pathRef7.addQuadCurve(to: CGPoint(x: 360.113, y: 252.202), control: CGPoint(x: 358.531, y: 253.784))
        pathRef7.addQuadCurve(to: CGPoint(x: 363.5, y: 249.647), control: CGPoint(x: 361.695, y: 250.62))
        pathRef7.addQuadCurve(to: CGPoint(x: 366.852, y: 248.675), control: CGPoint(x: 365.305, y: 248.675))
        pathRef7.addQuadCurve(to: CGPoint(x: 368.586, y: 249.015), control: CGPoint(x: 367.953, y: 248.675))
        pathRef7.addQuadCurve(to: CGPoint(x: 369.219, y: 249.964), control: CGPoint(x: 369.219, y: 249.354))
        pathRef7.addQuadCurve(to: CGPoint(x: 368.68, y: 251.042), control: CGPoint(x: 369.219, y: 250.432))
        pathRef7.addQuadCurve(to: CGPoint(x: 369.898, y: 251.663), control: CGPoint(x: 369.57, y: 251.229))
        pathRef7.addQuadCurve(to: CGPoint(x: 370.227, y: 253.245), control: CGPoint(x: 370.227, y: 252.097))
        pathRef7.addQuadCurve(to: CGPoint(x: 369.699, y: 256.081), control: CGPoint(x: 370.227, y: 254.37))
        pathRef7.addQuadCurve(to: CGPoint(x: 368.258, y: 259.292), control: CGPoint(x: 369.172, y: 257.792))
        pathRef7.addLine(to: CGPoint(x: 368.68, y: 259.714))
        pathRef7.addLine(to: CGPoint(x: 369.031, y: 259.714))
        pathRef7.addQuadCurve(to: CGPoint(x: 369.816, y: 259.515), control: CGPoint(x: 369.43, y: 259.714))
        pathRef7.addQuadCurve(to: CGPoint(x: 370.508, y: 259.093), control: CGPoint(x: 370.203, y: 259.315))
        pathRef7.addQuadCurve(to: CGPoint(x: 371.844, y: 258.097), control: CGPoint(x: 370.812, y: 258.87))
        pathRef7.closeSubpath()
        pathRef7.move(to: CGPoint(x: 367.016, y: 251.932))
        pathRef7.addQuadCurve(to: CGPoint(x: 363.688, y: 254.054), control: CGPoint(x: 365.07, y: 253.104))
        pathRef7.addQuadCurve(to: CGPoint(x: 361.344, y: 255.975), control: CGPoint(x: 362.305, y: 255.003))
        pathRef7.addQuadCurve(to: CGPoint(x: 360.055, y: 257.932), control: CGPoint(x: 360.383, y: 256.948))
        pathRef7.addQuadCurve(to: CGPoint(x: 359.469, y: 260.768), control: CGPoint(x: 359.469, y: 260.557))
        pathRef7.addQuadCurve(to: CGPoint(x: 361.625, y: 262.315), control: CGPoint(x: 359.469, y: 262.315))
        pathRef7.addQuadCurve(to: CGPoint(x: 365, y: 260.581), control: CGPoint(x: 362.633, y: 262.315))
        pathRef7.addQuadCurve(to: CGPoint(x: 364.602, y: 258.472), control: CGPoint(x: 364.602, y: 259.479))
        pathRef7.addQuadCurve(to: CGPoint(x: 365.211, y: 255.46), control: CGPoint(x: 364.602, y: 256.995))
        pathRef7.addQuadCurve(to: CGPoint(x: 367.016, y: 251.932), control: CGPoint(x: 365.82, y: 253.925))
        pathRef7.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef7)
        ctx.fillPath()
        
        
        /*  Shape 8  */
        let pathRef8 = CGMutablePath()
        pathRef8.move(to: CGPoint(x: 385.906, y: 258.19))
        pathRef8.addLine(to: CGPoint(x: 385.906, y: 259.761))
        pathRef8.addQuadCurve(to: CGPoint(x: 381.816, y: 263.581), control: CGPoint(x: 383.398, y: 262.222))
        pathRef8.addQuadCurve(to: CGPoint(x: 378.863, y: 265.69), control: CGPoint(x: 380.234, y: 264.94))
        pathRef8.addQuadCurve(to: CGPoint(x: 376.18, y: 266.44), control: CGPoint(x: 377.492, y: 266.44))
        pathRef8.addQuadCurve(to: CGPoint(x: 373.812, y: 265.421), control: CGPoint(x: 374.891, y: 266.44))
        pathRef8.addQuadCurve(to: CGPoint(x: 372.125, y: 262.749), control: CGPoint(x: 372.734, y: 264.401))
        pathRef8.addQuadCurve(to: CGPoint(x: 371.516, y: 259.245), control: CGPoint(x: 371.516, y: 261.097))
        pathRef8.addQuadCurve(to: CGPoint(x: 372.219, y: 256.409), control: CGPoint(x: 371.516, y: 257.651))
        pathRef8.addQuadCurve(to: CGPoint(x: 374.938, y: 253.198), control: CGPoint(x: 372.922, y: 255.167))
        pathRef8.addQuadCurve(to: CGPoint(x: 379.379, y: 249.577), control: CGPoint(x: 377.328, y: 250.854))
        pathRef8.addQuadCurve(to: CGPoint(x: 382.602, y: 248.3), control: CGPoint(x: 381.43, y: 248.3))
        pathRef8.addQuadCurve(to: CGPoint(x: 384.031, y: 248.886), control: CGPoint(x: 383.445, y: 248.3))
        pathRef8.addQuadCurve(to: CGPoint(x: 384.617, y: 250.362), control: CGPoint(x: 384.617, y: 249.472))
        pathRef8.addQuadCurve(to: CGPoint(x: 383.844, y: 252.495), control: CGPoint(x: 384.617, y: 251.112))
        pathRef8.addQuadCurve(to: CGPoint(x: 382.109, y: 254.897), control: CGPoint(x: 383.07, y: 253.878))
        pathRef8.addQuadCurve(to: CGPoint(x: 380.586, y: 255.917), control: CGPoint(x: 381.148, y: 255.917))
        pathRef8.addQuadCurve(to: CGPoint(x: 379.977, y: 255.261), control: CGPoint(x: 379.977, y: 255.917))
        pathRef8.addQuadCurve(to: CGPoint(x: 380.012, y: 254.909), control: CGPoint(x: 380, y: 255.073))
        pathRef8.addQuadCurve(to: CGPoint(x: 380.023, y: 254.581), control: CGPoint(x: 380.023, y: 254.745))
        pathRef8.addQuadCurve(to: CGPoint(x: 379.824, y: 254.265), control: CGPoint(x: 380.023, y: 254.3))
        pathRef8.addQuadCurve(to: CGPoint(x: 379.344, y: 254.44), control: CGPoint(x: 379.625, y: 254.229))
        pathRef8.addQuadCurve(to: CGPoint(x: 376.133, y: 256.749), control: CGPoint(x: 377, y: 256.081))
        pathRef8.addQuadCurve(to: CGPoint(x: 374.762, y: 258.097), control: CGPoint(x: 375.266, y: 257.417))
        pathRef8.addQuadCurve(to: CGPoint(x: 374.258, y: 259.526), control: CGPoint(x: 374.258, y: 258.776))
        pathRef8.addQuadCurve(to: CGPoint(x: 375.148, y: 261.776), control: CGPoint(x: 374.258, y: 260.909))
        pathRef8.addQuadCurve(to: CGPoint(x: 377.469, y: 262.643), control: CGPoint(x: 376.039, y: 262.643))
        pathRef8.addQuadCurve(to: CGPoint(x: 381.02, y: 261.507), control: CGPoint(x: 378.945, y: 262.643))
        pathRef8.addQuadCurve(to: CGPoint(x: 385.906, y: 258.19), control: CGPoint(x: 383.094, y: 260.37))
        pathRef8.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef8)
        ctx.fillPath()
        
        
        /*  Shape 9  */
        let pathRef9 = CGMutablePath()
        pathRef9.move(to: CGPoint(x: 403.484, y: 258.143))
        pathRef9.addLine(to: CGPoint(x: 403.484, y: 259.714))
        pathRef9.addQuadCurve(to: CGPoint(x: 399.078, y: 264.366), control: CGPoint(x: 400.859, y: 262.784))
        pathRef9.addQuadCurve(to: CGPoint(x: 396.102, y: 265.948), control: CGPoint(x: 397.297, y: 265.948))
        pathRef9.addQuadCurve(to: CGPoint(x: 394.027, y: 265.268), control: CGPoint(x: 394.953, y: 265.948))
        pathRef9.addQuadCurve(to: CGPoint(x: 392.363, y: 263.393), control: CGPoint(x: 393.102, y: 264.589))
        pathRef9.addQuadCurve(to: CGPoint(x: 390.617, y: 260.065), control: CGPoint(x: 391.625, y: 262.198))
        pathRef9.addQuadCurve(to: CGPoint(x: 388.461, y: 262.819), control: CGPoint(x: 389.422, y: 261.542))
        pathRef9.addQuadCurve(to: CGPoint(x: 387.125, y: 264.518), control: CGPoint(x: 387.5, y: 264.097))
        pathRef9.addQuadCurve(to: CGPoint(x: 386.445, y: 264.94), control: CGPoint(x: 386.75, y: 264.94))
        pathRef9.addQuadCurve(to: CGPoint(x: 385.531, y: 264.132), control: CGPoint(x: 385.812, y: 264.94))
        pathRef9.addQuadCurve(to: CGPoint(x: 385.25, y: 261.776), control: CGPoint(x: 385.25, y: 263.323))
        pathRef9.addQuadCurve(to: CGPoint(x: 385.754, y: 257.71), control: CGPoint(x: 385.25, y: 259.667))
        pathRef9.addQuadCurve(to: CGPoint(x: 387.207, y: 253.901), control: CGPoint(x: 386.258, y: 255.753))
        pathRef9.addQuadCurve(to: CGPoint(x: 389.645, y: 249.905), control: CGPoint(x: 388.156, y: 252.05))
        pathRef9.addQuadCurve(to: CGPoint(x: 392.984, y: 245.417), control: CGPoint(x: 391.133, y: 247.761))
        pathRef9.addQuadCurve(to: CGPoint(x: 397.391, y: 240.132), control: CGPoint(x: 395.539, y: 242.182))
        pathRef9.addQuadCurve(to: CGPoint(x: 400.613, y: 237.038), control: CGPoint(x: 399.242, y: 238.081))
        pathRef9.addQuadCurve(to: CGPoint(x: 402.898, y: 235.995), control: CGPoint(x: 401.984, y: 235.995))
        pathRef9.addQuadCurve(to: CGPoint(x: 404.023, y: 237.003), control: CGPoint(x: 404.023, y: 235.995))
        pathRef9.addQuadCurve(to: CGPoint(x: 399.875, y: 243.249), control: CGPoint(x: 404.023, y: 237.87))
        pathRef9.addQuadCurve(to: CGPoint(x: 387.781, y: 257.932), control: CGPoint(x: 395.727, y: 248.628))
        pathRef9.addLine(to: CGPoint(x: 387.781, y: 259.948))
        pathRef9.addQuadCurve(to: CGPoint(x: 396.348, y: 251.487), control: CGPoint(x: 393.102, y: 254.253))
        pathRef9.addQuadCurve(to: CGPoint(x: 401.375, y: 248.722), control: CGPoint(x: 399.594, y: 248.722))
        pathRef9.addQuadCurve(to: CGPoint(x: 402.5, y: 249.577), control: CGPoint(x: 402.102, y: 248.722))
        pathRef9.addQuadCurve(to: CGPoint(x: 402.898, y: 251.557), control: CGPoint(x: 402.898, y: 250.432))
        pathRef9.addQuadCurve(to: CGPoint(x: 400.93, y: 255.811), control: CGPoint(x: 402.898, y: 253.854))
        pathRef9.addQuadCurve(to: CGPoint(x: 394.883, y: 260.3), control: CGPoint(x: 398.961, y: 257.768))
        pathRef9.addQuadCurve(to: CGPoint(x: 396.125, y: 261.835), control: CGPoint(x: 395.586, y: 261.354))
        pathRef9.addQuadCurve(to: CGPoint(x: 397.484, y: 262.315), control: CGPoint(x: 396.664, y: 262.315))
        pathRef9.addQuadCurve(to: CGPoint(x: 399.055, y: 261.823), control: CGPoint(x: 398.211, y: 262.315))
        pathRef9.addQuadCurve(to: CGPoint(x: 400.777, y: 260.581), control: CGPoint(x: 399.898, y: 261.331))
        pathRef9.addQuadCurve(to: CGPoint(x: 403.484, y: 258.143), control: CGPoint(x: 401.656, y: 259.831))
        pathRef9.closeSubpath()
        pathRef9.move(to: CGPoint(x: 394.227, y: 259.339))
        pathRef9.addQuadCurve(to: CGPoint(x: 396.441, y: 257.522), control: CGPoint(x: 395.117, y: 258.753))
        pathRef9.addQuadCurve(to: CGPoint(x: 398.703, y: 254.968), control: CGPoint(x: 397.766, y: 256.292))
        pathRef9.addQuadCurve(to: CGPoint(x: 399.641, y: 252.753), control: CGPoint(x: 399.641, y: 253.643))
        pathRef9.addQuadCurve(to: CGPoint(x: 399.312, y: 252.378), control: CGPoint(x: 399.641, y: 252.378))
        pathRef9.addQuadCurve(to: CGPoint(x: 396.254, y: 254.089), control: CGPoint(x: 398.422, y: 252.378))
        pathRef9.addQuadCurve(to: CGPoint(x: 392.023, y: 258.472), control: CGPoint(x: 394.086, y: 255.8))
        pathRef9.addQuadCurve(to: CGPoint(x: 394.227, y: 259.339), control: CGPoint(x: 392.914, y: 258.472))
        pathRef9.closeSubpath()
        
        ctx.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
        ctx.addPath(pathRef9)
        ctx.fillPath()
        

    }

}
