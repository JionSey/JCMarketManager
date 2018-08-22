//
//  ViewController.swift
//  JCMarketManagerDemo
//
//  Created by Jackie on 2018/8/22.
//  Copyright © 2018年 Jackie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let test5Width = 320~*
        print(test5Width)
        
        let test6Width = 375~~
        print(test6Width)
        
        let test6pWidth = 414~&
        print(test6pWidth)
        
        // 5  下运行结果均为 320.0
        // 6  下运行结果均为 375.0
        // 6P 下运行结果均为 414.0
        
        // 所以只要指定对应设计稿
        // 在各个手机下显示的也就全按照比例适配了
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

