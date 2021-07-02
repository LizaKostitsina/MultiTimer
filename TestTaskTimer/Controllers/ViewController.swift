//
//  ViewController.swift
//  TestTaskTimer
//
//  Created by Костицина Елизавета Константиновна on 01.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var titleNavigBar : UILabel! = {
        let tit = UILabel()
        tit.frame = CGRect(x: 0, y: 0, width: 50, height: 100)
        tit.text = "Мульти таймер"
        return tit
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x:0, y:0, width:self.view.frame.width, height:80))
        
        navBar.backgroundColor = .gray
        navBar.addSubview(titleNavigBar)

        self.view .addSubview(navBar)
        
    }


}

