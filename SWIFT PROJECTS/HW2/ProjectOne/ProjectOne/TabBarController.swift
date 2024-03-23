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
    
    let firstVC = FirstTableViewController()
    firstVC.tabBarItem.title = "Friends"
    firstVC.tabBarItem.image = UIImage(systemName: "person")
    firstVC.navigationItem.title = "Friends"
    
    
    let secondVC = SecondTableViewController()
    secondVC.tabBarItem.title = "Groups"
    secondVC.tabBarItem.image = UIImage(systemName: "person.3")
    
    let layout = UICollectionViewFlowLayout()
    let thirdVC = CollectionViewController(collectionViewLayout: layout)
    thirdVC.tabBarItem.title = "Photos"
    thirdVC.tabBarItem.image = UIImage(systemName: "photo.fill")
    
    viewControllers = [firstVC, secondVC, thirdVC]
  }
}
