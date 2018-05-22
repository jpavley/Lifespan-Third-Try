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
                                             explanation: "How long do you think you will live, all things being equal?",
                                             low: "The average American can expect to live for around 83 years (as of 2018).",
                                             middle: "Women tend to little live longer, men a little less.",
                                             high: "The longest documented human life is 122 years.",
                                             direction: "Higher is better.")
        tipDictionary[.activity] = Tip(title: "Activity",
                                       explanation: "On a scale from 1 to 10 how active are you?",
                                       low: "If you are a couch potato whose favorite sport is eating score a 1.",
                                       middle: "If you are a brisk walker a who hits the gym a couple of days a week score a 5.",
                                       high: "If you are a CrossFit enthusiast who maintains a perfect BMI score a 10.",
                                       direction: "Higher is better")
        tipDictionary[.stress] = Tip(title: "Stress",
                                     explanation: "On a scale from 1 to 10 how stressed out are you?",
                                     low: "if you are a stoic who meditates daily and keep your emotions in check like Mr. Spock score a 1.",
                                     middle: "If you are mentally well balanced with a job, a bit of money in the bank, and a loving family sore a 5.",
                                     high: "If you are passionately overworked, underappreciated, and living in a metaphorical warzone score a 10.",
                                     direction: "Lower is better")
        tipDictionary[.risk] = Tip(title: "Risk",
                                   explanation: "On a scale from 1 to 10 how much risk are you inviting into your life?",
                                   low: "If you avoid drugs, guns, alcohol, fast cars, and contact sports score a 1.",
                                   middle: "If you drink moderately, occasionally ski, and drive in the fast lane sore a 5.",
                                   high: "If you are an adrenalin junkie who drag races, lives hard, and plays harder score a 10.",
                                   direction: "Lower is better")
        tipDictionary[.genetics] = Tip(title: "Genetics",
                                       explanation: "On a scale from 1 to 10 how good is your genetic material?",
                                       low: "If chronic diseases run rampant in your family and your parents died young score a 1.",
                                       middle: "If you parents lived well into their eighties and age-related diseases are rare in your family sore a 5.",
                                       high: "If your parents lived well into their 90s or 100s while smoking and drinking score a 10.",
                                       direction: "Higher is better")
        tipDictionary[.gender] = Tip(title: "Gender and Pronouns",
                                     explanation: "You can customize the Analysis text with your preferred personal pronouns.",
                                     low: "Data shows that women live longer than men, perhaps a biological advantage or a cultural advantage, or both.",
                                     middle: "The differences in longevity between the sexes are shrinking as women engage in activities previously reserved for men.",
                                     high: "Lifespan therefore does not take gender in account as overall impact of gender on longevity is impossible to measure. ",
                                     direction: "All pronouns are good!")
        


    }
    
}


extension TipViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
