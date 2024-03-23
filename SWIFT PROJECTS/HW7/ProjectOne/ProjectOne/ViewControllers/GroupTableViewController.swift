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
  private var fileCache = FileCache()
  
  override func viewDidLoad() {
    super.viewDidLoad()
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
    networkService.getGroups { [weak self] result in
      switch result {
      case .success(let groups):
        self?.groups = groups
        self?.fileCache.addGroups(groups: groups)
        DispatchQueue.main.async {
          self?.tableView.reloadData()
        }
      case .failure(_):
        self?.groups = self?.fileCache.fetchGroups() ?? []
        DispatchQueue.main.async {
          self?.showAlert()
        }
      }
    }
  }
}

extension GroupTableViewController {
  func showAlert() {
    let date = DateHelper.getDate(date: fileCache.fetchGroupDate())
    let alert = UIAlertController(
      title: "Не удалось получить данные",
      message: "Данные актуальны на \(date)",
      preferredStyle: .alert
    )
    alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }
}
