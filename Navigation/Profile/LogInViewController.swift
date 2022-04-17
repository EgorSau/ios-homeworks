//
//  LogInViewController.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 28.02.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    let tapGesture = UITapGestureRecognizer()
    
    lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.isUserInteractionEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        var contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
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
        textField.tintColor = UIColor.systemBlue
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
        textField.tintColor = UIColor.systemBlue
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
        self.setupScrollView()
        self.setupContentView()
        self.setupLogo()
        self.setupStack()
        self.setupButton()
        self.KbdNotificatorAppearance()
        self.setupGesture()
    }
    
    deinit {
        self.KbdNotificatorRemove()
    }
    
    private func setupGesture(){
         self.scrollView.addGestureRecognizer(self.tapGesture)
         self.tapGesture.addTarget(self, action: #selector(self.tapForKbd))
     }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.logo.bounds.size.width = 100.0
        self.logo.bounds.size.height = 100.0
    }
    
    func KbdNotificatorAppearance() {
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(self.kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(self.kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
        
    func KbdNotificatorRemove() {
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.scrollView.contentOffset = CGPoint(x: 0, y: kbdSize.height/2)
            self.scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0,left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc func tapForKbd (_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGesture === gestureRecognizer else { return }
        self.passTextField.resignFirstResponder()
        self.emailPhoneTextField.resignFirstResponder()
    }
    
    @objc private func kbdHide(notification: NSNotification) {
        self.scrollView.contentOffset = .zero
        self.scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func setupView(){
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupScrollView() {
        self.view.addSubview(scrollView)
        
        let topConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([topConstraint,
                                     leadingConstraint,
                                     trailingConstraint,
                                     bottomConstraint
                                    ])
    }
    
    private func setupContentView() {
        self.scrollView.addSubview(contentView)
        
        let topConstraint = self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        let centerX = self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let bottomConstraint = self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        let width = self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
        let height = self.contentView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        
        NSLayoutConstraint.activate([topConstraint,
                                     centerX,
                                     bottomConstraint,
                                     width,height
                                    ])
    }
    
    private func setupLogo() {
        self.contentView.addSubview(logo)
        
        let topConstraint = self.logo.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120)
        topConstraint.priority = UILayoutPriority(999)
        let centerX = self.logo.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let width = self.logo.widthAnchor.constraint(equalToConstant: 100)
        let height = self.logo.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([topConstraint,
                                     centerX,
                                     width,
                                     height,
                                    ])
    }
    
    private func setupStack(){
        self.contentView.addSubview(stackView)
        self.stackView.addArrangedSubview(emailPhoneTextField)
        self.stackView.addArrangedSubview(passTextField)
        
        let topConstraint = self.stackView.topAnchor.constraint(equalTo: self.logo.bottomAnchor, constant: 120)
        let centerY = self.stackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let heightConstraint = self.stackView.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([topConstraint,
                                     trailingConstraint,
                                     leadingConstraint,
                                     heightConstraint,
                                     centerY
                                    ])
    }
    
    private func setupButton(){
        self.contentView.addSubview(self.logInButton)
        self.logInButton.layer.cornerRadius = 10
        self.logInButton.clipsToBounds = true
        let pixel = UIImage(named: "blue_pixel.png")
        self.logInButton.setBackgroundImage(pixel, for: .normal)
        self.logInButton.setTitle("Log in", for: .normal)
        self.logInButton.setTitleColor(.white, for: .normal)
        self.logInButton.addTarget(.none, action: #selector(buttonPressed), for: .touchUpInside)
        if self.logInButton.isSelected || self.logInButton.isHighlighted || self.logInButton.isEnabled == false {
            self.logInButton.alpha = 0.8
        } else {
            self.logInButton.alpha = 1.0
        }
        
        let topConstraint = self.logInButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16)
        let trailingConstraint = self.logInButton.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor)
        let leadingConstraint = self.logInButton.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor)
        let heightConstraint = self.logInButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([topConstraint,
                                     trailingConstraint,
                                     leadingConstraint,
                                     heightConstraint,
                                    ])
    }
    
    @objc private func buttonPressed(){
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
        viewDidDisappear(true)
        self.passTextField.resignFirstResponder()
        self.emailPhoneTextField.resignFirstResponder()
    }
}
