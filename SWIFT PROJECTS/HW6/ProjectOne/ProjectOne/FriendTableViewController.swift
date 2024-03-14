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
  private var fileCache = FileCache()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setViews()
    fetchFriends()
    setNavigation()
    setRefresh()
    friends = fileCache.fetchFriends()
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
    cell.tap = { [weak self] text, photo in
      self?.navigationController?.pushViewController(ProfileViewController(name: text, photo: photo, isUserProfile: false), animated: true)
    }
    return cell
  }
}

extension FriendTableViewController {
  func setViews() {
    navigationController?.navigationBar.prefersLargeTitles = true
    tableView.register(FriendCell.self, forCellReuseIdentifier: "Cell")
  }
  
  func fetchFriends() {
    networkService.getFriends { [weak self] result in
      switch result {
      case .success(let friends):
        self?.friends = friends
        self?.fileCache.addFriends(friends: friends)
        DispatchQueue.main.async {
          self?.tableView.reloadData()
        }
      case .failure(_):
        self?.friends = self?.fileCache.fetchFriends() ?? []
      }
    }
  }
  
  func setNavigation() {
    let image = UIImage(systemName: "person")
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(buttonTapped))
  }
  
  func setRefresh() {
    refreshControl = UIRefreshControl()
    refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
  }
  
  @objc func buttonTapped() {
    let animation = CATransition()
    animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    animation.type = .reveal
    animation.duration = 3
    navigationController?.view.layer.add(animation, forKey: nil)
    navigationController?.pushViewController(ProfileViewController(isUserProfile: true), animated: false)
  }
  
  @objc func update() {
    networkService.getFriends { [weak self] result in
      switch result {
      case .success(let friends):
        self?.friends = friends
        self?.fileCache.addFriends(friends: friends)
        DispatchQueue.main.async {
          self?.tableView.reloadData()
        }
      case .failure(_):
        self?.friends = self?.fileCache.fetchFriends() ?? []
        DispatchQueue.main.async {
          self?.showAlert()
        }
      }
      DispatchQueue.main.async {
        self?.refreshControl?.endRefreshing()
      }
    }
  }
}

extension FriendTableViewController {
  func showAlert() {
    let date = DateHelper.getDate(date: fileCache.fetchFriendDate())
    let alert = UIAlertController(
      title: "Не удалось получить данные",
      message: "Данные актуальны на \(date)",
      preferredStyle: .alert
    )
    let action = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
}


