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
        
        guard let ls = tb.lifeSpan, let lc = tb.lifeClock, let up = tb.userProfile else {
            return
        }
        
        let tf = TextFormatter()
        
        let chronAge = up.age
        let chronText = tf.createStringWithBoldPart(with: "Chronological Age ", and: "\(chronAge.rounded())", and: " years")
        chronologicalKeyLabel.attributedText = chronText
        
        let lifeFactor = ls.modifiedALE!/ls.averageLifeExpectancy!
        print(ls.modifiedALE!)
        let bioAge = chronAge * lifeFactor
        
        let bioText = tf.createStringWithBoldPart(with: "Biological Age ", and: "\(bioAge.rounded())", and: " years")
        biologicalKeyLabel.attributedText = bioText
    
        let invertedLifeFactor = Int((1.0 - lifeFactor) * 100) * -1
        //let lifeFactorString = String(format: "%.2f", invertedLifeFactor)
        let livingRateText = tf.createStringWithBoldPart(with: "Life Bonus of ", and: "\(invertedLifeFactor)", and: " %")
        livingKeyLabel.attributedText = livingRateText

        setBiometerView(with: lc)
    }
    
    fileprivate func setBiometerView(with lifeClock: LifeClock) {
        
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
