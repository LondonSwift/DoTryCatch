//
//  ViewController.swift
//  DoTryCatch
//
//  Created by Daren David Taylor on 25/09/2015.
//  Copyright © 2015 LondonSwift. All rights reserved.
//

import UIKit
import LSRepeater
import LSImageThrowing

class ViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var numberImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var counter = 1
    var repeater: LSRepeater?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repeater = LSRepeater.repeater(0.5, execute: {
            
            let counterString = String(self.counter)
            
            // This demonstrates the use of try!, im quite happy for the app to assert if the image doesnt exist, (an assert happens if a try! fails)
            self.numberImageView.image = try! UIImage(named: counterString, placeholderOrThrow: "Placeholder" )
            
            self.label.text = counterString
            
            if ++self.counter == 6 {
                self.counter = 1
            }
        })
     
        // Once again, if the image isnt found AND the placeholder isnt found, we just want the app to assert
        self.logoImageView.image = try! UIImage(namedOrThrow: "LondonSwift")
    }
}

