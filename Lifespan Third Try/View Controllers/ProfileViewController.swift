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
    
    func updateView() {
        let tb = self.tabBarController as! TabViewController
        tb.updateLifeClock()
        
        guard let userProfile = tb.userProfile else {
            return
        }
        
        nameField.text = userProfile.name
        objectField.text = userProfile.pronouns.objective
        subjectField.text = userProfile.pronouns.subjective
        possessiveField.text = userProfile.pronouns.possessive
        
        let birthDay = Int(userProfile.birthDay.setting.rounded(.awayFromZero))
        let birthMonth = CalendarUtilities.monthName(from: Int(userProfile.birthMonth.setting.rounded(.awayFromZero)))
        let birthYear = Int(userProfile.birthYear.setting.rounded(.awayFromZero))
        let ale = Int(userProfile.ale.rounded(.awayFromZero))
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
    
    fileprivate func configure(slider: UISlider, with property: RangedValue) {
        slider.minimumValue = property.min
        slider.maximumValue = property.max
        slider.value = property.setting
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
