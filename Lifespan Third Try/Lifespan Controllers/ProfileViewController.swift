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
//    case object = 2000
//    case subject = 3000
//    case possessive = 4000
}

class ProfileViewController: UIViewController, UITextFieldDelegate {
    
    // MARK:- Control Outlets -
    
    // Personal Details
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var pronounSlider: UISlider!
    @IBOutlet weak var pronounsField: UITextField!
    
    // Birth and Life Expectancy
    
    @IBOutlet weak var birthField: UITextField!
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    @IBOutlet weak var lifeExpenctancyField: UITextField!

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
    
    
    // MARK:- Control Actions -
    
    @IBAction func nameEditingChanged(_ sender: UITextField) {
        let tb = self.tabBarController as! TabViewController
        
        guard let up = tb.userProfile else {
            return
        }
        
        up.name = nameField.text!
        
        let udc = UserDefaultConstants()
        UserDefaults.standard.set(up.name, forKey: udc.nameKey)
    }
    
    @IBAction func pronounsValueChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.pronounChoices.setting = sender.value.rounded(.awayFromZero)
        pronounSlider.value = sender.value.rounded(.awayFromZero)
        updateView()
        
        let udc = UserDefaultConstants()
        UserDefaults.standard.set("\(userProfile.pronounChoices.min) \(userProfile.pronounChoices.max) \(userProfile.pronounChoices.setting)", forKey: udc.pronounChoicesKey)
    }
    

    @IBAction func birthDateValueChanged(_ sender: UIDatePicker) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.setBirthDate(with: sender.date)
        updateView()
    }
    
    
    @IBAction func lifeSliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.lifeExpectancy.setting = sender.value.rounded(.awayFromZero)
        lifeExpencetancySlider.value = sender.value.rounded(.awayFromZero)
        updateView()
        
        let udc = UserDefaultConstants()
        UserDefaults.standard.set("\(userProfile.lifeExpectancy.min) \(userProfile.lifeExpectancy.max) \(userProfile.lifeExpectancy.setting)", forKey: udc.lifeExpectancyKey)
    }
    
    @IBAction func activitySliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.activityLevel.setting = sender.value.rounded(.awayFromZero)
        activitySlider.value = sender.value.rounded(.awayFromZero)
        updateView()
        
        let udc = UserDefaultConstants()
        UserDefaults.standard.set("\(userProfile.activityLevel.min) \(userProfile.activityLevel.max) \(userProfile.activityLevel.setting)", forKey: udc.activityLevelKey)
    }
    
    @IBAction func stressSliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.stressLevel.setting = sender.value.rounded(.awayFromZero)
        stressSlider.value = sender.value.rounded(.awayFromZero)
        updateView()
        
        let udc = UserDefaultConstants()
        UserDefaults.standard.set("\(userProfile.stressLevel.min) \(userProfile.stressLevel.max) \(userProfile.stressLevel.setting)", forKey: udc.stressLevelKey)
    }
    
    @IBAction func riskSliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.riskLevel.setting = sender.value.rounded(.awayFromZero)
        riskSlider.value = sender.value.rounded(.awayFromZero)
        updateView()
        
        let udc = UserDefaultConstants()
        UserDefaults.standard.set("\(userProfile.riskLevel.min) \(userProfile.riskLevel.max) \(userProfile.riskLevel.setting)", forKey: udc.riskLevelKey)
    }
    
    @IBAction func geneticsSliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.geneticsLevel.setting = sender.value.rounded(.awayFromZero)
        geneticsSlider.value = sender.value.rounded(.awayFromZero)
        updateView()
        
        let udc = UserDefaultConstants()
        UserDefaults.standard.set("\(userProfile.geneticsLevel.min) \(userProfile.geneticsLevel.max) \(userProfile.geneticsLevel.setting)", forKey: udc.geneticsLevelKey)
    }
    
    @IBAction func showTipAction(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowTip", sender: sender)
    }
    
    @IBAction func resetAction(_ sender: Any) {
        let alert = UIAlertController(title: "Reset User Profile", message: "Store settings to factory defaults? All current data will be lost.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (action) in
            self.restoreUserDefaults()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler:  nil))
        present(alert, animated: true)
    }
    
    
    // MARK:- Methods -
    
    /// Sets all user profile properties to their original default values and saves the result to UserDefaults
    fileprivate func restoreUserDefaults() {
        // print("restore user profile defaults")
        
        let tb = self.tabBarController as! TabViewController
        
        guard let up = tb.userProfile else {
            return
        }
        
        let udc = UserDefaultConstants()
        
        // name
        up.name = udc.nameValue
        UserDefaults.standard.set(udc.nameValue, forKey: udc.nameKey)
        
        // birth date
        up.birthDate = CalendarUtilities.stringToDate(dateString: udc.birthDateValue)!
        UserDefaults.standard.set(udc.birthDateValue, forKey: udc.birthDateKey)
        
        // life expectancy
        let lifeExpectancyRV = UserProfile.tranformIntoRV(storedProperty: udc.lifeExpectancyValue)
        up.lifeExpectancy.setting = lifeExpectancyRV.setting
        UserDefaults.standard.set(udc.lifeExpectancyValue, forKey: udc.lifeExpectancyKey)
        
        // activity level
        let activityLevelRV = UserProfile.tranformIntoRV(storedProperty: udc.activityLevelValue)
        up.activityLevel.setting = activityLevelRV.setting
        UserDefaults.standard.set(udc.activityLevelValue, forKey: udc.activityLevelKey)

        // stress level
        let stressLevelRV = UserProfile.tranformIntoRV(storedProperty: udc.stressLevelValue)
        up.stressLevel.setting = stressLevelRV.setting
        UserDefaults.standard.set(udc.stressLevelValue, forKey: udc.stressLevelKey)

        // risk level
        let riskLevelRV = UserProfile.tranformIntoRV(storedProperty: udc.riskLevelValue)
        up.riskLevel.setting = riskLevelRV.setting
        UserDefaults.standard.set(udc.riskLevelValue, forKey: udc.riskLevelKey)
        
        // genetics level
        let geneticsLevelRV = UserProfile.tranformIntoRV(storedProperty: udc.geneticsLevelValue)
        up.geneticsLevel.setting = geneticsLevelRV.setting
        UserDefaults.standard.set(udc.geneticsLevelValue, forKey: udc.geneticsLevelKey)

        // pronouns
        let pronounsRV = UserProfile.tranformIntoRV(storedProperty: udc.pronounChoicesValue)
        up.pronounChoices.setting = pronounsRV.setting
        UserDefaults.standard.set(udc.pronounChoicesValue, forKey: udc.pronounChoicesKey)
        
        updateView()
    }
    
    @objc func updateView() {
        let tb = self.tabBarController as! TabViewController
        tb.updateLife()

        updatePersonalFactors()
        updateBirthFactors()
        updateLifeFactors()
        updateTombstone()
    }
    
    fileprivate func updatePersonalFactors() {
        let tb = self.tabBarController as! TabViewController
        
        guard let up = tb.userProfile else {
            return
        }
        
        nameField.text = up.name
        
        let currentPronouns = "\(up.pronouns.subjective) \(up.pronouns.possessive)"
        pronounsField.text = currentPronouns
        
        configure(slider: pronounSlider, with: up.pronounChoices)
    }
    
    fileprivate func updateBirthField() {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }

        let birthDay = userProfile.birthDay
        let birthMonth = CalendarUtilities.monthName(from: userProfile.birthMonth)
        let birthYear = userProfile.birthYear
        let ale = userProfile.lifeExpectancy.settingAsInt()
        birthField.text = "\(birthDay) \(birthMonth) \(birthYear) \(ale)"
    }
    
    fileprivate func updateAleField() {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        let ale = userProfile.lifeExpectancy.settingAsInt()
        lifeExpenctancyField.text = "\(ale)"
        configure(slider: lifeExpencetancySlider, with: userProfile.lifeExpectancy)
    }
    
    fileprivate func updateBirthDatePicker() {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }

        // instead of user local timezone, the default, this app uses UTC
        birthDatePicker.timeZone = TimeZone(abbreviation: "UTC")
        
        let minYear = CalendarUtilities.thisYear() - Int(userProfile.lifeExpectancy.max.rounded(.down))
        let minYearString = "01-01-\(minYear)"
        
        birthDatePicker.minimumDate = CalendarUtilities.stringToDate(dateString: minYearString)
        birthDatePicker.maximumDate = Date()
        birthDatePicker.setDate(userProfile.birthDate, animated: true)

    }
    
    fileprivate func updateBirthFactors() {
        updateBirthField()
        updateAleField()
        updateBirthDatePicker()
    }
    
    fileprivate func updateLifeFactors() {
        let tb = self.tabBarController as! TabViewController
        
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
            }
            
            updateTombstone()
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameField.delegate = self
        
        // enable user to dismiss keyboard with a tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowTip" {
            let tipViewController = segue.destination as! TipViewController
            let button = sender as! UIButton
            tipViewController.tipSource = TipButtonTag(rawValue: button.tag)
        }
    }

}
