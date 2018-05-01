//
//  AnalysisViewController.swift
//  Lifespan Third Try
//
//  Created by jpavley12 on 3/25/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

class AnalysisViewController: UIViewController {
    
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
        
        guard let lifeSpan = tb.lifeSpan else {
            return
        }
        
        analysisText.text = generateAnalysis(lifeSpan: lifeSpan)

    }
        
    // MARK: - Navigation
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        analysisText.setContentOffset(CGPoint.zero, animated: true)
    }
    
    fileprivate func levelToText(level: CGFloat,
                                 words: [String] = ["low", "moderate", "high", "unknown"]) -> String {
        
        enum Levels: Int {
            // map the index of the words to their place in the array
            case low = 0, moderate = 1, high = 2, unknown = 3
        }
        
        // round that float to a neo-Int	
        let level = level.rounded(.down)
        
        switch UInt(level) {
        case 0...4:
            return words[Levels.low.rawValue]
        case 5:
            return words[Levels.moderate.rawValue]
        case 6...:
            return words[Levels.high.rawValue]
        default:
            return words[Levels.unknown.rawValue]
        }
    }
    
    struct ParagraphOneData {
        let name: String
        let age: Int
        let birthYear: Int
        let modifiedLifeExpectancy: Int
        let lifeExpectancy: Int
        let possesser: String
        let object: String
        let subject: String
        let missingYears: Int
        let modifiedYearsLeft: Int
        let modifiedDeathYear: Int
        let stressLevel: String
        let activityLevel: String
        let riskLevel: String
        let geneticsLevel: String
    }
    
    fileprivate func generateParagraphOne(with d: ParagraphOneData) -> String {
        
        let s1 = "\(d.name) was born \(d.age) years ago in \(d.birthYear). \(d.possesser.capitalized) life expectancy of \(d.lifeExpectancy) years is influenced by a \(d.activityLevel) level of physical activity, a \(d.stressLevel) level of mental stress, a \(d.riskLevel) level of risky behavior, and an \(d.geneticsLevel) genetic history."

        var s2 = ""
        var s3 = ""
        
        if d.modifiedLifeExpectancy < d.lifeExpectancy {
            
            // negative
            
            s2 = "\(d.possesser.capitalized) life expectancy is therefore reduced to \(d.modifiedLifeExpectancy) years, robbing \(d.object) of \(d.missingYears) years."
            
            s3 = "If \(d.subject) doesn’t improve \(d.possesser) life style \(d.subject) could die in \(d.modifiedYearsLeft) years from today, in the year \(d.modifiedDeathYear)."
            
        } else if d.modifiedLifeExpectancy == d.lifeExpectancy {
            
            // neutral
            
            s2 = "\(d.possesser.capitalized) life expectancy is therefore unchanged with no missing or extra years."
            
            s3 = "If \(d.subject) is able to maintain \(d.possesser) current life style \(d.subject) could die in \(d.modifiedYearsLeft) years from today, in the year \(d.modifiedDeathYear)."
            
        } else if d.modifiedLifeExpectancy > d.lifeExpectancy {
            
            // positive
            
            s2 = "\(d.possesser.capitalized) life expectancy is therefore increased to \(d.modifiedLifeExpectancy) years, gifting \(d.object) another \(d.missingYears) years."
            
            s3 = "If \(d.subject) is able to maintain \(d.possesser) current life style \(d.subject) could live for another \(d.modifiedYearsLeft) years from today, and delay \(d.possesser) death until the year \(d.modifiedDeathYear)."
        }
        return "\(s1) \(s2) \(s3)"
        
    }
    
    func generateAnalysis(lifeSpan: Lifespan) -> String {
        
        let tb = self.tabBarController as! TabViewController
        guard let userProfile = tb.userProfile, let lifeSpan = tb.lifeSpan else {
            return ""
        }
        
        let name = userProfile.name
        let subject = userProfile.pronouns.subjective
        let object = userProfile.pronouns.objective
        let possesser = userProfile.pronouns.possessive
        
        
        let us = userProfile.calcUserStats(from: lifeSpan)
        let cal = CalendarUtilities.utcCal()
        let now = Date()
        let thisWeekDay = cal.weekdaySymbols[cal.component(.weekday, from: now)-1]
        let thisDay = cal.component(.day, from: now)
        let thisMonth = cal.monthSymbols[cal.component(.month, from: now)-1]
        let thisYear = cal.component(.year, from: now)
        let modifiedYearsLeft = us.modifiedDeathYear - thisYear
        let stressLevel = levelToText(level: userProfile.stress)
        let activityLevel = levelToText(level: userProfile.activity)
        let riskLevel = levelToText(level: userProfile.risk)
        let geneticsLevel = levelToText(level: userProfile.genetics, words: ["unfortunate", "average", "excellent", "unknown"])
        let cr = "\n\n"
        
        let p0 = "Today is \(thisWeekDay), \(thisMonth) \(thisDay), \(thisYear). \(name) has spent \(lifeSpan.clockDescriptionSpent) in \(possesser) life to date. At this point in time \(subject) could live for another \(lifeSpan.clockDescriptionRemaining)."
        
        let p1 = generateParagraphOne(with: ParagraphOneData(name: name,
                                                             age: us.age,
                                                             birthYear: us.birthYear,
                                                             modifiedLifeExpectancy: us.modifiedLifeExpectancy,
                                                             lifeExpectancy: us.lifeExpectancy,
                                                             possesser: possesser,
                                                             object: object,
                                                             subject: subject,
                                                             missingYears: us.missingYears,
                                                             modifiedYearsLeft: modifiedYearsLeft,
                                                             modifiedDeathYear: us.modifiedDeathYear,
                                                             stressLevel: stressLevel,
                                                             activityLevel: activityLevel,
                                                             riskLevel: riskLevel,
                                                             geneticsLevel: geneticsLevel))
        
        // Universal
        let p2 = "If \(name) lives beyond \(us.modifiedDeathYear) and the age of \(us.modifiedLifeExpectancy), \(subject) will be living on borrowed time."
        
        return "\(p0)\(cr)\(p1)\(cr)\(p2)"
    }
    
}

