//
//  ViewController.swift
//  day1
//
//  Created by tl on 16/5/3.
//  Copyright © 2016年 welkiner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    dynamic var count = 0.0 {
        didSet{
            timeLabel.text = String(count)
        }
    }
    var isPlaying = false
    var timer: NSTimer?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timeLabel.text = String(count)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func beginBtnClick(sender: UIButton) {
        guard !isPlaying else {
            return
        }
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.start), userInfo: nil, repeats: true)
        isPlaying = true
    }
    func start() -> Void {
        self.count += 0.1
    }
    @IBAction func suspendBtnClick(sender: UIButton) {
        timer?.invalidate()
        isPlaying = false
    }
    
    @IBAction func resetBtnClick(sender: UIButton) {
        self.count = 0
        isPlaying = false
        timer?.invalidate()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

