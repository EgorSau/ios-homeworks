//
//  TabBarController.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 14.02.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        enum Index {
            case none
            case first
            case second
            
            var title: String? {
                switch self {
                case .none:
                    return nil
                case .first:
                    return "Лента пользователя"
                case .second:
                    return "Профиль"
                }
            }
            var image: String {
                switch self {
                case .none:
                    return ""
                case .first:
                    return "list.bullet.circle.fill"
                case .second:
                    return "person.circle"
                }
            }
        }

        var arrayVC: [UIViewController] = [FeedVC(), ProfileViewController()]
        
        arrayVC[0] = UINavigationController(rootViewController: FeedVC())
        
        self.viewControllers = arrayVC.map({ tabBarItem in
            switch tabBarItem {
            case FeedVC():
                return UINavigationController(rootViewController: FeedVC())
            case ProfileViewController():
                return ProfileViewController()
            default:
                break
            }
            return tabBarItem
        })
        
        arrayVC.enumerated().forEach({ (index, viewController) in
            switch index {
            case 0:
                viewController.tabBarItem.image = UIImage(systemName: Index.first.image)
                viewController.tabBarItem.title = Index.first.title
            case 1:
                viewController.tabBarItem.image = UIImage (systemName: Index.second.image)
                viewController.tabBarItem.title = Index.second.title
            default:
                viewController.tabBarItem.title = Index.none.title
            }
        })
    }
}
