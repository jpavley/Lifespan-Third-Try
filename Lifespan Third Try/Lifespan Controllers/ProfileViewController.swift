//
//  ProfileViewController.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 3/26/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

enum TextFieldTag: Int {
    case name = 1000
    case object = 2000
    case subject = 3000
    case possessive = 4000
}

class ProfileViewController: UIViewController, UITextFieldDelegate {
    
    // Personal Details
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var objectField: UITextField!
    @IBOutlet weak var subjectField: UITextField!
    @IBOutlet weak var possessiveField: UITextField!
    
    // Birth and Life Expectancy
    
    @IBOutlet weak var birthField: UITextField!
    @IBOutlet weak var dayField: UITextField!
    @IBOutlet weak var monthField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var lifeExpenctancyField: UITextField!

    @IBOutlet weak var daySlider: UISlider!
    @IBOutlet weak var monthSlider: UISlider!
    @IBOutlet weak var yearSlider: UISlider!
    @IBOutlet weak var lifeExpencetancySlider: UISlider!
    
    // Life Factors

    @IBOutlet weak var lifeFactorsField: UITextField!
    @IBOutlet weak var activityField: UITextField!
    @IBOutlet weak var stressField: UITextField!
    @IBOutlet weak var riskField: UITextField!
    @IBOutlet weak var geneticsField: UITextField!
    
    @IBOutlet weak var activitySlider: UISlider!
    @IBOutlet weak var stressSlider: UISlider!
    @IBOutlet weak var riskSlider: UISlider!
    @IBOutlet weak var geneticsSlider: UISlider!
    
