//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 20.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var buttonTopConstraint: NSLayoutConstraint?
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var profileImageView: UIImageView = {
        var profile = UIImageView()
//        profile.backgroundColor = .systemRed
        let catImage = UIImage(named: "coolCat.jpg")
        profile.image = catImage
//        profile = UIImageView(image: catImage)
        profile.layer.cornerRadius = 85
        profile.layer.borderWidth = 3
        profile.layer.borderColor = UIColor.white.cgColor
        profile.layer.masksToBounds = true
        profile.translatesAutoresizingMaskIntoConstraints = false
        return profile
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 40
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
//        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawSelf() {
        self.backgroundColor = .lightGray
        self.setupStackView()
        self.setupStatusButton()
    }
    
    private func setupStatusButton() {
        
        self.addSubview(self.statusButton)
        
        self.statusButton.backgroundColor = .systemBlue
        self.statusButton.layer.cornerRadius = 4
        self.statusButton.setTitle("Show status", for: .normal)
        self.statusButton.setTitleColor(.white, for: .normal)
        self.statusButton.titleLabel?.shadowColor = .black
        
        // топовая констрейнта батона
        self.buttonTopConstraint = self.statusButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 34)
        self.buttonTopConstraint?.priority = UILayoutPriority(rawValue: 999)
        let leadingConstraint = self.statusButton.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor)
        let trailingConstraint = self.statusButton.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor)
//        let bottomConstraint = self.statusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let heightConstraint = self.statusButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([leadingConstraint,
                                     trailingConstraint,
                                     heightConstraint,
//                                     bottomConstraint,
                                     self.buttonTopConstraint
                                    ].compactMap({ $0 }) )
    }
    
    private func setupNameLabel() {
        
        self.nameLabel.text = "Cool cat"
        self.nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        self.nameLabel.textColor = .black
    }
    
    private func setupStatusLabel() {
        
        self.statusLabel.text = "Waiting for something..."
        self.statusLabel.textColor = .gray
        self.statusLabel.font = .systemFont(ofSize: 14, weight: .regular)
    }
    
    private func setupStackView() {
        
        self.addSubview(stackView)
        self.stackView.addArrangedSubview(self.profileImageView)
        self.stackView.addArrangedSubview(self.labelsStackView)
        self.labelsStackView.addArrangedSubview(self.nameLabel)
        self.labelsStackView.addArrangedSubview(self.statusLabel)
        self.setupNameLabel()
        self.setupStatusLabel()
        
        let topConstraint = self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 27)
//        let bottomConstraint = self.stackView.bottomAnchor.constraint(equalTo: self.stackView.safeAreaLayoutGuide.bottomAnchor)
        
        // ботомная констрейнта стака
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        let imageViewAspectRatio = self.profileImageView.heightAnchor.constraint(equalTo: self.profileImageView.widthAnchor, multiplier: 1.0)
        
        NSLayoutConstraint.activate([
            topConstraint,
//            bottomConstraint,
            leadingConstraint, trailingConstraint, imageViewAspectRatio
                                    ])
        
    }
}
