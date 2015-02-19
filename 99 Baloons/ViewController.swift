//
//  ViewController.swift
//  99 Baloons
//
//  Created by Sebastian Burek on 18.02.2015.
//  Copyright (c) 2015 Sebastian Burek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    var myBalloons:[Balloon] = []
    
    var currentIndex = 0
    var balloonPictures: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        balloonPictures += [UIImage(named: "RedBalloon1.jpg")!]
        balloonPictures += [UIImage(named: "RedBalloon2.jpg")!]
        balloonPictures += [UIImage(named: "RedBalloon3.jpg")!]
        balloonPictures += [UIImage(named: "Redballoon4.jpg")!]
        
        func randomPicture() -> UIImage {
            
            let randomIndex = Int(arc4random_uniform(UInt32(3)))
            
            var randomPicture:UIImage
            
            if randomIndex == 0 {
                randomPicture = UIImage(named: "RedBalloon1.jpg")!
            }
            else if randomIndex == 1 {
                randomPicture = UIImage(named: "RedBalloon2.jpg")!
            }
            else if randomIndex == 2 {
                randomPicture = UIImage(named: "RedBalloon3.jpg")!
            }
            else {
                randomPicture = UIImage(named: "RedBalloon4.jpg")!
            }
            return randomPicture
            
        }
        
        for var consecutiveBalloon = 1; consecutiveBalloon <= 99; ++consecutiveBalloon {
            var number = consecutiveBalloon
            var balloonInArray = Balloon()
            balloonInArray.balloonNumber = number
            balloonInArray.balloonTitle = "Balloon \(consecutiveBalloon)"
            balloonInArray.image = randomPicture()
            myBalloons.append(balloonInArray)
            }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        let balloon = myBalloons[currentIndex]
            numberLabel.text = balloon.balloonTitle
            myImageView.image = balloon.image
        
            currentIndex += 1
        
        UIView.transitionWithView(self.view, duration: 0.1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            }, completion: {
                (finished: Bool) -> () in
        })


    }
}
