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

//        // Do any additional setup after loading the view.
//        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.regular)
//        let blurView = UIVisualEffectView(effect: blurEffect)
//        blurView.frame = view.bounds
//        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        //view.addSubview(blurView)
//        view.insertSubview(blurView, at: 0)
        
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
        tb.updateLifeClock()
        
        guard let userProfile = tb.userProfile, let lifeSpan = tb.lifeSpan else {
            return
        }
        
        let us = userProfile.calcUserStats(from: lifeSpan)
        headlineLabel.text = userProfile.name
        
        let birthYear = us.birthYear
        let deathYear = us.modifiedDeathYear
        subheadLabel.text = "\(birthYear) to \(deathYear)"
        
        let ageAtDeath = us.modifiedLifeExpectancy
        footnoteLabel.text = "Aged \(ageAtDeath)"
    }
}
