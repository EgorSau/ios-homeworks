//
//  PhotoDetailsViewController.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 09.04.2022.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    
    private var height: CGFloat = 80
    private var heightConstraint: NSLayoutConstraint?
    private var isExpanded = false
    private let exitTapGestureRecognizer = UITapGestureRecognizer()
    private let imageTapGestureRecognizer = UITapGestureRecognizer()
    
    lazy var photoImageView: UIView = {
        let photoImageView = UIView()
        photoImageView.backgroundColor = .white
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.isUserInteractionEnabled = true
        return photoImageView
    }()
    
    private lazy var exitImageView: UIImageView = {
        var exitImageView = UIImageView()
        let exitImage = UIImage(systemName: "xmark.circle.fill")
        exitImageView.image = exitImage
        exitImageView.tintColor = .black
        exitImageView.layer.masksToBounds = true
        exitImageView.isUserInteractionEnabled = true
        exitImageView.alpha = 0
        exitImageView.isHidden = true
        exitImageView.translatesAutoresizingMaskIntoConstraints = false
        return exitImageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSetup()
        self.setupPhotoView()
        self.exitSetup()
        self.setupGesture()
    }
    
    private func viewSetup(){
        self.view.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    private func setupPhotoView(){
        self.view.addSubview(photoImageView)
        
        //Constraints
        let imageViewAspectRatio = self.photoImageView.heightAnchor.constraint(equalTo: self.photoImageView.widthAnchor, multiplier: 1.0)
        let right = self.photoImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let left = self.photoImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let centerY = self.photoImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        let centerX = self.photoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)

        NSLayoutConstraint.activate([
                                    imageViewAspectRatio,
                                    right,
                                    left,
                                    centerY,
                                    centerX
                                    ])
    }
    
    private func exitSetup(){
        self.view.addSubview(exitImageView)
        
        //Constraints
        let top = self.exitImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let right = self.exitImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let height = self.exitImageView.heightAnchor.constraint(equalToConstant: 40)
        let width = self.exitImageView.widthAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([top,
                                     right,
                                     height,
                                     width
                                    ])
    }
    
    func setupGesture(){
        self.exitImageView.addGestureRecognizer(self.exitTapGestureRecognizer)
        self.photoImageView.addGestureRecognizer(self.imageTapGestureRecognizer)
        self.exitTapGestureRecognizer.addTarget(self, action: #selector(self.exitHandleTapGesture))
        self.imageTapGestureRecognizer.addTarget(self, action: #selector(self.imageHandleTapGesture))
        self.exitImageView.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0.0) {
            self.exitImageView.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func exitHandleTapGesture(_ gestureRecognizer: UITapGestureRecognizer){
        guard self.exitTapGestureRecognizer === gestureRecognizer else { return }
        self.isExpanded.toggle()
        if self.isExpanded {
            UIView.animate(withDuration: 0.5, delay: 0.0) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc private func imageHandleTapGesture(_ gestureRecognizer: UITapGestureRecognizer){
        guard self.imageTapGestureRecognizer === gestureRecognizer else { return }

    }
}
