//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 20.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
//    private lazy var headerView: ProfileHeaderView = {
//        let view = ProfileHeaderView()
//        view.delegate = self
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()

    private lazy var tableView: ProfileTableHeaderView = {
        let tableView = ProfileTableHeaderView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        
//        self.view.addSubview(self.headerView)
        self.view.addSubview(self.tableView)
        
        //настройка профиля
//        let topConstraint = self.headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
//        let leadingConstraint = self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0)
//        let trailingConstraint = self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0)
//        let heightConstraint = self.headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: -600)
        
        //настройка таблицы
        let topTableConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor) //was headerView & bottomAnchor
        let leadingTableConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingTableConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomTableConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([
//                                    topConstraint,
//                                     leadingConstraint,
//                                     trailingConstraint,
//                                     heightConstraint,
                                     topTableConstraint,
                                     leadingTableConstraint,
                                     trailingTableConstraint,
                                     bottomTableConstraint
                                    ])
    }
}
