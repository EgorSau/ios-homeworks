//
//  ViewController.swift
//  Netology_IB_Instruments
//
//  Created by Egor SAUSHKIN on 02.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var example: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.example.text = "Hello world!"
    }


}

