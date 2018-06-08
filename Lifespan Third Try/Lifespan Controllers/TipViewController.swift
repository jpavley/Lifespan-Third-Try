//
//  TipViewController.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 5/10/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

enum TipButtonTag: Int {
    case lifeExpectancy = 1000, activity, stress, risk, genetics, gender
}

struct Tip {
    var title: String
    var explanation: String
    var low: String
    var middle: String
    var high: String
    var direction: String
}

class TipViewController: UIViewController {

    @IBOutlet weak var tipTitle: UILabel!
    @IBOutlet weak var tipDescription: UILabel!
    @IBOutlet weak var tipLowExplanation: UILabel!
    @IBOutlet weak var tipMiddleExplanation: UILabel!
    @IBOutlet weak var tipHighExplanation: UILabel!
    @IBOutlet weak var tipDirection: UILabel!
    @IBOutlet weak var dimissButton: UIButton!
    
    @IBOutlet weak var roundedView: UIView!
    
    var tipDictionary = [TipButtonTag:Tip]()
    var tipSource: TipButtonTag!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        roundedView.layer.cornerRadius = 40
        loadTipData()
        
        if tipSource != nil {
            updateView()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GotItAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateView() {
        if let tip = tipDictionary[tipSource] {
            tipTitle.text = tip.title
            tipDescription.text = tip.explanation
            tipLowExplanation.text = tip.low
            tipMiddleExplanation.text = tip.middle
            tipHighExplanation.text = tip.high
            tipDirection.text = tip.direction
            dimissButton.setTitle("Got it!", for: .normal)

        }
    }
    
    func loadTipData() {
        // TODO: Read this text from a text file!
        tipDictionary[.lifeExpectancy] = Tip(title: "Life Expectancy",
                                             explanation: "How long do you think you will live?",
                                             low: "The country where you live effects your life expectancy. In the US the average life expectancy is around 83 years.",
                                             middle: "Studies show that your biological sex effects your life expectancy. Women in the US live around 5.8 years longer than men.",
                                             high: "The longest human lives are around 120 years.",
                                             direction: "Higher is better")
        tipDictionary[.activity] = Tip(title: "Activity",
                                       explanation: "On a scale from 1 to 10 how active are you?",
                                       low: "Set the slider to 1 if you are a couch potato whose favorite sport is sitting.",
                                       middle: "Slide over to 5 if you are a brisk walker who hits the gym now and then.",
                                       high: "Set the slider to 10 if you are a fitness enthusiast who maintains an outstanding BMI.",
                                       direction: "Higher is better")
        tipDictionary[.stress] = Tip(title: "Stress",
                                     explanation: "On a scale from 1 to 10 how stressed are you?",
                                     low: "Set the slider to 1 if you are a stoic who meditates daily.",
                                     middle: "Slide over to 5 if you feel well balanced with a job, money in the bank, and a loving family.",
                                     high: "Set the slider to 10 if you are overworked and underappreciated.",
                                     direction: "Lower is better")
        tipDictionary[.risk] = Tip(title: "Risk",
                                   explanation: "On a scale from 1 to 10 how much risk are you inviting into your life?",
                                   low: "Set the slider to 1 if you avoid extreme activities and behaviors.",
                                   middle: "Slide over to 5 if you live moderately and obey posted signs and placards.",
                                   high: "Set the slider to 10 if you live hard and play harder.",
                                   direction: "Lower is better")
        tipDictionary[.genetics] = Tip(title: "Genetics",
                                       explanation: "On a scale from 1 to 10 how good is your genetic material?",
                                       low: "Set the slider to 1 if chronic, dreadful diseases run rampant in your family.",
                                       middle: "Slide over to 5 if your family members usually make it well into their 80s.",
                                       high: "Set the slider to 10 if your ancestors lived well into their 90s while recklessly smoking and drinking.",
                                       direction: "Higher is better")
        tipDictionary[.gender] = Tip(title: "Gender and Pronouns",
                                     explanation: "You can choose the pronouns used by the analysis tab text.",
                                     low: "The pronouns you choose have no effect on how Lifespan estimates your life expectancy.",
                                     middle: "We've included gendered and gender neutral pronouns.",
                                     high: "Choose what works for you.",
                                     direction: "All pronouns are good!")
        


    }
    
}


extension TipViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
