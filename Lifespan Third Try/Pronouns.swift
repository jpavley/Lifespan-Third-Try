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
    case netural1 = 1
    case netural2 = 2
    case netural3 = 3
    case netural4 = 4
    case male = 5
}

struct PronounTrio {
    var subjective: String = "he" // she, they, xe, zhe, it
    var objective: String = "him" // her, them, xim, zer, it
    var possessive: String = "his" // her, their, xis, zer, its
    
    static func female() -> PronounTrio {
        return PronounTrio(subjective: "she", objective: "her", possessive: "her")
    }
    
    static func netural1() -> PronounTrio {
        return PronounTrio(subjective: "zhe", objective: "zer", possessive: "zer")
    }

    
    static func netural2() -> PronounTrio {
        return PronounTrio(subjective: "it", objective: "it", possessive: "its")
    }
    
    static func netural3() -> PronounTrio {
        return PronounTrio(subjective: "they", objective: "them", possessive: "their")
    }

    static func netural4() -> PronounTrio {
        return PronounTrio(subjective: "xe", objective: "xim", possessive: "xis")
    }

    
    static func male() -> PronounTrio {
        return PronounTrio(subjective: "he", objective: "him", possessive: "his")
    }
    
    static func getPronouns(for gender: PronounGender) -> PronounTrio {
        switch gender {
        case .female:
            return PronounTrio.female()
        case .netural1:
            return PronounTrio.netural1()
        case .netural2:
            return PronounTrio.netural2()
        case .netural3:
            return PronounTrio.netural3()
        case .netural4:
            return PronounTrio.netural4()
        case .male:
            return PronounTrio.male()
        }
    }
}
