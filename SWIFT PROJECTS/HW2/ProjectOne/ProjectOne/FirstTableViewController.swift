//
//  FirstTableViewController.swift
//  ProjectOne
//
//  Created by Леонид Турко on 27.02.2024.
//

import UIKit

final class FirstTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension FirstTableViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    5
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    FirstCustomCell()
  }
}
