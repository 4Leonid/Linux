//
//  TabBarController.swift
//  ProjectOne
//
//  Created by Леонид Турко on 27.02.2024.
//

import UIKit

final class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setViews()
  }
}

extension TabBarController {
  func setViews() {
    let friendVC = UINavigationController(rootViewController: FriendTableViewController())
    friendVC.navigationItem.title = "Friends"
    
    friendVC.tabBarItem.title = "Friends"
    friendVC.navigationItem.title = "Friends"
    friendVC.tabBarItem.image = UIImage(systemName: "person")
    friendVC.navigationBar.prefersLargeTitles = true
    
    
    let groupVC = UINavigationController(rootViewController: GroupTableViewController())
    groupVC.tabBarItem.title = "Groups"
    groupVC.navigationItem.title = "Groups"
    groupVC.tabBarItem.image = UIImage(systemName: "person.3")
    groupVC.navigationBar.prefersLargeTitles = true
    
    let layout = UICollectionViewFlowLayout()
    let thirdVC = UINavigationController(rootViewController: PhotoCollectionViewController(collectionViewLayout: layout))
    
    thirdVC.tabBarItem.title = "Photos"
    thirdVC.navigationItem.title = "Photos"
    thirdVC.tabBarItem.image = UIImage(systemName: "photo.fill")
    thirdVC.navigationBar.prefersLargeTitles = true
    
    viewControllers = [friendVC, groupVC, thirdVC]
  }
}
