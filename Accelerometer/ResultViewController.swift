//
//  ResultViewController.swift
//  Accelerometer
//
//  Created by 宮倉宗平 on 2018/09/15.
//  Copyright © 2018年 Sohei Miyakura. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var accelerationX: Double!

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let result: Double = fabs(accelerationX * 100)
        label.text = String(format: "%.1f", result)
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
