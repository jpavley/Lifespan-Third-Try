//
//  Pronouns.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 5/19/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import Foundation

enum PronounGender: Int {
    case female = 0
    case netural = 1
    case male = 2
}

struct PronounTrio {
    var subjective: String = "he" // she, they
    var objective: String = "him" // her, them
    var possessive: String = "his" // her, their
    
    static func female() -> PronounTrio {
        return PronounTrio(subjective: "she", objective: "her", possessive: "her")
    }
    
    static func netural() -> PronounTrio {
        return PronounTrio(subjective: "they", objective: "them", possessive: "their")
    }
    
    static func male() -> PronounTrio {
        return PronounTrio(subjective: "he", objective: "him", possessive: "his")
    }
    
    static func getPronouns(for gender: PronounGender) -> PronounTrio {
        switch gender {
        case .female:
            return PronounTrio.female()
        case .netural:
            return PronounTrio.netural()
        case .male:
            return PronounTrio.male()
        }
    }
}
