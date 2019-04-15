//
//  MyOperation.swift
//  TimerDemo
//
//  Created by Simon Wang on 11/04/19.
//  Copyright © 2019 Simon Wang. All rights reserved.
//

import UIKit

class MyOperation: Operation {
    
    private var operationIsExecuting = false
    private var operationIsFinished = false
    
    override var isExecuting: Bool {
        return operationIsExecuting;
    }
    
    override var isFinished: Bool {
        return operationIsFinished;
    }
    
    func startExecuting() {
        willChangeValue(forKey: "isExecuting")
        operationIsExecuting = true
        didChangeValue(forKey: "isExecuting")
    }
    
    func finishOperation() {
        guard !isFinished else { return }
        
        willChangeValue(forKey: "isExecuting")
        willChangeValue(forKey: "isFinished")
        operationIsExecuting = true
        operationIsFinished = true
        didChangeValue(forKey: "isExecuting")
        didChangeValue(forKey: "isFinished")
    }
    
}
