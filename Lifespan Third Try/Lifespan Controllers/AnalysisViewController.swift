//
//  AnalysisViewController.swift
//  Lifespan Third Try
//
//  Created by jpavley12 on 3/25/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit

/// Creates and displays analysis of the user's longevity based on data from the user profile
/// and today's date. It's important to note how the text is create from the class methods:
/// - There appear to be 5 paragraphs but actually there are only 3
/// - First paragraph (appears to be two because of CRs after the date) created by generateParagraphZero()
/// - Second paragraph created by generateParagraphOne(), generateParagraphOneSentanceOne(), and generateParagraphTwoLifeFactorsText()
/// - Thrid paragraph (appears to be two because of CRs before the last sentance) created by generateParagraphTwo()
///
/// TODO: Clean up all the function and property names to be more clear, improve the ordering of methods
class AnalysisViewController: UIViewController {
    
    // MARK: - Outlets -
    
    @IBOutlet weak var analysisText: UITextView!
    
    // MARK: - Local Data Structures -
    
    struct ParagraphData {
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

    // MARK: - Overrides -
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    
        // NOTE: View updates in viewWillAppear()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        updateView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // NOTE: Make sure UITextView is scrolled to the top when the user first sees it
        analysisText.setContentOffset(CGPoint.zero, animated: true)
    }
    
    // MARK: - Methods -
    
    fileprivate func updateView() {
        
        let tb = self.tabBarController as! TabViewController
        tb.updateLife()
        
        guard let lifeSpan = tb.lifeSpan else {
            return
        }
        
        analysisText.attributedText = generateAnalysis(lifeSpan: lifeSpan)

    }
    
    fileprivate func levelToText(level: CGFloat,
                                 words: [String] = ["not set",
                                                    "very-low",
                                                    "low",
                                                    "moderate",
                                                    "high",
                                                    "very-high",
                                                    "unknown"]) -> String {
        
        enum Levels: Int {
            // map the index of the words to their place in the array
            case notset = 0
            case low = 1
            case mediumLow = 2
            case moderate = 3
            case mediumHigh = 4
            case high = 5
            case unknown = 6
        }
        
        // round that float to a neo-Int	
        let level = level.rounded(.down)
        
        switch UInt(level) {
        case 0:
            return words[Levels.notset.rawValue]
        case 1...2:
            return words[Levels.low.rawValue]
        case 3...4:
            return words[Levels.mediumLow.rawValue]
        case 5...6:
            return words[Levels.moderate.rawValue]
        case 7...8:
            return words[Levels.mediumHigh.rawValue]
        case 9...10:
            return words[Levels.high.rawValue]
        default:
            return words[Levels.unknown.rawValue]
        }
    }
    
    // MARK: - Text Generation -
    
    // Example Output - Neutral, no factors
    
    // Today is Friday, June 1, 2018.
    // John F. Pavley has spent 8 hours, 16 minutes, 48 seconds in his life to date. At this point in time he could live for another 3 hours, 43 minutes, 12 seconds.
    // John F. Pavley was born 57 years ago in 1961. His life factors were not recorded on the profile tab.
    // His chronological age is the same as his biological age of 57 years. His life expectancy is therefore unchanged with no missing or extra years.
    // If he is able to maintain his current life style he could die in 26 years from today, in the year 2044.
    // If John F. Pavley lives beyond 2044 and the age of 83, he will be living on borrowed time.
    
    // Example Output - Positive, all factors
    
    // Today is Friday, June 1, 2018.
    // John F. Pavley has spent 6 hours, 37 minutes, 27 seconds in his life to date. At this point in time he could live for another 5 hours, 22 minutes, 33 seconds.
    // John F. Pavley was born 57 years ago in 1961. His natural life expectancy of 83 years is influenced by the following life factors: A very-high level of physical activity. A very-low level of mental stress. A very-low level of risky behavior. An excellent genetic history.
    // His chronological age is 57 years but his biological age is only 55 years--a life factor bonus of 2%. His life expectancy is therefore increased to 103 years, gifting him another 20 years.
    // If he is able to maintain his current life style he could live for another 46 years from today, and delay his death until the year 2064.
    // If John F. Pavley lives beyond 2064 and the age of 103, he will be living on borrowed time.
    
    // Example Output - Negative, two factors, customized pronouns
    
