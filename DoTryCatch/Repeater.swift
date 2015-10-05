//
//  Repeater.swift
//  DoTryCatch
//
//  Created by Daren David Taylor on 27/09/2015.
//  Copyright © 2015 LondonSwift. All rights reserved.
//

import UIKit

public typealias RepeatClosure = () -> Void

// we need to subclass NSObject, as NSTimer uses the runtime for method invocation
class DDTRepeater: NSObject {
    
    var timer:NSTimer!
    var execute:RepeatClosure!
    
    class func repeater(interval:NSTimeInterval, execute: RepeatClosure) -> DDTRepeater {
        
        let repeater = DDTRepeater()
        repeater.execute = execute
        
        repeater.timer = NSTimer.scheduledTimerWithTimeInterval(interval, target:repeater, selector: Selector("timerDidFire"), userInfo: nil, repeats: true)
        
        repeater.timerDidFire()
        
        return repeater
    }
    
    func timerDidFire() {
        execute()
    }
    
}
