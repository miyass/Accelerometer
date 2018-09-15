//
//  MeasureViewController.swift
//  Accelerometer
//
//  Created by 宮倉宗平 on 2018/09/15.
//  Copyright © 2018年 Sohei Miyakura. All rights reserved.
//

import UIKit
import CoreMotion

class MeasureViewController: UIViewController {
    
    @IBOutlet weak var awaImageView: UIImageView!
    
    var accelerationX: Double!
    
    let motionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isAccelerometerActive {
            motionManager.accelerometerUpdateInterval = 0.01
            
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler: {(data, error) in
                self.accelerationX = (data?.acceleration.x)!
                self.awaImageView.center.x = self.awaImageView.center.x - CGFloat(self.accelerationX * 20)
                
                if self.awaImageView.frame.origin.x < 40 {
                    self.awaImageView.frame.origin.x = 40
                }
                if self.awaImageView.frame.origin.x > 260 {
                    self.awaImageView.frame.origin.x = 260
                }
            })
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.accelerationX = self.accelerationX
    }

}