    // Today is Friday, June 1, 2018.
    // John F. Pavley has spent 10 hours, 21 minutes, 0 seconds in its life to date. At this point in time it could live for another 1 hours, 39 minutes, 60 seconds.
    // John F. Pavley was born 57 years ago in 1961. Its natural life expectancy of 83 years is influenced by one or more life factors: A very-high level of mental stress. A very-high level of risky behavior.
    // Its chronological age is 57 years but Its biological age is 65 years--a life factor penality of 20%. Its life expectancy is therefore reduced to 66 years, robbing it of 17 years.
    // If it doesn’t improve its life style it could die in 9 years from today, in the year 2027.
    // If John F. Pavley lives beyond 2027 and the age of 66, it will be living on borrowed time.

    
    /// Creates stylized analysis text for use with a UITextView's attributedText property.
    /// The text based based on UserProfile data with three different recommentations:
    /// - Neutral (user's behavior is not effecting their life expectancy)
    /// - Positive (user's behavior is increasing their life expectancy)
    /// - Negative (user's behavior is decreasing their life expectancy)
    ///
    /// Any Life Factors set are included in the analysis.
    ///
    /// - Parameter lifeSpan: shared LifeSpan instance.
    /// - Returns: customized attributed text string based on LifeSpan properites.
    func generateAnalysis(lifeSpan: Lifespan) -> NSMutableAttributedString {
        
        let resultString = NSMutableAttributedString(string: "", attributes: [:])
        
        let tb = self.tabBarController as! TabViewController
        
        guard let userProfile = tb.userProfile, let lifeSpan = tb.lifeSpan else {
            return resultString
        }
        
        // To make things easy load all the calcuated and shared data into a data structure...
        
        let name = userProfile.name
        let subject = userProfile.pronouns.subjective
        let object = userProfile.pronouns.objective
        let possesser = userProfile.pronouns.possessive
        let us = userProfile.calcUserStats(from: lifeSpan)
        let cal = CalendarUtilities.utcCal()
        let now = Date()
        let thisYear = cal.component(.year, from: now)
        let modifiedYearsLeft = us.modifiedDeathYear - thisYear
        let stressLevel = levelToText(level: userProfile.stress)
        let activityLevel = levelToText(level: userProfile.activity)
        let riskLevel = levelToText(level: userProfile.risk)
        let geneticsLevel = levelToText(level: userProfile.genetics, words: ["not set",
                                                                             "unfortunate",
                                                                             "below-average",
                                                                             "average",
                                                                             "above-average",
                                                                             "excellent",
                                                                             "unknown"])
        
        let paragraphData = ParagraphData(name: name,
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
                                          geneticsLevel: geneticsLevel)
        
        resultString.append(generateParagraphZero(with: paragraphData))
        resultString.append(generateParagraphOne(with: paragraphData))
        resultString.append(generateParagraphTwo(with: paragraphData))
        
        // print(resultString.mutableString)
        
        return resultString
    }
    
    /// Creates the styled text for the first paragraph of the analysis tab.
    ///
    /// - Parameter d: a bag of shared properties used to fill in the blanks.
    /// - Returns: customized attributed text string based on ParagraphData properites
    fileprivate func generateParagraphZero(with d: ParagraphData) -> NSMutableAttributedString {
        
        let resultString = NSMutableAttributedString(string: "", attributes: [:])
        let tf = TextFormatter()
        
        let tb = self.tabBarController as! TabViewController
        guard let lifeSpan = tb.lifeSpan else {
            return resultString
        }
        
        let cal = CalendarUtilities.utcCal()
        let now = Date()
        let thisWeekDay = cal.weekdaySymbols[cal.component(.weekday, from: now)-1]
        let thisDay = cal.component(.day, from: now)
        let thisMonth = cal.monthSymbols[cal.component(.month, from: now)-1]
        let thisYear = cal.component(.year, from: now)
        
        // generate paragraph 0 part 1
        
        let p0Part1 = "Today is \(thisWeekDay), \(thisMonth) \(thisDay), \(thisYear). \n\n"
        let stringsParagraph0Part1 = transformStringIntoList(with: p0Part1)
        let boldIndexesParagraph0Part1 = [2, 3, 4, 5, 6, 7, 8]
        
        let attributedParagraph0Part1 = tf.createStringWithBoldParts(with: stringsParagraph0Part1, boldedIndexes: boldIndexesParagraph0Part1)
        resultString.append(attributedParagraph0Part1)
        
        // generate paragraph 0 part 1a (user name seperated because a name could have 0 to n substrings)
        
        resultString.append(tf.createBoldString(with: "\(d.name)"))
        resultString.append(tf.createPlainString(with: " has spent "))
        
        // generate paragraph 0 part 1b (time spent)
        
        let clockDescriptionSpentListWithSpaces = transformStringIntoList(with: lifeSpan.clockDescriptionSpent)
        let boldIndexesSpentList = [0, 2, 4]
        
        let attributedParagraphSpent = tf.createStringWithBoldParts(with: clockDescriptionSpentListWithSpaces, boldedIndexes: boldIndexesSpentList)
        resultString.append(attributedParagraphSpent)
        
        // generate paragraph 0 part 2
        var p0Part2 = ""
        
        if d.modifiedYearsLeft < 0 {
            p0Part2 = " in \(d.possesser) life to date. At this point we have no estimation of how much longer \(d.subject) could live"
        } else {
            p0Part2 = " in \(d.possesser) life to date. At this point in time \(d.subject) could live for another "
        }
        
        
        resultString.append(tf.createPlainString(with: p0Part2))
        
        // generate paragraph 0 part 2a (time remaining)
        
        if d.modifiedYearsLeft < 0 {
            
            // nothing yet
            
        } else {
            
            let clockDescriptionRemainingListWithSpaces = transformStringIntoList(with: lifeSpan.clockDescriptionRemaining)
            let boldInedxesRemainingList = [0, 2, 4]
            
            let attributedParagraphRemaining = tf.createStringWithBoldParts(with: clockDescriptionRemainingListWithSpaces, boldedIndexes: boldInedxesRemainingList)
            resultString.append(attributedParagraphRemaining)
        }
        
        // generate paragraph 0 part 3 (which, as of now, isn't much)
        
        let p0Part3 = ". \n\n"
        resultString.append(tf.createPlainString(with: p0Part3))
        
        return resultString
    }
    
