//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 20.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    var counter1: Int = 0
    var counter2: Int = 0
    var counter3: Int = 0
    var counter4: Int = 0
    
    func viewsCounter(for cell: IndexPath) -> Int {
        switch cell.row {
        case 1 :
            self.counter1 += 1
            return self.counter1
        case 2 :
            self.counter2 += 1
            return self.counter2
        case 3 :
            self.counter3 += 1
            return self.counter3
        case 4 :
            self.counter4 += 1
            return self.counter4
        default: break
        }
        return 0
    }
    
    lazy var profileView: UITableView = {
        let profileView = UITableView(frame: .zero, style: .grouped)
        profileView.rowHeight = UITableView.automaticDimension
        profileView.estimatedRowHeight = 44
        profileView.dataSource = self
        profileView.delegate = self
        profileView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotoCell")
        profileView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        profileView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        profileView.translatesAutoresizingMaskIntoConstraints = false
        return profileView
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

        self.view.addSubview(self.profileView)
        
        let topPhotoConstraint = self.profileView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingPhotoConstraint = self.profileView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingPhotoConstraint = self.profileView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let heightPhotoConstraint = self.profileView.heightAnchor.constraint(equalToConstant: 440)
        let bottomTableConstraint = self.profileView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([
                                    bottomTableConstraint,
                                    topPhotoConstraint,
                                    leadingPhotoConstraint,
                                    trailingPhotoConstraint,
                                    heightPhotoConstraint
                                    ])
    }
}
