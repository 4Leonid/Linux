//
//  GroupTableViewController.swift
//  ProjectOne
//
//  Created by Леонид Турко on 27.02.2024.
//

import UIKit

final class GroupTableViewController: UITableViewController {
  
  private let networkService = NetworkService()
  private var groups: [Group] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Groups"
    setViews()
    fetchData()
  }
}

extension GroupTableViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    groups.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? GroupCell else { return UITableViewCell() }
    let group = groups[indexPath.row]
    cell.configure(group: group)
    return cell
  }
}

extension GroupTableViewController {
  func setViews() {
    tableView.register(GroupCell.self, forCellReuseIdentifier: "Cell")
  }
  
  func fetchData() {
    networkService.getGroups { [weak self] groups in
      self?.groups = groups
      DispatchQueue.main.async {
        self?.tableView.reloadData()
      }
    }
  }
}