    /// Creates the styled text for the third paragraph of the analysis tab.
    ///
    /// - Parameter d: a bag of shared properties used to fill in the blanks.
    /// - Returns: customized attributed text string based on ParagraphData properites
    fileprivate func generateParagraphOne(with d: ParagraphData) -> NSMutableAttributedString {
        
        let resultString = NSMutableAttributedString(string: "", attributes: [:])
        let tf = TextFormatter()
        
        let s1 = generateParagraphOneSentanceOne(with: d)
        
        var s2 = ""
        var stringListWithSpacesS2 = [String]()
        var boldIndexesS2 = [Int]()
        
        var s2a = ""
        var stringListWithSpacesS2a = [String]()
        var boldIndexesS2a = [Int]()
        
        var s3 = ""
        var stringListWithSpacesS3 = [String]()
        var boldIndexesS3 = [Int]()
        
        if d.modifiedLifeExpectancy < d.lifeExpectancy {
            
            // negative
            
            s2 = "\(d.possesser.capitalized) life expectancy is therefore reduced to \(d.modifiedLifeExpectancy) years, robbing \(d.object) of \(d.missingYears) years."
            stringListWithSpacesS2 = transformStringIntoList(with: s2)
            boldIndexesS2 = [5, 7, 12]
            
            if d.modifiedYearsLeft < 0 {
                
                s3 = ""
                
            } else {
                
                s3 = " If \(d.subject) doesn’t improve \(d.possesser) life style \(d.subject) could die in \(d.modifiedYearsLeft) years from today, in the year \(d.modifiedDeathYear)."
            }
            
            stringListWithSpacesS3 = transformStringIntoList(with: s3)
            boldIndexesS3 = [3, 12, 19]
            
        } else if d.modifiedLifeExpectancy == d.lifeExpectancy {
            
            // neutral
            
            s2 = "\(d.possesser.capitalized) life expectancy is therefore unchanged with no missing or extra years."
            stringListWithSpacesS2 = transformStringIntoList(with: s2)
            boldIndexesS2 = [5, 8, 10]
            
            s2a = "\(d.possesser.capitalized) chronological age is the same as \(d.possesser) biological age of \(d.age) years. "
            stringListWithSpacesS2a = transformStringIntoList(with: s2a)
            boldIndexesS2a = [2, 9, 12]
            
            if d.modifiedYearsLeft < 0 {
                
                s3 = ""
                
            } else {
                
                s3 = " If \(d.subject) is able to maintain \(d.possesser) current life style \(d.subject) could die in \(d.modifiedYearsLeft) years from today, in the year \(d.modifiedDeathYear)."
            }
            
            stringListWithSpacesS3 = transformStringIntoList(with: s3)
            boldIndexesS3 = [6, 15, 22]
            
            
        } else if d.modifiedLifeExpectancy > d.lifeExpectancy {
            
            // positive
            
            s2 = "\(d.possesser.capitalized) life expectancy is therefore increased to \(d.modifiedLifeExpectancy) years, gifting \(d.object) another \(d.missingYears) years."
            stringListWithSpacesS2 = transformStringIntoList(with: s2)
            boldIndexesS2 = [5, 7, 12]
            
            if d.modifiedYearsLeft < 0 {
                
                s3 = ""
                
            } else {
                
                s3 = " If \(d.subject) is able to maintain \(d.possesser) current life style \(d.subject) could live for another \(d.modifiedYearsLeft) years from today, and delay \(d.possesser) death until the year \(d.modifiedDeathYear)."
            }
            
            stringListWithSpacesS3 = transformStringIntoList(with: s3)
            boldIndexesS3 = [6, 16, 27]
        }
        
        resultString.append(s1)
        
        let attributedS2a = tf.createStringWithBoldParts(with: stringListWithSpacesS2a, boldedIndexes: boldIndexesS2a)
        resultString.append(attributedS2a)
        
        let attributedS2 = tf.createStringWithBoldParts(with: stringListWithSpacesS2, boldedIndexes: boldIndexesS2)
        resultString.append(attributedS2)

        
        stringListWithSpacesS3.append("\n\n")
        
        let attributedS3 = tf.createStringWithBoldParts(with: stringListWithSpacesS3, boldedIndexes: boldIndexesS3)
        resultString.append(attributedS3)
        
        
        return resultString
    }
    
