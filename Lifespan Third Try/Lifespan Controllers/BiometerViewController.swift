//
//  BiometerViewController.swift
//  Lifespan Third Try
//
//  Created by jpavley12 on 3/25/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

class BiometerViewController: UIViewController {
    
    // MARK: - Outlets -
    
    @IBOutlet weak var chronologicalKeyLabel: UILabel!
    @IBOutlet weak var biologicalKeyLabel: UILabel!
    @IBOutlet weak var livingKeyLabel: UILabel!
    
    @IBOutlet weak var odometerTextView: OdometerTextView!
    
    // MARK: - Properties -
    
    let chronologicalHandTag = 100
    let biologicalHandTag = 200
    
    // MARK: - Methods -
    
    fileprivate func updateView() {
        let tb = self.tabBarController as! TabViewController
        tb.updateLife()
        
        guard let up = tb.userProfile, let ls = tb.lifeSpan, let lbm = tb.lifeBioMeter else {
            return
        }
        
        let us = up.calcUserStats(from: ls, and: lbm)
        
        let tf = TextFormatter()
        
        let chronText = tf.createStringWithBoldPart(with: "Chronological Age ", and: "\(us.chronologicalAge)", and: " years")
        chronologicalKeyLabel.attributedText = chronText
        
        let bioText = tf.createStringWithBoldPart(with: "Biological Age ", and: "\(us.biologicalAge)", and: " years")
        biologicalKeyLabel.attributedText = bioText
        
        var bonusTerm = ""
        if us.lifeBonus >= 0 {
            bonusTerm = "bonus"
        } else {
            bonusTerm = "penalty"
        }
        let livingRateText = tf.createStringWithBoldPart(with: "Life \(bonusTerm) of ", and: "\(abs(us.lifeBonus))", and: " %")
        livingKeyLabel.attributedText = livingRateText
        
        setBiometerHands()
        setOdometerText()
    }
    
    fileprivate func setBiometerHands() {
        let tb = self.tabBarController as! TabViewController
        tb.updateLife()
        
        guard let lbm = tb.lifeBioMeter else {
            return
        }
        
        let chronHand = view.viewWithTag(chronologicalHandTag) as! ChronologicalHandView
        chronHand.angle = lbm.chronAgeHandAngle
        
        let bioHand = view.viewWithTag(biologicalHandTag) as! BiologicalHandView
        bioHand.angle = lbm.bioAgeHandAngle

    }
    
    fileprivate func setOdometerText() {
        
        let tb = self.tabBarController as! TabViewController
        tb.updateLife()
        
        guard let up = tb.userProfile, let lbm = tb.lifeBioMeter else {
            return
        }
        
        let monthName = CalendarUtilities.monthName(from: up.birthMonth)
        let odoLabelString = "Days spent since \(up.birthDay) \(monthName) \(up.birthYear)"
        odometerTextView.odoLabel = odoLabelString
        odometerTextView.odoValues = lbm.daysSpent(from: up.birthDate)
    }
    
    // MARK: - Overrides -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NOTE: All initalization work done in viewWillAppear
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
        odometerTextView.setNeedsDisplay()
    }

}
