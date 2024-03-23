//
//  FriendTableViewController.swift
//  ProjectOne
//
//  Created by Леонид Турко on 27.02.2024.
//

import UIKit

final class FriendTableViewController: UITableViewController {
  
  private let networkService = NetworkService()
  private var friends: [Friend] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setViews()
    fetchFriends()
    setNavigation()
  }
}

extension FriendTableViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    friends.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FriendCell else { return UITableViewCell() }
    let friend = friends[indexPath.row]
    cell.configure(friend: friend)
    return cell
  }
}

extension FriendTableViewController {
  func setViews() {
    navigationController?.navigationBar.prefersLargeTitles = true 
    tableView.register(FriendCell.self, forCellReuseIdentifier: "Cell")
  }
  
  func fetchFriends() {
    networkService.getFriends { [weak self] friends in
      self?.friends = friends
      DispatchQueue.main.async {
        self?.tableView.reloadData()
      }
    }
  }
  
  func setNavigation() {
    let image = UIImage(systemName: "person")
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(buttonTapped))
  }
  
  @objc  func buttonTapped() {
    let animation = CATransition()
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animation.type = .reveal
    animation.duration = 3
    navigationController?.view.layer.add(animation, forKey: nil)
    navigationController?.pushViewController(ProfileViewController(), animated: false)
  }
}


