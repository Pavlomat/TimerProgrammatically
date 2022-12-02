//
//  TimerModel.swift
//  TimerProgrammatically
//
//  Created by Pavlov Matvey on 02.12.2022.
//

import Foundation

class MyTimer {
    
    let view: ViewController
    var name: String
    var time: Int
    
    var timer: Timer!
    var min: Int!
    var sec: Int!
    
    init(name: String, time: Int, vc: ViewController) {
        self.view = vc
        self.name = name
        self.time = time
        min = (time % 3600) / 60
        sec = (time % 3600) % 60
    }
    
    func setTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime(){
        time -= 1
        sec -= 1
        if (time == 0){
            timer.invalidate()
            view.deleteCell()
        }
        if (sec < 0) {
            sec = 59
            if (min != 0) {
                min -= 1
            }
        }
        view.updateView()
    }
}
