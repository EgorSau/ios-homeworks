//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 12.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    struct ViewModel: ViewModelProtocol {
        let author: String
        let description: String
        let image: String
        var likes: Int
        var views: Int
    }
    
    private lazy var backView: UIView = {
       let backView = UIView()
        backView.clipsToBounds = true
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }()
    
    private lazy var postStack: UIStackView = {
        let postStack = UIStackView()
        postStack.axis = .vertical
        postStack.spacing = 16
        postStack.translatesAutoresizingMaskIntoConstraints = false
        return postStack
    }()
    
    private lazy var likesStack: UIStackView = {
        let likesStack = UIStackView()
        likesStack.axis = .horizontal
//        likesStack.alignment = .center
        likesStack.translatesAutoresizingMaskIntoConstraints = false
        return likesStack
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var postLabel: UILabel = {
        let postLabel = UILabel()
        postLabel.font = .systemFont(ofSize: 14, weight: .regular)
        postLabel.textColor = .systemGray
        postLabel.numberOfLines = 0
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        return postLabel
    }()
    
    lazy var likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.font = .systemFont(ofSize: 16, weight: .regular)
        likesLabel.textColor = .black
        likesLabel.textAlignment = .left
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        return likesLabel
    }()
    
    lazy var viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.font = .systemFont(ofSize: 16, weight: .regular)
        viewsLabel.textColor = .black
        viewsLabel.textAlignment = .right
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsLabel
    }()
    
    lazy var postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.contentMode = .scaleAspectFit
        postImage.backgroundColor = .black
//        postImage.clipsToBounds = true
//        postImage.layer.masksToBounds = true
        postImage.translatesAutoresizingMaskIntoConstraints = false
        return postImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        
        self.contentView.addSubview(backView)
        
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
    
        NSLayoutConstraint.activate([topConstraint,
                                     leadingConstraint,
                                     trailingConstraint,
                                     bottomConstraint
                                    ])
    }
   
    private func setupStack(){
        self.backView.addSubview(postStack)
        self.postStack.addArrangedSubview(titleLabel)
        self.postStack.addArrangedSubview(postImage)
        self.postStack.addArrangedSubview(postLabel)
        self.postStack.addArrangedSubview(likesStack)
        self.likesStack.addArrangedSubview(likesLabel)
        self.likesStack.addArrangedSubview(viewsLabel)
        
//        let topPostImageConstraint = self.postStack.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor)
        let heightPostImageConstraint = self.postImage.heightAnchor.constraint(equalToConstant: 400)
//        let heightPostImageConstraint = self.postImage.heightAnchor.constraint(equalTo: self.postStack.heightAnchor, multiplier: 1.0)
//        let widthPostImageConstraint = self.postStack.widthAnchor.constraint(equalTo: self.postStack.widthAnchor)
//        let leadingPostImageConstraint = self.postStack.leadingAnchor.constraint(equalTo: self.postStack.leadingAnchor)
//        let trailingPostImageConstraint = self.postStack.trailingAnchor.constraint(equalTo: self.postStack.trailingAnchor)
//        let bottomPostImageConstraint = self.postStack.bottomAnchor.constraint(equalTo: self.postLabel.topAnchor)
        
        let topPostStackConstraint = self.postStack.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 16)
        let leadingPostStackConstraint = self.postStack.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        let trailingPostStackConstraint = self.postStack.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        let bottomPostStackConstraint = self.postStack.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)
//
//        let topLikesStackConstraint = self.likesStack.topAnchor.constraint(equalTo: self.postStack.topAnchor)
//        let leadingLikesStackConstraint = self.likesStack.leadingAnchor.constraint(equalTo: self.postStack.leadingAnchor)
//        let trailingLikesStackConstraint = self.likesStack.trailingAnchor.constraint(equalTo: self.postStack.trailingAnchor)
//        let bottomLikesStackConstraint = self.likesStack.bottomAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16)
//
        NSLayoutConstraint.activate([
                                    topPostStackConstraint,
                                    leadingPostStackConstraint,
                                    trailingPostStackConstraint,
                                    bottomPostStackConstraint,
//                                     topLikesStackConstraint,
//                                     leadingLikesStackConstraint,
//                                     trailingLikesStackConstraint,
//                                     bottomLikesStackConstraint,
                                    heightPostImageConstraint,
//                                    widthPostImageConstraint,
//                                    leadingPostImageConstraint,
//                                    trailingPostImageConstraint,
//                                    topPostImageConstraint,
//                                    bottomPostImageConstraint
                                    ])
        
//        let postLabelLeadingConstraint = self.postLabel.leadingAnchor.constraint(equalTo: self.postStack.leadingAnchor, constant: 16)
        
    }
    
//    private func setupLikesStack(){
//        self.postStack.addArrangedSubview(likesStack)
//        self.likesStack.addArrangedSubview(likesLabel)
//        self.likesStack.addArrangedSubview(viewsLabel)
//        
//        let topConstraint = self.likesStack.topAnchor.constraint(equalTo: self.backView.topAnchor)
//        let leadingConstraint = self.likesStack.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
//        let trailingConstraint = self.likesStack.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
//        let bottomConstraint = self.likesStack.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)
//        
//        NSLayoutConstraint.activate([topConstraint,
//                                     leadingConstraint,
//                                     trailingConstraint,
//                                     bottomConstraint
//                                    ])
//    }
}


//  между заголовком и картинкой 12пт
// после лайков 16пт
