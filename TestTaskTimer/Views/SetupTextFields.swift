//
//  SetupTextFields.swift
//  TestTaskTimer
//
//  Created by Костицина Елизавета Константиновна on 01.07.2021.
//

import UIKit

class SetupTextFields {
    
    static func setupTextField(placeHolder: String, y: CGFloat,keyboard: UIKeyboardType) -> UITextField {
        
        let textfield = UITextField()
        textfield.frame = CGRect(x: 20, y: y, width: 300, height: 30)
        textfield.placeholder = placeHolder
        textfield.keyboardType = keyboard
        textfield.borderStyle = .line
        textfield.borderStyle = .roundedRect
        textfield.returnKeyType = .done
        return textfield
        
    }
    
}
