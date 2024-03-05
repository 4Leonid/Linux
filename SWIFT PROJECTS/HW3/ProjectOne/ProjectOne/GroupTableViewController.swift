//
//  GroupTableViewController.swift
//  ProjectOne
//
//  Created by Леонид Турко on 27.02.2024.
//

import UIKit

final class GroupTableViewController: UITableViewController {
  
  private let networkService = NetworkService()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Groups"
    networkService.getGroups()
  }
}

extension GroupTableViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    5
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    GroupCell()
  }
}
