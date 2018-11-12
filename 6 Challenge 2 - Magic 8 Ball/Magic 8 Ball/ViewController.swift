//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Rami on 11/11/18.
//  Copyright © 2018 LyfeBug. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var randomNum = 0
  let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
  
  @IBOutlet weak var eightBall: UIImageView!
  
  @IBAction func startButton(_ sender: Any) {
    updateBallImage()
  }
  
  func updateBallImage() {
    randomNum = Int(arc4random_uniform(5))    // this random works below iOS 12
    eightBall.image = UIImage(named: ballArray[randomNum])
  }
  
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    updateBallImage()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateBallImage()
  }
  
}

