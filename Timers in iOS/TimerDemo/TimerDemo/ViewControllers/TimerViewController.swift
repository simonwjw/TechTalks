//
//  TimerViewController.swift
//  TimerDemo
//
//  Created by Simon Wang on 11/04/19.
//  Copyright © 2019 Simon Wang. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    private var refreshTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: oneoff timer
    
    @IBAction func didTouchStartOneoffTimerButton(_ button: UIButton) {
        scheduleOneOffTimer() // Test 1 - schedule an one off timer to the default runloop mode
//        scheduleOneOffTimerInTrackingMode() // Test 2 - schedule an one off timer to the tracking runloop mode
    }
    
    func scheduleOneOffTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            let alert = UIAlertController(title: "Oneoff timer fired!", message: nil, preferredStyle: .alert);
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

        timer.tolerance = 0.2
    }

    func scheduleOneOffTimerInTrackingMode() {
        let timer = Timer(timeInterval: 2, repeats: false) { _ in
            let alert = UIAlertController(title: "Oneoff timer fired!", message: nil, preferredStyle: .alert);
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        timer.tolerance = 0.2
        
        RunLoop.current.add(timer, forMode: .tracking)
    }
    
    // MARK: repeat timer
    
    @IBAction func didTouchStartRepeatTimerButton(_ button: UIButton) {
        refreshTimer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { [weak self] _ in
            let alert = UIAlertController(title: "Repeat timer fired!", message: nil, preferredStyle: .alert);
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self?.present(alert, animated: true, completion: nil)
        })
        
        refreshTimer?.tolerance = 0.3
    }

    @IBAction func didTouchStopRepeatTimerButton(_ button: UIButton) {
        refreshTimer?.invalidate()
    }
}

// MARK: table view data source
extension TimerViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = "Title"
        cell.detailTextLabel?.text = "Details"
        return cell;
    }
}

