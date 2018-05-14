//
//  TipViewController.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 5/10/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

enum TipButtonTag: Int {
    case lifeExpectancy = 1000, activity, stress, risk, genetics
}

struct Tip {
    var title: String
    var message: String
}

class TipViewController: UIViewController {

    @IBOutlet weak var tipTitle: UILabel!
    @IBOutlet weak var tipText: UITextView!
    
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
        tipDictionary[.lifeExpectancy] = Tip(title: "Life Expectancy",
                                             message: "How long do you think you will live, all things being equal?\n Americans can expect to live for around 83 years. Women tend to little live longer, men a little less.\n The longest documented human life is 122 years.")
        tipDictionary[.activity] = Tip(title: "Activity",
                                       message: "On a scale from 1 to 10 how active are you?\n If you are a couch potato who's favorite sport is mental activity score a 1. If you are a brisk walker a who hits the gym a couple of days a week score a 5. If you are a crossfit enthusist who maintains a perfect BMI scores a 10.\n Higher is better.")
        tipDictionary[.stress] = Tip(title: "Stress",
                                     message: "On a scale from 1 to 10 how stress out are you?\n if you are a stoic who medidates daily and keep your emotions in check like Mr. Spock score a 1. If you are well balanced  with a job, a bit of money in the bank, and a loving family  sore a 5. If you are passoinately overworked, underappreicated, and living in a metaphorical warzone score a 10.\n Lower is better.")
        tipDictionary[.risk] = Tip(title: "Risk",
                                   message: "On a scale from 1 to 10 how much risk are you inviting into your life?\n If you avoids drugs, guns, alcohol, fast cars, and contact sports score a 1. If you drink moderately, occationally skis, and drive in the fast lane sore a 5. If you are an adrenalian junkie who drag races, lives hard, and plays harder score a 10.\n Lower is better.")
        tipDictionary[.genetics] = Tip(title: "Genetics",
                                       message: "On a scale from 1 to 10 how good is your genetic material?\n If chronic diseases run rampent in your family and your parents died young score a 1. If you parents lived into their eighties and cancer, hear disease, and altimers is rare in your family sore a 5. If your parents lived well into their 90s or 100s while smoking and driking score a 10.\n Higher is better.")
        
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
            tipText.text = tip.message
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension TipViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
