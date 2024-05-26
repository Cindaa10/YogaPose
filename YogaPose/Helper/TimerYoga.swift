//
//  Timer.swift
//  YogaPose
//
//  Created by Lucinda Artahni on 19/05/24.
//


import Foundation

class TimerYoga: ObservableObject {
//    @Published var hours = "00"
    @Published var minutes = "00"
    @Published var seconds = "00"
    @Published var remainingTime = "00:00"
    
    private var timer: Timer?
    private var endTime: Date?
    
 
    func start(minutes: Int, seconds: Int) {
        let totalSeconds = (minutes * 60) + seconds
        self.endTime = Date().addingTimeInterval(TimeInterval(totalSeconds))
        
        // Invalidate any existing timer
        timer?.invalidate()
        
        // Create a new timer
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.update()
        }
        
        update()
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
        endTime = nil
        update()
    }
    
    func update() {
            guard let endTime = endTime else {
                remainingTime = "00:00"
                return
            }
            
            let duration = endTime.timeIntervalSince(Date())
            if duration <= 0 {
                stop()
//                self.hours = "00"
                self.minutes = "00"
                self.seconds = "00"
            } else {
//                let hour = Int(duration / 3600)
                let minute = Int(duration / 60)
                let second = Int(duration.truncatingRemainder(dividingBy: 60))
                
//                self.hours = String(format: "%02d", hour)
                self.minutes = String(format: "%02d", minute)
                self.seconds = String(format: "%02d", second)
                
                // Update remainingTime
                remainingTime = String(format: "%02d:%02d", minute, second)
                print(remainingTime)
            }
        }
    }

