//
//  NavigationBarLabel.swift
//  TestTaskTimer
//
//  Created by Костицина Елизавета Константиновна on 01.07.2021.
//

import UIKit

class NavigationBarLabel: UILabel {
    
    private var width: CGFloat = 200
    private var height: CGFloat = 45
    
    init(superView: UINavigationBar) {
        
        super.init(frame: CGRect(origin: CGPoint(x: superView.frame.width / 2 - width / 2,
                                                 y: superView.frame.height / 1.5 - height / 2),
                                 size: CGSize(width: width, height: height)))
        
        text = "Мульти таймер"
        textAlignment = .center
        font = font.bold
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


