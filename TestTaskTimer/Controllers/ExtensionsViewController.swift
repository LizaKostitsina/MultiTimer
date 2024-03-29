//
//  ExtensionsViewController.swift
//  TestTaskTimer
//
//  Created by Костицина Елизавета Константиновна on 01.07.2021.
//

import UIKit

//MARK: - UITableViewDelegate , UITableViewDataSource

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell",for: indexPath) as! TableViewCell
        
        
        let timerNameLabel : UILabel = {
            
            let label = UILabel()
            label.frame = CGRect(x: 15, y: 10, width: cell.frame.width / 2, height: 30)
            label.backgroundColor = .white
            label.numberOfLines = 0
            return label
        }()
        
        let timeLabel : UILabel = {
            
            let label = UILabel()
            label.frame = CGRect(x: timerNameLabel.frame.minX + timerNameLabel.frame.width + 10, y: 10, width: 60, height: 30)
            label.backgroundColor = .white
            return label
        }()
        
        let button : UIButton = {
            
            let button = UIButton()
            button.backgroundColor = .black
            button.frame = CGRect(origin: CGPoint(x: 300, y: 10), size: CGSize(width: 60, height: 30))
            button.setTitle("STOP", for: .normal)
            return button
            
        }()
       
        
        if indexPath.section == 0 {
            cell.selectionStyle = .none
            cell.addSubview(self.button)
            cell.addSubview(timerNameTextfield)
            cell.addSubview(timeTextfield)
            
            
        } else if indexPath.section == 1 && timersModel.count > 0 {
            
            let timer = timersModel[indexPath.row]
            
            timerNameLabel.text = timer.name
            timeLabel.text = timer.time.inMinutes
            button.tag = indexPath.row
            button.addTarget(self, action: #selector(cellButtonTapped(_:)), for: .touchUpInside)
            timersModel[button.tag].isPaused ? button.setTitle("START", for: .normal) : button.setTitle("STOP", for: .normal)
            cell.addSubview(timerNameLabel)
            cell.addSubview(timeLabel)
            
            cell.addSubview(button)
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return self.timersModel.count > 0 ? self.timersModel.count : 1
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 200 : 50
    }
    
   
    
    //MARK: - Headers
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        let label = EdgeInsetLabel()
        label.textInsets = UIEdgeInsets(top: 30, left: 30, bottom: 10, right: 30)
        label.frame = CGRect(x: 0, y: 0 , width: headerView.frame.width , height: headerView.frame.height )
        label.text = section == 0 ?  "Добавление таймеров" : "Таймеры"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.backgroundColor = .secondarySystemBackground
        

        let color = UIColor.systemGray

        let view = UIView(frame: CGRect(x: 0, y: label.frame.height - 1 , width: label.frame.width, height: 1))
        view.backgroundColor = color.withAlphaComponent(0.5)
        
        
        label.addSubview(view)
        headerView.addSubview(label)
        
        return headerView
    }
    
    @objc func cellButtonTapped(_ sender : UIButton) {
        
        if timersModel[sender.tag].isPaused {
            
            startTimer(timerModel: timersModel[sender.tag]) 
            timersModel[sender.tag].isPaused = false
            
        } else {
            timersModel[sender.tag].timer?.invalidate()
            timersModel[sender.tag].isPaused = true
            
        }
        timersModel.sort { $0.time > $1.time }
        
        self.tableView.reloadSections([1], with: .automatic)
        
    }
}

//MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
