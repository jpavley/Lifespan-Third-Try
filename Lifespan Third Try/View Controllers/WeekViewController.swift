//
//  WeekViewController.swift
//  Lifespan Third Try
//
//  Created by jpavley12 on 3/25/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController {
    
    @IBOutlet weak var timeSpentLabel: UILabel!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    @IBOutlet weak var analysisText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func updateView() {
        
        let tb = self.tabBarController as! TabViewController
        tb.updateLifeClock()
        
        guard let userProfile = tb.userProfile, let lifeSpan = tb.lifeSpan else {
            return
        }
                
        timeSpentLabel.text = lifeSpan.clockDescriptionSpent
        timeRemainingLabel.text = lifeSpan.clockDescriptionRemaining
        
        analysisText.text = userProfile.generateAnalysis(lifeSpan: lifeSpan)
    }
        
    // MARK: - Navigation
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }


}

