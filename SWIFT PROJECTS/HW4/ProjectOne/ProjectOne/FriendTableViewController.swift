//
//  FriendTableViewController.swift
//  ProjectOne
//
//  Created by Леонид Турко on 27.02.2024.
//

import UIKit

final class FriendTableViewController: UITableViewController {
  
  private let networkService = NetworkService()
  private var friends: FriendsModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Friends"
    setViews()
    fetchData()
    setDelegates()
  }
}

extension FriendTableViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let allFriends = friends?.response.items else { return 0 }
    return allFriends.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FriendCell else { return UITableViewCell() }
    guard let friend = friends?.response.items[indexPath.row] else { return UITableViewCell() }
    cell.configure(friend: friend)
    return cell
  }
}

extension FriendTableViewController {
  func setViews() {
    tableView.register(FriendCell.self, forCellReuseIdentifier: "Cell")
  }
  
  func setDelegates() {
    networkService.delegate = self
  }
  
  func fetchData() {
    networkService.getFriends()
  }
}

extension FriendTableViewController: NetworkServiceDelegate {
  func update(friends: FriendsModel) {
    DispatchQueue.main.async {
      self.friends = friends
      self.tableView.reloadData()
    }
  }
  
  func update(groups: GroupsModel) {
  }
}
