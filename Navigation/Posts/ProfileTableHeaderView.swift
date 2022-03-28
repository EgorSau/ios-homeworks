//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 11.03.2022.
//

import UIKit

class ProfileTableHeaderView: UIView {
    
    var height: CGFloat = 270
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        return tableView
    }()
    
    var dataSource: [Post.PostModel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
        self.loadDataToDataSource(fromModel: Post())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawSelf() {
        self.setupTableView()
    }
    
    func loadDataToDataSource(fromModel: Post){
        fromModel.addPostsIntoArray()
        self.dataSource = fromModel.postArray
    }
    
    private func setupTableView() {
        
        self.addSubview(self.tableView)
        
        let topConstraint = self.tableView.topAnchor.constraint(equalTo: self.topAnchor)
        let leadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let trailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let bottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        NSLayoutConstraint.activate([topConstraint,
                                     leadingConstraint,
                                     trailingConstraint,
                                     bottomConstraint
                                    ])
        
    }
}

extension ProfileTableHeaderView: ProfileViewDelegateProtocol {
    
    func tableHeightUpdate(newHeight: CGFloat) {
        self.tableView.beginUpdates()
        self.height = newHeight
        self.tableView.endUpdates()
        UIView.animate(withDuration: 0.3, delay: 0.0) {
            self.layoutIfNeeded()
        }
    }
}
