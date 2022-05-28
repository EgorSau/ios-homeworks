//
//  PostDetailsViewController.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 10.04.2022.
//

import UIKit

protocol TableUpdateDelegateProtocol: AnyObject {
    func updateTable()
}

class PostDetailsViewController: UIViewController {
    
    weak var delegate: TableUpdateDelegateProtocol?
        
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
        likesLabel.isUserInteractionEnabled = true
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
        postImage.translatesAutoresizingMaskIntoConstraints = false
        return postImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupStack()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(updateAtTimer), userInfo: .none, repeats: false)
    }
    
    @objc func updateAtTimer(){
        self.delegate?.updateTable()
    }
    
    private func setupView(){
        self.view.backgroundColor = .init(white: 1, alpha: 0.9)
        self.view.addSubview(backView)
        
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = self.backView.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor)
    
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
        
        // констрейнт картинки
        let heightPostImageConstraint = self.postImage.heightAnchor.constraint(equalToConstant: 400)
        
        // констрейнт тайтл-лейбла
        let leadingTitleLabelConstraint = self.titleLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        
        // констрейнт пост-лейбла
        let leadingPostLabelConstraint = self.postLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        
        // констрейнт картинки
        let leadingImageConstraint = self.postImage.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        
        // констрейнт лайк-стека
        let bottomLikeStackConstraint = self.likesStack.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -16)

        // констрейнт стэка
        let topPostStackConstraint = self.postStack.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 16)
        let trailingPostStackConstraint = self.postStack.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)

        NSLayoutConstraint.activate([
                                    topPostStackConstraint,
                                    trailingPostStackConstraint,
                                    heightPostImageConstraint,
                                    leadingTitleLabelConstraint,
                                    leadingPostLabelConstraint,
                                    leadingImageConstraint,
                                    bottomLikeStackConstraint
                                    ])
    }
}

extension ProfileViewController: TableUpdateDelegateProtocol {
    func updateTable() {
//        self.profileView.reloadData()
    }
}
