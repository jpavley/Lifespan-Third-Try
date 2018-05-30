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

        setBiometerView()
    }
    
    fileprivate func setBiometerView() {
        
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
    }

}
