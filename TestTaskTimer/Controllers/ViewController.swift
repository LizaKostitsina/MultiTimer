//
//  ViewController.swift
//  TestTaskTimer
//
//  Created by Костицина Елизавета Константиновна on 01.07.2021.
//

import UIKit

class ViewController: UIViewController {

    public var timersModel: [TimerModel] = []
    
    public var tableView = UITableView()
    lazy var button = SetupButton.setupButton(vc: self)
    lazy var timerNameTextfield = SetupTextFields.setupTextField(placeHolder: "Название таймера", y: 10,keyboard: .default)
    lazy var timeTextfield = SetupTextFields.setupTextField(placeHolder: "Время в секундах", y: 50,keyboard: .numberPad)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationBar = NavigationBarSetup.setupNavigationBar(viewController: self)
        
        self.view.addSubview(navigationBar)
        
        tableView.frame = CGRect(x: self.view.frame.minX, y: self.view.frame.minY + navigationBar.frame.height , width: self.view.frame.width, height: 500)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        
        self.view.addSubview(tableView)
        
        button.addTarget(self, action: #selector(tappedButton(_:)), for: .touchUpInside)
        
        timeTextfield.delegate = self
        timerNameTextfield.delegate = self
        
        
        
    }
    
    func startTimer(timerModel: TimerModel) {
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] (Timer) in
            
            if timerModel.time > 0 {
                
                self?.tableView.reloadSections([1], with: .none)
                timerModel.time -= 1
            } else {
                
                Timer.invalidate()
                
                if let timersModel = self?.timersModel, !timersModel.isEmpty {
                    self?.timersModel.removeLast()
                }
                self?.tableView.reloadSections([1], with: .automatic)
                
                timerModel.timer = nil
            }
            
        }
        
        timerModel.timer = timer
      
    }
    
    @objc func tappedButton(_ sender: UIButton) {
        

        guard let name = self.timerNameTextfield.text, let time = self.timeTextfield.text , !name.isEmpty,
              !time.isEmpty else  { return }
        
        guard let intTime = Int(time) else { return }
        let timerModel = TimerModel(name: name, time: intTime,isPaused: false)
        
        timersModel.append(timerModel)
        timersModel.sort { $0.time > $1.time }
        
        startTimer(timerModel: timerModel)

        self.timeTextfield.text = ""
        self.timerNameTextfield.text = ""
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
        
        super.touchesBegan(touches, with: event)
    }
    
}