    /// Creates the styled text for the thrid paragraph of the analysis tab.
    ///
    /// - Parameter d: a bag of shared properties used to fill in the blanks.
    /// - Returns: customized attributed text string based on ParagraphData properites
    fileprivate func generateParagraphTwo(with d: ParagraphData) -> NSMutableAttributedString {
        
        let resultString = NSMutableAttributedString(string: "", attributes: [:])
        let tf = TextFormatter()
        
        if d.modifiedYearsLeft < 0 {
            // handle part before the name
            resultString.append(tf.createPlainString(with: "If "))
            
            // handle name (in case it's more than one substring
            resultString.append(tf.createBoldString(with: "\(d.name)"))
            
            // handle part after the name
            let p2p3 = " is still alive \(d.subject) is living on borrowed time. \(d.subject.capitalized) has lived an extra \(abs(d.modifiedYearsLeft)) years so far."
            let stringsP2P3 = transformStringIntoList(with: p2p3)
            let boldInexesP2P3 = [3, 8, 15]
            let attributedP2P3 = tf.createStringWithBoldParts(with: stringsP2P3, boldedIndexes: boldInexesP2P3)
            resultString.append(attributedP2P3)

        } else {
            // handle part before the name
            resultString.append(tf.createPlainString(with: "If "))
            
            // handle name (in case it's more than one substring
            resultString.append(tf.createBoldString(with: "\(d.name)"))
            
            // handle part after the name
            let p2p3 = " lives beyond \(d.modifiedDeathYear) and the age of \(d.modifiedLifeExpectancy), \(d.subject) will be living on borrowed time."
            let stringsP2P3 = transformStringIntoList(with: p2p3)
            let boldInexesP2P3 = [3, 8, 14]
            let attributedP2P3 = tf.createStringWithBoldParts(with: stringsP2P3, boldedIndexes: boldInexesP2P3)
            resultString.append(attributedP2P3)

        }
        
        return resultString

    }
    
    // MARK: - Text Generation Support -
    
