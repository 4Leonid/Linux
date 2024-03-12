//
//  SecondTableViewController.swift
//  ProjectOne
//
//  Created by Леонид Турко on 27.02.2024.
//

import UIKit

final class SecondTableViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    tableView.backgroundColor = .white
    navigationController?.navigationBar.tintColor = .black
    navigationController?.navigationBar.barTintColor = .white
  }
}

extension SecondTableViewController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    5
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    SecondCustomCell()
  }
}
