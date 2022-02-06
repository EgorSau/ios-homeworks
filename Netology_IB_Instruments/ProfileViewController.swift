//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Egor SAUSHKIN on 02.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
   // @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let profileView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? UIView {
            self.view.addSubview(profileView)
        }
    }
}
