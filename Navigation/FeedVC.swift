
//  FeedVC.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 11.02.2022.
//

import UIKit

class FeedVC: UIViewController {

    struct Post {
        
        var title: String

    }

    let postObject = Post (title: "Приветики-конфетики")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.buttonSetup()
    }
    
    private func buttonSetup(){
        let postButton = UIButton(frame: CGRect(x: 30, y: 770, width: 370, height: 50))
        postButton.backgroundColor = .systemBlue
        postButton.layer.cornerRadius = 12
        postButton.setTitleColor(.white, for: .normal)
        postButton.setTitle("Просмотреть посты", for: .normal)
        postButton.addTarget(self, action: #selector(moveToPostView), for: .touchUpInside)
        self.view.addSubview(postButton)
    }
    
    @objc private func moveToPostView () {
        let postVC = PostVC()
        navigationController?.pushViewController(postVC, animated: true)
        postVC.postVCTitle = self.postObject.title
    }
    
}
