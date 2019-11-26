//
//  ViewController.swift
//  authorization
//
//  Created by Roman Kozlov on 26.11.2019.
//  Copyright © 2019 Roman Kozlov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var helloLabel: UILabel!
    @IBOutlet var backButton: UIButton!
    
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.layer.cornerRadius = 10
        
        helloLabel.text = "Welcome, \(name!)!"
    }
}

