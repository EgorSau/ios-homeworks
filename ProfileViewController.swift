//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Egor SAUSHKIN on 28.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let profileView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? UIView {
            self.view.addSubview(profileView)
        }
    }
}
