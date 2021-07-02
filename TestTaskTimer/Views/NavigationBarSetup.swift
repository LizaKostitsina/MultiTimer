//
//  File.swift
//  TestTaskTimer
//
//  Created by Костицина Елизавета Константиновна on 01.07.2021.
//

import UIKit

class NavigationBarSetup {
    
    static func setupNavigationBar(viewController: UIViewController) -> UINavigationBar {
        
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x:0, y:0, width:viewController.view.frame.width, height:80))
        navBar.backgroundColor = UIColor.lightGray
    
        let label = NavigationBarLabel(superView: navBar)
        
        let view = UIView()
        view.frame = CGRect(x: 1, y: 1, width: navBar.frame.width - 2, height: navBar.frame.height - 2)
        view.backgroundColor = UIColor.secondarySystemBackground
        view.addSubview(label)
        
        navBar.addSubview(view)

        return navBar
    }
    
    
}
