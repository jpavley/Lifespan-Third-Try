//
//  StringUtilities.swift
//  Lifespan Third Try
//
//  Created by John Pavley on 4/7/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import Foundation
import UIKit

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

class TextFormatter {
    
    var plainFontDescriptor: UIFontDescriptor
    var boldFontDescriptor: UIFontDescriptor
    
    var plainFont: UIFont
    
    var boldFontSize: CGFloat
    var boldFont: UIFont
    
    var plainAttributes: [NSAttributedStringKey : UIFont]
    var boldAttributes: [NSAttributedStringKey : UIFont]
    
    init() {
        plainFontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: UIFontTextStyle.body)
        boldFontDescriptor = plainFontDescriptor.withSymbolicTraits(.traitBold)!
        
        plainFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        
        boldFontSize = plainFont.pointSize + 4
        boldFont = UIFont(descriptor: boldFontDescriptor, size: boldFontSize)
        
        plainAttributes = [NSAttributedStringKey.font : plainFont]
        boldAttributes = [NSAttributedStringKey.font : boldFont]
    }
    
    /// Creates a plain style attributed string.
    ///
    /// - Returns: A single attributed string.
    func createPlainString(with s: String) -> NSMutableAttributedString {
        
        return NSMutableAttributedString(string: s, attributes: plainAttributes)
    }
    
    /// Creates a bold style attributed string.
    ///
    /// - Returns: A single attributed string.
    func createBoldString(with s: String) -> NSMutableAttributedString {
        
        return NSMutableAttributedString(string: s, attributes: boldAttributes)
    }
    
    /// Returns an attributed string composed of plain and bold parts.
    ///
    /// - Parameters:
    ///   - textParts: the parts (substrings) of the string to be composed into a single string.
    ///   - boldedIndexes: the substrings to be bolded. (All other substrings are plain.)
    /// - Returns: A single attributed string.
    func createStringWithBoldParts(with textParts: [String], boldedIndexes: [Int]) -> NSMutableAttributedString {
        
        let resultString = NSMutableAttributedString(string: "", attributes: plainAttributes)
        
        for (i, part) in textParts.enumerated() {
            
            if boldedIndexes.contains(i) {
                
                let boldString = NSMutableAttributedString(string: part, attributes: boldAttributes)
                resultString.append(boldString)
                
            } else {
                
                let plainString = NSMutableAttributedString(string: part, attributes: plainAttributes)
                resultString.append(plainString)
                
            }
        }
        
        return resultString
    }
    
    
    /// Returns an attributed string with three parts: plain, bolded, plain.
    ///
    /// - Parameters:
    ///   - text1: plain text that begins the string
    ///   - text2: bold text in the middle of the string
    ///   - text3: plain text that ends the string
    /// - Returns: attributed string, "\(text1) \(text2) \(text3)", where text2 is bolded.
    func createStringWithBoldPart(with text1: String, and text2: String, and text3: String) -> NSMutableAttributedString {
        
        let mainString = NSMutableAttributedString(string: text1, attributes: plainAttributes)
        let middleString = NSMutableAttributedString(string: text2, attributes: boldAttributes)
        let endString = NSMutableAttributedString(string: text3,attributes: plainAttributes)
        
        mainString.append(middleString)
        mainString.append(endString)
        
        return mainString
    }
}