    @IBAction func daySliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        let sliderIntValue = sender.value.rounded(.awayFromZero)
        userProfile.birthDay.setting = sliderIntValue
        daySlider.value = sliderIntValue
        dayField.text = "\(Int(sliderIntValue))"
    }
    
    @IBAction func monthSliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.birthMonth.setting = sender.value.rounded(.awayFromZero)
        let birthMonth = CalendarUtilities.monthName(from: userProfile.birthMonth.settingAsInt())
        monthSlider.value = sender.value.rounded(.awayFromZero)
        monthField.text = birthMonth
    }
    
    @IBAction func yearSliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.birthYear.setting = sender.value.rounded(.awayFromZero)
        let birthYear = userProfile.birthYear.settingAsInt()
        yearSlider.value = sender.value.rounded(.awayFromZero)
        yearField.text = "\(birthYear)"
    }
    
    @IBAction func lifeSliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.lifeExpectancy.setting = sender.value.rounded(.awayFromZero)
        let ale = userProfile.lifeExpectancy.settingAsInt()
        lifeExpencetancySlider.value = sender.value.rounded(.awayFromZero)
        lifeExpenctancyField.text = "\(ale)"
    }
    
    @IBAction func activitySliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.activityLevel.setting = sender.value.rounded(.awayFromZero)
        let activityLevel = userProfile.activityLevel.settingAsInt()
        activitySlider.value = sender.value.rounded(.awayFromZero)
        activityField.text = "\(activityLevel)"
    }
    
    @IBAction func stressSliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.stressLevel.setting = sender.value.rounded(.awayFromZero)
        let stressLevel = userProfile.stressLevel.settingAsInt()
        stressSlider.value = sender.value.rounded(.awayFromZero)
        stressField.text = "\(stressLevel)"
    }
    
    @IBAction func riskSliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.riskLevel.setting = sender.value.rounded(.awayFromZero)
        let riskLevel = userProfile.riskLevel.settingAsInt()
        riskSlider.value = sender.value.rounded(.awayFromZero)
        riskField.text = "\(riskLevel)"
    }
    
    @IBAction func geneticsSliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.geneticsLevel.setting = sender.value.rounded(.awayFromZero)
        let geneticsLevel = userProfile.geneticsLevel.settingAsInt()
        geneticsSlider.value = sender.value.rounded(.awayFromZero)
        geneticsField.text = "\(geneticsLevel)"
    }
    
    @IBAction func showTipAction(_ sender: UIButton) {
        
        enum TipButtonTag: Int {
            case lifeExpectancy = 1000, activity, stress, risk, genetics
        }
        
        struct Tip {
            var title: String
            var message: String
        }
        
        var tipDictionary = [TipButtonTag:Tip]()
        
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



        
        if let tipKey = TipButtonTag(rawValue: sender.tag), let tip = tipDictionary[tipKey] {
            showAlert(title: tip.title, message: tip.message, buttonLabel: "OK")
        }
        
    }
    
    fileprivate func showAlert(title: String, message: String, buttonLabel: String) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: buttonLabel,
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    @objc func updateView() {
        updatePersonalFactors()
        updateBirthFactors()
        updateLifeFactors()
        updateTombstone()
    }
    
    fileprivate func updatePersonalFactors() {
        let tb = self.tabBarController as! TabViewController
        tb.updateLifeClock()
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        nameField.text = userProfile.name
        
        objectField.text = userProfile.pronouns.objective
        subjectField.text = userProfile.pronouns.subjective
        possessiveField.text = userProfile.pronouns.possessive
    }
    
    fileprivate func updateBirthFactors() {
        let tb = self.tabBarController as! TabViewController
        tb.updateLifeClock()
        
        guard let userProfile = tb.userProfile else {
            return
        }

        let birthDay = userProfile.birthDay.settingAsInt()
        let birthMonthNumber = userProfile.birthMonth.settingAsInt()
        let birthMonth = CalendarUtilities.monthName(from: birthMonthNumber)
        let birthYear = userProfile.birthYear.settingAsInt()
        let ale = userProfile.lifeExpectancy.settingAsInt()
        birthField.text = "\(birthDay) \(birthMonth) \(birthYear) \(ale)"
        
        // handle the varible number of days in a month
        userProfile.birthDay.max = Float(CalendarUtilities.daysIn(monthNumber: birthMonthNumber, for: birthYear))
        
        dayField.text = "\(birthDay)"
        configure(slider: daySlider, with: userProfile.birthDay)
        
        monthField.text = birthMonth
        configure(slider: monthSlider, with: userProfile.birthMonth)
        
        yearField.text = "\(birthYear)"
        configure(slider: yearSlider, with: userProfile.birthYear)
        
        lifeExpenctancyField.text = "\(ale)"
        configure(slider: lifeExpencetancySlider, with: userProfile.lifeExpectancy)
    }
    
    fileprivate func updateLifeFactors() {
        let tb = self.tabBarController as! TabViewController
        tb.updateLifeClock()
        
        guard let userProfile = tb.userProfile else {
            return
        }

        let activityLevel = userProfile.activityLevel.settingAsInt()
        let stressLevel = userProfile.stressLevel.settingAsInt()
        let riskLevel = userProfile.riskLevel.settingAsInt()
        let geneticsLevel = userProfile.geneticsLevel.settingAsInt()
        lifeFactorsField.text = "\(activityLevel) \(stressLevel) \(riskLevel) \(geneticsLevel)"
        
        activityField.text = "\(activityLevel)"
        configure(slider: activitySlider, with: userProfile.activityLevel)
        
        stressField.text = "\(stressLevel)"
        configure(slider: stressSlider, with: userProfile.stressLevel)
        
        riskField.text = "\(riskLevel)"
        configure(slider: riskSlider, with: userProfile.riskLevel)
        
        geneticsField.text = "\(geneticsLevel)"
        configure(slider: geneticsSlider, with: userProfile.geneticsLevel)
    }
    
    fileprivate func updateTombstone() {
        let tombstoneVC = childViewControllers[0] as! TombstoneViewController
        tombstoneVC.updateView()
    }
        
    fileprivate func configure(slider: UISlider, with property: RangedValue) {
        slider.minimumValue = property.min
        slider.maximumValue = property.max
        slider.value = property.setting
        slider.addTarget(self, action: #selector(updateView), for: [.touchUpInside, .touchUpOutside])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Called by UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        if let tag = TextFieldTag(rawValue: textField.tag) {
        
            switch tag {
            case .name:
                userProfile.name = textField.text!
                
            case .object:
                userProfile.pronouns.objective = textField.text!
                
            case .subject:
                userProfile.pronouns.subjective = textField.text!

            case .possessive:
                userProfile.pronouns.possessive = textField.text!
            }
            
            updateTombstone()
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameField.delegate = self
        objectField.delegate = self
        subjectField.delegate = self
        possessiveField.delegate = self
        
        // enable user to dismiss keyboard with a tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateView()
    }

}
