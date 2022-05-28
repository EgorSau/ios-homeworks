//
//  CustomHeaderView.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 25.05.2022.
//

import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {
    
    let headerHeight: CGFloat = 290
    let photoHeight: CGFloat = 150
    
    private lazy var headerView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        
        self.addSubview(self.headerView)
        
        let topConstraint = self.headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let trailingConstraint = self.headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let heightConstraint = self.headerView.heightAnchor.constraint(equalToConstant: self.headerHeight)
        
        NSLayoutConstraint.activate([
                                    topConstraint,
                                    leadingConstraint,
                                    trailingConstraint,
                                    heightConstraint
                                    ])
    }
}
