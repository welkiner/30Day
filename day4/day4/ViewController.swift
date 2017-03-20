//
//  ViewController.swift
//  day4
//
//  Created by tian.liang on 16/5/4.
//  Copyright © 2016年 welkiner. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.isPagingEnabled = true
        
        let leftController = LeftController(nibName: "LeftController", bundle: nil)
        let rigtController = RightController(nibName: "RightController", bundle: nil)
        
        self.addChildViewController(leftController)
        self.scrollView.addSubview(leftController.view)
        leftController.didMove(toParentViewController: self)
        
        self.addChildViewController(rigtController)
        self.scrollView.addSubview(rigtController.view)
        rigtController.didMove(toParentViewController: self)
        
        leftController.view.snp.makeConstraints{ make in
            make.top.equalTo(self.scrollView.snp.top)
            make.right.equalTo(rigtController.view.snp.left)
            make.bottom.equalTo(self.scrollView.snp.bottom)
            make.left.equalTo(self.scrollView.snp.left)
            make.width.equalTo(self.scrollView.snp.width)
        }
        
        rigtController.view.snp.makeConstraints { make in
            make.top.equalTo(self.scrollView.snp.top)
            make.right.equalTo(self.scrollView.snp.right)
            make.bottom.equalTo(self.scrollView.snp.bottom)
            make.width.equalTo(self.scrollView.snp.width)
        }
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

