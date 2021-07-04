//
//  TimerModel.swift
//  TestTaskTimer
//
//  Created by Костицина Елизавета Константиновна on 01.07.2021.
//

import Foundation

class TimerModel {
    
    public var name: String
    public var time: Int
    public weak var timer: Timer?
    public var isPaused: Bool
    
    init(name: String, time:Int,isPaused: Bool) {
        
        self.name = name
        self.time = time
        self.isPaused = isPaused
        
        
    }
}
