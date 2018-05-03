//
//  ClockViewController.swift
//  Lifespan Third Try
//
//  Created by jpavley12 on 3/25/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController {
    
    @IBOutlet weak var hourKeyLabel: UILabel!
    @IBOutlet weak var minuteKeyLabel: UILabel!
    @IBOutlet weak var secondKeyLabel: UILabel!
    
    
    let minuteHandTag = 200
    let hourHandTag = 300
    let secondHandTag = 400
    
    let spentSegment = 0
    let remainingSegment = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    fileprivate func updateView() {
        
        let tb = self.tabBarController as! TabViewController
        tb.updateLifeClock()
        
        guard let lifeSpan = tb.lifeSpan, let lifeClock = tb.lifeClock else {
            return
        }
        
        let hourAttributedString = createAttributedKeyString(with: "One hour is ", and: "\(lifeSpan.yearsPerHour)", and: " years")
        hourKeyLabel.attributedText = hourAttributedString
        
        let minuetAttributedString = createAttributedKeyString(with: "One minuet is ", and: "\(lifeSpan.monthsPerMinutes)", and: " months")
        minuteKeyLabel.attributedText = minuetAttributedString
        
        let secondAttributedString = createAttributedKeyString(with: "One second is ", and: "\(lifeSpan.daysPerSeconds)", and: " days")
        secondKeyLabel.attributedText = secondAttributedString
        
        setClockView(with: lifeClock)
        
    }
    
    fileprivate func createAttributedKeyString(with text1: String, and text2: String, and text3: String) -> NSMutableAttributedString {
        
        let plainFontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: UIFontTextStyle.body)
        let boldFontDescriptor = plainFontDescriptor.withSymbolicTraits(.traitBold)
        
        let plainFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        let boldFontSize = plainFont.pointSize + 4
        let boldFont = UIFont(descriptor: boldFontDescriptor!, size: boldFontSize)
        
        let plainAttributes = [NSAttributedStringKey.font : plainFont]
        let boldAttributes = [NSAttributedStringKey.font : boldFont]
        
        let mainString = NSMutableAttributedString(string: text1,attributes: plainAttributes)
        let middleString = NSMutableAttributedString(string: text2, attributes: boldAttributes)
        let endString = NSMutableAttributedString(string: text3,attributes: plainAttributes)
        
        mainString.append(middleString)
        mainString.append(endString)
        
        return mainString
    }
        
    fileprivate func setClockView(with lifeClock: LifeClock) {
        let hourHand = view.viewWithTag(hourHandTag) as! HourHandView
        let minuteHand = view.viewWithTag(minuteHandTag) as! MinuteHandView
        let secondHand = view.viewWithTag(secondHandTag) as! SecondHandView

        hourHand.angle = lifeClock.hourHandAngle
        minuteHand.angle = lifeClock.minuteHandAngle
        secondHand.angle = lifeClock.secondHandAngle
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

