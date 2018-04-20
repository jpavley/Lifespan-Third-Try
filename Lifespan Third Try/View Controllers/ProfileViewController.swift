//
//  ProfileViewController.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 3/26/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
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
    
    @IBAction func sliderDidEnd(_ sender: UISlider) {
        updateView()
    }
    
    
    @IBAction func daySliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.birthDay.setting = sender.value
        let birthDay = userProfile.birthDay.settingAsInt()
        dayField.text = "\(birthDay)"
    }
    
    @IBAction func monthSliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.birthMonth.setting = sender.value
        let birthMonth = CalendarUtilities.monthName(from: userProfile.birthMonth.settingAsInt())
        monthField.text = birthMonth
    }
    
    @IBAction func yearSliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.birthYear.setting = sender.value
        let birthYear = userProfile.birthYear.settingAsInt()
        yearField.text = "\(birthYear)"
    }
    
    @IBAction func lifeSliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.lifeExpectancy.setting = sender.value
        let ale = userProfile.lifeExpectancy.settingAsInt()
        lifeExpenctancyField.text = "\(ale)"
    }
    
    @IBAction func activitySliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.activityLevel.setting = sender.value
        let activityLevel = userProfile.activityLevel.settingAsInt()
        activityField.text = "\(activityLevel)"
    }
    
    @IBAction func stressSliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.stressLevel.setting = sender.value
        let stressLevel = userProfile.stressLevel.settingAsInt()
        stressField.text = "\(stressLevel)"
    }
    
    @IBAction func riskSliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.riskLevel.setting = sender.value
        let riskLevel = userProfile.riskLevel.settingAsInt()
        riskField.text = "\(riskLevel)"
    }
    
    @IBAction func geneticsSliderChanged(_ sender: UISlider) {
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        userProfile.geneticsLevel.setting = sender.value
        let geneticsLevel = userProfile.geneticsLevel.settingAsInt()
        geneticsField.text = "\(geneticsLevel)"
    }
    
    func updateView() {
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
        let birthMonth = CalendarUtilities.monthName(from: userProfile.birthMonth.settingAsInt())
        let birthYear = userProfile.birthYear.settingAsInt()
        let ale = userProfile.lifeExpectancy.settingAsInt()
        birthField.text = "\(birthDay) \(birthMonth) \(birthYear) \(ale)"
        
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
        slider.addTarget(self, action: #selector(sliderDidEnd), for: [.touchUpInside, .touchUpOutside])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
