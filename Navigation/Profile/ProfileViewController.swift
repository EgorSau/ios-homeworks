//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 20.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var headerView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    private var heightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupSubView()
    }
    override dynamic func viewWillLayoutSubviews() {
//        headerView.backgroundColor = .systemPink
        self.headerView.frame = self.view.frame
    }
    
    private func setupView(){
        self.view.backgroundColor = .white
        self.navigationItem.title = "Profile"
    }
    
    private func setupSubView(){
        
        self.view.addSubview(self.headerView)
        
        let topConstraint = self.headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.headerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.headerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        let heightConstraint = self.headerView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor)
        
        NSLayoutConstraint.activate([topConstraint,
                                     leadingConstraint,
                                     trailingConstraint,
                                     heightConstraint
                                    ])
    }
}
