//
//  MainTabBarVC.swift
//  TwitterClone
//
//  Created by Haytham on 26/07/2023.
//

import UIKit

class MainTabBarVC: UITabBarController {
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
     
        let vc1 = UINavigationController(rootViewController: HomeVC())
        let vc2 = UINavigationController(rootViewController: SearchVC())
        let vc3 = UINavigationController(rootViewController: NotificationVC())
        let vc4 = UINavigationController(rootViewController: DirectMessagesVC())
        
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        vc3.tabBarItem.image = UIImage(systemName: "bell")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "bell.fill")
        
        vc4.tabBarItem.image = UIImage(systemName: "envelope")
        vc4.tabBarItem.selectedImage = UIImage(systemName: "envelope.fill")
        
        setViewControllers([vc1,vc2,vc3,vc4], animated: true)
    }
    
    
    
}
