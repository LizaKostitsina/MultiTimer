//
//  SetupButton.swift
//  TestTaskTimer
//
//  Created by Костицина Елизавета Константиновна on 01.07.2021.
//

import UIKit

class SetupButton {
    
    static func setupButton(vc: UIViewController) -> UIButton {
        
        let button = UIButton()
        let width: CGFloat =  vc.view.frame.width - 40
        let height: CGFloat = 50
        button.frame = CGRect(x: vc.view.frame.minX + 20, y: 100, width: width, height: height)
        button.setTitle("Добавить", for: .normal)
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.systemBlue, for: .normal)
        
        var font = UIFont(name: "Futura", size: 14)
        font = font?.bold
        button.titleLabel?.font = font
        button.layer.cornerRadius = 15
        
        return button
    }
    
}
