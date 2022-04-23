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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSetup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(updateAtTimer), userInfo: .none, repeats: false)
    }
    
    @objc func updateAtTimer(){
        self.delegate?.updateTable()
    }
    
    private func viewSetup(){
        self.view.backgroundColor = .green
    }
}

extension ProfileViewController: TableUpdateDelegateProtocol {
    func updateTable() {
        self.postView.tableView.reloadData()
    }
}
