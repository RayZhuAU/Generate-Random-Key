//
//  ViewController.swift
//  Hackathon
//
//  Created by Ray Zhu on 26/06/2016.
//  Copyright © 2016 Ray Zhu. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var GenerateRandomKey: UIButton!
    @IBOutlet weak var KeyString: UILabel!
    @IBOutlet weak var CharacterNumber: UITextField!
    
    @IBAction func GenerateRandomKey(sender: UIButton) {
        guard let numberOfCharacters = Int(CharacterNumber.text!) else{
            CharacterNumber.text = ""
            return
        }
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString : NSMutableString = NSMutableString(capacity: numberOfCharacters)
        for (var i=0; i < numberOfCharacters; i++){
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.characterAtIndex(Int(rand)))
        }
        KeyString.text = randomString as String
        UIPasteboard.generalPasteboard().string = randomString as String
        
        

        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GenerateRandomKey.titleLabel?.textAlignment = NSTextAlignment.Center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

