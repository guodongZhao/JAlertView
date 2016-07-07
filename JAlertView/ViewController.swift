//
//  ViewController.swift
//  JAlertView
//
//  Created by 开发者 on 16/5/9.
//  Copyright © 2016年 jinxiansen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func showAlertView(sender: AnyObject) {
        
        let alertView = JAlertView.init(title: "我是标题",
                                        message: "苹果全球开发者大会，英文全称是“Worldwide Developers Conference”。简称为“WWDC”（Apple Worldwide Developers Conference）的简称，每年定期由苹果公司（Apple Inc.）在美国举办。大会主要的目的是让苹果公司向研发者们展示最新的软件和技术。2014年6月2日苹果公司在旧金山莫斯考尼西中心召开了一年一度的全球开发者大会，在本届大会上，苹果发布了最新的iOS8和Mac OS X10.10操作系统。",
                                        cancelButtonTitle:nil,
                                        sureButtonTitle: "确定")
        
        alertView.show()
        alertView.clickIndexClosure { (index) in
            print("啊，点到了\(index)")
        }
    }
    
    
    
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

