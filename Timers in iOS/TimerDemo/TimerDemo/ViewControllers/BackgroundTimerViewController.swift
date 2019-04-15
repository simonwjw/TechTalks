//
//  BackgroundTimerViewController.swift
//  TimerDemo
//
//  Created by Simon Wang on 11/04/19.
//  Copyright © 2019 Simon Wang. All rights reserved.
//

import UIKit

class BackgroundTimerViewController: UIViewController {
    
    @IBOutlet var infoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTouchStartOperationsButton(_ button: UIButton) {
        let queue = OperationQueue()
        
        for _ in 1...3 {
            queue.addOperation(ExpirableOperation())
        }
        
        DispatchQueue.global().async {
            queue.waitUntilAllOperationsAreFinished()
            DispatchQueue.main.async {
                self.infoLabel.text = "operations all done!"
            }
        }
    }
}
