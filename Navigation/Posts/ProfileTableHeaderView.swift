//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 11.03.2022.
//

import UIKit

class ProfileTableHeaderView: UIView {
    
    var dataSource: [Post.PostModel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadDataToDataSource(fromModel: Post())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadDataToDataSource(fromModel: Post){
        fromModel.addPostsIntoArray()
        self.dataSource = fromModel.postArray
    }
}
