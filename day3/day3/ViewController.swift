//
//  ViewController.swift
//  day3
//
//  Created by tian.liang on 16/5/4.
//  Copyright © 2016年 welkiner. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let contentss = [VideoInfo(image: UIImage.init(named: "videoScreenshot01"), content: "我是一"),
                     VideoInfo(image: UIImage.init(named: "videoScreenshot02"), content: "我是二"),
                     VideoInfo(image: UIImage.init(named: "videoScreenshot03"), content: "我是三"),
                     VideoInfo(image: UIImage.init(named: "videoScreenshot04"), content: "我是四"),
                     VideoInfo(image: UIImage.init(named: "videoScreenshot05"), content: "我是五"),
                     VideoInfo(image: UIImage.init(named: "videoScreenshot05"), content: "我是六")]
    
    lazy var playViewController = AVPlayerViewController()
    lazy var playerView = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK: tableView相关
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentss.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! Cell
        cell.contentLabel.text = contentss[indexPath.row].content
        cell.contentImageView.image = contentss[indexPath.row].image
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
        
        playerView = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        
        playViewController.player = playerView
        
        self.presentViewController(playViewController, animated: true) {
            self.playViewController.player?.play()
        }

    }
}

struct VideoInfo {
    let image: UIImage?
    let content: String?
}

class Cell: UITableViewCell {
    @IBOutlet weak var contentImageView: UIImageView!
    
    @IBOutlet weak var contentLabel: UILabel!
}

