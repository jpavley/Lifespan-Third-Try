//
//  StringUtilities.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 4/7/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import Foundation

extension NSAttributedString {
    func replacing(placeholder: String, with valueString: String) -> NSAttributedString {
        
        if let range = self.string.range(of: placeholder) {
            let nsRange = NSRange(range, in: valueString)
            let mutableText = NSMutableAttributedString(attributedString: self)
            mutableText.replaceCharacters(in: nsRange, with: valueString)
            return mutableText as NSAttributedString
        }
        return self
    }
}
