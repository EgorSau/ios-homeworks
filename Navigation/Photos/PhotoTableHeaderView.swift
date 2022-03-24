//
//  PhotoTableHeaderView.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 17.03.2022.
//

import UIKit

class PhotoTableHeaderView: UIViewController{
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotoCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        return tableView
    }()
    
    var navigation: UINavigationController {
        let navigation = UINavigationController(rootViewController: self)
        return navigation
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.drawSelf()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.drawSelf()
    }
    
    private func drawSelf() {
        self.setupTableView()
    }
    
    @objc func goToGallery(){
        let gallery = PhotosViewController()
        self.navigation.pushViewController(gallery, animated: true)
//        navigationController?.pushViewController(gallery, animated: true)
        print("работает?")
    }
    
    private func setupTableView() {
        
//        self.addSubview(self.tableView)
        self.view.addSubview(self.tableView)
        
        let topConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([topConstraint,
                                     leadingConstraint,
                                     trailingConstraint,
                                     bottomConstraint
                                    ])
    }
}
