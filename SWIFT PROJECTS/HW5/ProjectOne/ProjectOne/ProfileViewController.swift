//
//  ProfileViewController.swift
//  ProjectOne
//
//  Created by Леонид Турко on 10.03.2024.
//

import UIKit

final class ProfileViewController: UIViewController {
  
  private var networkService = NetworkService()
  
  private lazy var profileImageView: UIImageView = {
    let element = UIImageView()
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  private lazy var nameLabel: UILabel = {
    let element = UILabel()
    element.numberOfLines = 0
    element.textAlignment = .center
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  
  init(name: String? = nil, photo: UIImage? = nil) {
    super.init(nibName: nil, bundle: nil)
    nameLabel.text = name
    profileImageView.image = photo
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupViews()
    setupConstraints()
    fetchProfile()
  }
  
  func updateData(model: User?) {
    guard let model else { return }
    DispatchQueue.global().async {
      guard let url = URL(string: model.photo ?? ""),
            let data = try? Data(contentsOf: url) else { return }
      
      DispatchQueue.main.async {
        self.profileImageView.image = UIImage(data: data)
      }
    }
    DispatchQueue.main.async {
      self.nameLabel.text = (model.firstName ?? "") + " " + (model.lastName ?? "")
    }
  }
  
  private func fetchProfile() {
    networkService.getProfileInfo { [weak self] user in
      self?.updateData(model: user)
    }
  }
  
  private func setupViews() {
    view.addSubview(profileImageView)
    view.addSubview(nameLabel)
  }
  
  private func setupConstraints() {
    
    NSLayoutConstraint.activate([
      profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
      profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      profileImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor),
      
      nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30),
    ])
  }
}
