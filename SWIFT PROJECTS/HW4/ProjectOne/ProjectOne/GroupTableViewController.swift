//
//  GroupTableViewController.swift
//  ProjectOne
//
//  Created by Леонид Турко on 27.02.2024.
//

import UIKit

final class GroupTableViewController: UITableViewController {
  
  private let networkService = NetworkService()
  private var groupModel: GroupsModel? 
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Groups"
    setViews()
    fetchData()
    setDelegates()
  }
}

extension GroupTableViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let groups = groupModel?.response.items else { return 0 }
    return groups.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? GroupCell else { return UITableViewCell() }
    guard let group = groupModel?.response.items[indexPath.row] else { return UITableViewCell() }
    cell.configure(group: group)
    return cell
  }
}

extension GroupTableViewController: NetworkServiceDelegate {
  func update(friends: FriendsModel) {
    
  }
  
  func update(groups: GroupsModel) {
    DispatchQueue.main.async {
      self.groupModel = groups
      self.tableView.reloadData()
    }
  }
  
  
}

extension GroupTableViewController {
  func setViews() {
    tableView.register(GroupCell.self, forCellReuseIdentifier: "Cell")
  }
  
  func fetchData() {
    networkService.getGroups()
  }
  
  func setDelegates() {
    networkService.delegate = self
  }
}
