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
        
        guard let lbm = tb.lifeBioMeter else {
            return
        }
        
        let tf = TextFormatter()
        
        let chronAge = Int(lbm.chronologicalAge)
        let chronText = tf.createStringWithBoldPart(with: "Chronological Age ", and: "\(chronAge)", and: " years")
        chronologicalKeyLabel.attributedText = chronText
        
        let bioAge = Int(lbm.biologicalAge)
        
        let bioText = tf.createStringWithBoldPart(with: "Biological Age ", and: "\(bioAge)", and: " years")
        biologicalKeyLabel.attributedText = bioText
        
        let lifeBonus = lbm.lifeBonus
        var bonusTerm = ""
        if lifeBonus >= 0 {
            bonusTerm = "bonus"
        } else {
            bonusTerm = "penalty"
        }
        let livingRateText = tf.createStringWithBoldPart(with: "Life \(bonusTerm) of ", and: "\(abs(lifeBonus))", and: " %")
        livingKeyLabel.attributedText = livingRateText

        setOdometerTextView()
    }
    
    fileprivate func setOdometerTextView() {
        let tb = self.tabBarController as! TabViewController
        tb.updateLife()
        
        guard let up = tb.userProfile else {
            return
        }
        
        let monthName = CalendarUtilities.monthName(from: up.birthMonth)
        let odoLabelString = "Days spent since \(up.birthDay) \(monthName) \(up.birthYear)"
        odometerTextView.odoLabel = odoLabelString
        
        // Convert the number of days from Now to the user's birthday to an array of Ints
        // for display in the odometer
        let dayCount = CalendarUtilities.daysFromNow(from: up.birthDate)
        let dayCountString = String(dayCount)
        let dayCountArray = dayCountString.map { String($0) }
        var rightSizedArray: [String]
        
        // the Odometer only has 6 slots for 6 Ints
        if dayCountArray.count < 6 {
            
            // pad left
            let difference = 6 - dayCountArray.count
            rightSizedArray = Array(repeating: "0", count: difference)
            rightSizedArray += dayCountArray
        } else {
            
            // drop right (honestly this will never happen!)
            rightSizedArray = Array(dayCountArray[..<6])
        }
        
        let finalArray = rightSizedArray.map { Int($0)! }
        odometerTextView.odoValues = finalArray

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
