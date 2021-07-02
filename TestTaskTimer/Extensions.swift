//
//  Extensions.swift
//  TestTaskTimer
//
//  Created by Костицина Елизавета Константиновна on 01.07.2021.
//

import UIKit

extension Int {

    public var inMinutes: String {
        
        let minutes = self / 60
        
        let seconds = self % 60
        
        
        return seconds < 10 ? "\(minutes):0\(seconds)" : "\(minutes):\(seconds)"
        
    }
}

extension UIFont {
    
    public var bold: UIFont {
        return with(traits: .traitBold)
    }
    
    public var italic: UIFont {
        return with(traits: .traitItalic)
    }
    
    public var boldItalic: UIFont {
        return with(traits: [.traitBold, .traitItalic])
    }
    
    public var expanded: UIFont {
        return with(traits: .traitExpanded)
    }

    
    public func with(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(traits) else {
            return self
        }
        
        return UIFont(descriptor: descriptor, size: 0)
    }
}
