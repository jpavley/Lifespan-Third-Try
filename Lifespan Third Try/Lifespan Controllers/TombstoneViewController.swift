//
//  TombstoneViewController.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 4/9/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

class TombstoneViewController: UIViewController {

    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var subheadLabel: UILabel!
    @IBOutlet weak var footnoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    func updateView() {
        
        let tb = self.parent!.tabBarController as! TabViewController
        tb.updateLife()
        
        guard let userProfile = tb.userProfile, let lifeSpan = tb.lifeSpan, let lbm = tb.lifeBioMeter else {
            return
        }
        
        let us = userProfile.calcUserStats(from: lifeSpan, and: lbm)
        headlineLabel.text = userProfile.name
        
        let birthYear = us.birthYear
        let deathYear = us.modifiedDeathYear
        subheadLabel.text = "\(birthYear) to \(deathYear)"
        
        let ageAtDeath = us.modifiedLifeExpectancy
        footnoteLabel.text = "Estimated Age at Death: \(ageAtDeath)"
        
        if us.modifiedLifeExpectancy == us.lifeExpectancy {
            footnoteLabel.textColor = UIColor.blue
        } else if us.modifiedLifeExpectancy > us.lifeExpectancy {
//            if #available(iOS 11.0, *) {
//                footnoteLabel.textColor = UIColor(named: "DarkGreen")
//            } else {
                // Fallback on earlier versions
                footnoteLabel.textColor = UIColor(red: 0, green: 0.56, blue: 0, alpha: 1.0)
//            }
        } else if us.modifiedLifeExpectancy < us.lifeExpectancy {
            footnoteLabel.textColor = UIColor.red
        }

    }
}
