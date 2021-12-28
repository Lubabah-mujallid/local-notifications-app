//
//  MyTimer.swift
//  local notifications app
//
//  Created by admin on 23/12/2021.
//
import UIKit
import Foundation

class MyTimer {
    
    var timers = [TimeInterval]()
    var started: Bool
    let formatter = DateComponentsFormatter()
    var currentTimer = Timer()
    
    init() {
        started = false
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.hour, .minute]
    }
    
    func getTotalTime() -> String {
        let total = timers.reduce(0.0, +)
        let formattedTotal = formatter.string(from: total)!
        return "total time: \(formattedTotal)"
    }
    
    func getCurrentTimerSet() -> String {
        if timers.isEmpty {
            return "Timer is set on: --"
        }
        else {
            let formattedTimer = formatter.string(from: timers[timers.count-1])! //hmm I could use timers.last but it returns a double
            return "Timer is set on: \(formattedTimer)"
        }
    }
    func getTimerDetails(at index: Int) -> String {
        let formattedTimer = formatter.string(from: timers[index])!
        return "timer No.\(index+1): \(formattedTimer)"
    }
    
    func startNewTimer(of interval: TimeInterval) {
        print("startNewTimer \(interval)")
        let timer = interval
        timers.append(timer)
        started = true
        currentTimer = Timer()
    }
                  
    func cancelCurrentTimer() {
        print("cancelCurrentTimer")
        started.toggle()
        timers.removeLast()
        currentTimer.invalidate()
    }
    
}
