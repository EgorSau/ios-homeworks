//
//  LogInViewController.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 28.02.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
//    lazy var color: UIColor = {
//        let color = UIColor(red: 72, green: 133, blue: 204, alpha: 1)
//        return color
//    }()
    
    lazy var logo: UIImageView = {
        var logo = UIImageView()
        var logoVK = UIImage(named: "logo.png")
        logo.image = logoVK
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    lazy var emailPhoneTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.backgroundColor = .systemGray6
//        textField.tintColor = UIColor(red: 72, green: 133, blue: 204, alpha: 0)
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        return textField
    }()
    
    lazy var passTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.backgroundColor = .systemGray6
        //textField.tintColor =
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        return textField
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupLogo()
        self.setupStack()
        self.setupButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.logo.bounds.size.width = 100.0
        self.logo.bounds.size.height = 100.0
    }
    
    private func setupView(){
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupLogo() {
        self.view.addSubview(logo)
        
        let topConstraint = self.logo.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let centerX = self.logo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        NSLayoutConstraint.activate([topConstraint,
                                     centerX
                                    ])
    }
    
    private func setupStack(){
        self.view.addSubview(stackView)
        self.stackView.addArrangedSubview(emailPhoneTextField)
        self.stackView.addArrangedSubview(passTextField)
        
        let topConstraint = self.stackView.topAnchor.constraint(equalTo: self.logo.bottomAnchor)
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let heightConstraint = self.stackView.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([topConstraint,
                                     trailingConstraint,
                                     leadingConstraint,
                                     heightConstraint
                                    ])
    }
    
    private func setupButton(){
        self.view.addSubview(self.logInButton)
        self.logInButton.layer.cornerRadius = 10
        let pixel = UIImage(named: "blue_pixel.png")
        self.logInButton.setBackgroundImage(pixel, for: .normal)
        self.logInButton.setTitle("Log in", for: .normal)
        self.logInButton.setTitleColor(.white, for: .normal)
        self.logInButton.addTarget(.none, action: #selector(buttonPressed), for: .touchUpInside)
        
        let topConstraint = self.logInButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16)
        let trailingConstraint = self.logInButton.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor)
        let leadingConstraint = self.logInButton.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor)
        let heightConstraint = self.logInButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([topConstraint,
                                     trailingConstraint,
                                     leadingConstraint,
                                     heightConstraint
                                    ])
    }
    
    @objc private func buttonPressed(){
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
}

// куда-то делись констрейнты по 120пт у лого
// не слитные поля в стеке по центру
// у кнопки куда-то исчезли радиусы углов 10пт
// не понятно зачем создавать ColorSet с hex
// нормал селект зайлайт дисейбл альфы как настроить?
// не выплывает клавиатура и нет ее настройки
