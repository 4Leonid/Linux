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
    
    let friendVC = FriendTableViewController()
    let friendNav = UINavigationController(rootViewController: friendVC)
    friendVC.navigationController?.navigationBar.prefersLargeTitles = true
    friendVC.navigationItem.title = "Friends"
    friendVC.tabBarItem.title = "Friends"
    friendVC.tabBarItem.image = UIImage(systemName: "person")
    
    let groupVC = GroupTableViewController()
    let groupNav = UINavigationController(rootViewController: groupVC)
    groupVC.navigationController?.navigationBar.prefersLargeTitles = true
    groupVC.navigationItem.title = "Groups"
    groupVC.tabBarItem.title = "Groups"
    groupVC.tabBarItem.image = UIImage(systemName: "person.3")
    
    let layout = UICollectionViewFlowLayout()
    let thirdVC = PhotoCollectionViewController(collectionViewLayout: layout)
    let thirdNav = UINavigationController(rootViewController: thirdVC)
    thirdVC.navigationItem.title = "Photos"
    thirdVC.tabBarItem.title = "Photos"
    thirdVC.tabBarItem.image = UIImage(systemName: "photo.fill")
    thirdVC.navigationController?.navigationBar.prefersLargeTitles = true
    
    viewControllers = [friendNav, groupNav, thirdNav]
  }
}