    /// Creates the second paragraph's life factors analysis text with the inext of key terms for bolding.
    ///
    /// - Parameter d: a bag of shared properties used to fill in the blanks.
    /// - Returns: A string and array of index values ready to transformed into attributed text.
    fileprivate func generateParagraphTwoLifeFactorsText(with d: ParagraphData) -> (String, [Int]) {
        
        var resultString = ""
        var resultIndexes = [Int]()
        
        // declare states
        enum LifeFactorState {
            case noFactors, someFactors, allFactors
        }
        
        // compute states
        var lifeFactorState: LifeFactorState
        if d.activityLevel == "not set" && d.stressLevel == "not set" && d.riskLevel == "not set" && d.geneticsLevel == "not set" {
            lifeFactorState = .noFactors
        } else if d.activityLevel != "not set" && d.stressLevel != "not set" && d.riskLevel != "not set" && d.geneticsLevel != "not set" {
            lifeFactorState = .allFactors
        } else {
            lifeFactorState = .someFactors
        }
        
        // use states to build text
        switch lifeFactorState {
            
        case .noFactors:
            
            let part1 = " was born \(d.age) years ago in \(d.birthYear). \(d.possesser.capitalized) "
            let part2 = "life factors were not recorded on the profile tab. \n\n"
            
            resultString = part1 + part2
            resultIndexes = [3, 7, 9, 10, 12, 16]
            
        case .allFactors:
            
            // TODO: is this ever called?
            
            let part1 = " was born \(d.age) years ago in \(d.birthYear). \(d.possesser.capitalized) natural life expectancy of \(d.lifeExpectancy) years is influenced by the following life factors: "
            let part2 = "A \(d.activityLevel) level of physical activity. "
            let part3 = "A \(d.stressLevel) level of mental stress. "
            let part4 = "A \(d.riskLevel) level of risky behavior. "
            let part5 = "An \(d.geneticsLevel) genetic history. "
            let part6 = "\n\n"
            
            resultString = part1 + part2 + part3 + part4 + part5 + part6
            resultIndexes = [3, 7, 13, 20, 21, 23, 29, 35, 41]
        case .someFactors:
            
            let part1 = " was born \(d.age) years ago in \(d.birthYear). \(d.possesser.capitalized) natural life expectancy of \(d.lifeExpectancy) years is influenced by one or more life factors: "
            let part2 = d.activityLevel != "not set" ? "A \(d.activityLevel) level of physical activity. " : ""
            let part3 = d.stressLevel != "not set" ? "A \(d.stressLevel) level of mental stress. " : ""
            let part4 = d.riskLevel != "not set" ? "A \(d.riskLevel) level of risky behavior. " : ""
            let part5 = d.geneticsLevel != "not set" ? "An \(d.geneticsLevel) genetic history. " : ""
            let part6 = "\n\n"
            
            resultString = part1 + part2 + part3 + part4 + part5 + part6

            resultIndexes = [3, 7, 13, 21, 22]
            var wordCount = resultIndexes.last!
            
            // Calcuate resultIndexes based on the appearance of unique words and offsets (wordCount)
            
            if resultString.contains("physical") {
                resultIndexes += [wordCount + 2]
                wordCount += 6
            }
            
            if resultString.contains("mental") {
                resultIndexes += [wordCount + 2]
                wordCount += 6
            }
            
            if resultString.contains("risky") {
                resultIndexes += [wordCount + 2]
                wordCount += 6
            }
            
            if resultString.contains("genetic") {
                resultIndexes += [wordCount + 2]
                wordCount += 4 // update wordCount in case more parts are added in the future
            }
        }
        
        return (resultString, resultIndexes)
    }
    
    /// Creates the styled text for the second paragraph of the analysis tab.
    ///
    /// - Parameter d: a bag of shared properties used to fill in the blanks.
    /// - Returns: customized attributed text string based on ParagraphData properites
    fileprivate func generateParagraphOneSentanceOne(with d: ParagraphData) -> NSMutableAttributedString {
        
        let resultString = NSMutableAttributedString(string: "", attributes: [:])
        let tf = TextFormatter()
        
        // handle name seperately in case it's more than one substring
        resultString.append(tf.createBoldString(with: "\(d.name)"))

        // handle the rest of the sentance
        let (restOfTheSentance, boldIndexes) = generateParagraphTwoLifeFactorsText(with: d)
        let stringsWithSpaces = transformStringIntoList(with: restOfTheSentance)
        //let boldIndexes = [3, 7, 12, 18, 24, 30, 37]
        let attributed = tf.createStringWithBoldParts(with: stringsWithSpaces, boldedIndexes: boldIndexes)
        resultString.append(attributed)
        
        return resultString
    }
    
    /// Transforms a string, "cat, dog, cow", into a list ["cat ", "dog ", "cow"]
    /// with a space at the end of each word in the list except for the final
    /// word.
    ///
    /// - Parameter s: the string to parse.
    /// - Returns: array of strings with appropriate spaces.
    fileprivate func transformStringIntoList(with s: String) -> [String] {
        
        let stringList = s.components(separatedBy: " ")
        var stringListWithSpaces = stringList.map({ $0 + " "})
        
        // remove space from end of last string in the list
        // (screws up spacing between parts of strings)
        
        if stringListWithSpaces.count > 0 {
            let trimmedString = stringListWithSpaces.last!.trimmingCharacters(in: .whitespaces)
            stringListWithSpaces.remove(at: stringListWithSpaces.count - 1)
            stringListWithSpaces.append(trimmedString)
        }
        
        return stringListWithSpaces
    }
}

