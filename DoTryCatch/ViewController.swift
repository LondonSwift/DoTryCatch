//
//  ViewController.swift
//  DoTryCatch
//
//  Created by Daren David Taylor on 25/09/2015.
//  Copyright © 2015 LondonSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var numberImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var counter = 1
    var repeater: DDTRepeater?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repeater = DDTRepeater.repeater(0.5, execute: {
            
            let counterString = String(self.counter)
            
            self.numberImageView.image = UIImage(named: counterString, placeholderOrThrow: "Placeholder" )
            
            self.label.text = counterString
            
            if ++self.counter == 6 {
                self.counter = 1
            }
        })
        
        // This demonstrates the use of try!, im quite happy for the app to assert if the image doesnt exist, (an assert happens if a try! fails)
        self.logoImageView.image = try! UIImage(namedOrThrow: "LondonSwift")
        
        
    }
    
}

