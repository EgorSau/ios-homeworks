//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 20.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var headerView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupSubView()
    }
    
    private func setupView(){
        self.view.backgroundColor = .white
        self.navigationItem.title = "Profile"
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setupSubView(){
        
        self.view.addSubview(self.headerView)
        
        let topConstraint = self.headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)

        let leadingConstraint = self.headerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.headerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
//        let heightConstraint = self.headerView.heightAnchor.constraint(equalToConstant: 730)
        let bottomConstraint = self.headerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)

        
        NSLayoutConstraint.activate([topConstraint,
                                     leadingConstraint,
                                     trailingConstraint,
//                                     heightConstraint,
                                     bottomConstraint
                                    ].compactMap({ $0 }))
    }
}
