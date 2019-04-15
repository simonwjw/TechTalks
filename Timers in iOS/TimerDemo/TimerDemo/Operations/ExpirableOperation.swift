//
//  ExpirableOperation.swift
//  TimerDemo
//
//  Created by Simon Wang on 11/04/19.
//  Copyright © 2019 Simon Wang. All rights reserved.
//

import Foundation

class ExpirableOperation: MyOperation {
    
    private var dispatchTimer: DispatchSourceTimer?

    override func start() {
        guard !isCancelled else {
            finishOperation()
            return
        }
        
        startExecuting()
        
// Test 3 - use NSTimer in a background thread by running a runloop explicitly
//        let timer = Timer(timeInterval: 2, repeats: false, block: { _ in
//            self.finishOperation()
//        })
//
//        RunLoop.current.add(timer, forMode: .default)
//        RunLoop.current.run()
        
        let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())

        dispatchTimer = timer
        timer.schedule(deadline: .now() + .seconds(10), leeway: .microseconds(20))

        timer.setEventHandler {
            print("operation expired!")
            
            self.finishOperation()
        }
        timer.resume()
        
        /**
        // Do lots of things here
        // Do lots of things here
        // Do lots of things here
         */
    }
    
    override func finishOperation() {
        super.finishOperation()
        dispatchTimer?.cancel()
    }
}
