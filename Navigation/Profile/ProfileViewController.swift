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
    
    private lazy var tableView: ProfileTableHeaderView = {
        let tableView = ProfileTableHeaderView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var photoView: PhotoTableHeaderView = {
        let photoView = PhotoTableHeaderView()
        photoView.translatesAutoresizingMaskIntoConstraints = false
        return photoView
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
        self.view.addSubview(self.photoView)
        self.view.addSubview(self.tableView)
        
        //настройка профиля
        let topConstraint = self.headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let heightConstraint = self.headerView.heightAnchor.constraint(equalToConstant: 290)
        
        //настройка фото
        let topPhotoConstraint = self.photoView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor)
        let leadingPhotoConstraint = self.photoView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingPhotoConstraint = self.photoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
//        let bottomPhotoConstraint = self.photoView.bottomAnchor.constraint(equalTo: self.tableView.topAnchor)
        let heightPhotoConstraint = self.photoView.heightAnchor.constraint(equalToConstant: 150)
        
        //настройка таблицы
        let topTableConstraint = self.tableView.topAnchor.constraint(equalTo: self.photoView.bottomAnchor)
        let leadingTableConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingTableConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomTableConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([
                                    topConstraint,
                                    leadingConstraint,
                                    trailingConstraint,
                                    heightConstraint,
//                                    bottomPhotoConstraint,
                                    topTableConstraint,
                                    leadingTableConstraint,
                                    trailingTableConstraint,
                                    bottomTableConstraint,
                                    topPhotoConstraint,
                                    leadingPhotoConstraint,
                                    trailingPhotoConstraint,
                                    heightPhotoConstraint
                                    ])
    }
}
