//
//  FriendCell.swift
//  ProjectOne
//
//  Created by Леонид Турко on 27.02.2024.
//

import UIKit

final class FriendCell: UITableViewCell {
  
  var tap: ((String?, UIImage?) -> Void)?
  
  private lazy var friendImage: UIImageView = {
    let image = UIImage(systemName: "person")
    let element = UIImageView()
    element.image = image
    element.layer.cornerRadius = 25
    element.clipsToBounds = true 
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  private lazy var onlineCircle: UIView = {
    let element = UIView()
    element.backgroundColor = .gray
    element.layer.cornerRadius = 10
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  private lazy var stackView: UIStackView = {
    let element = UIStackView()
    element.distribution = .fillEqually
    element.axis = .vertical
    element.spacing = 10
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  
  private lazy var nameLabel: UILabel = {
    let element = UILabel()
    element.text = "Name"
    element.textColor = .black
    element.font = .systemFont(ofSize: 40)
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setViews()
    setConstraints()
    setGesture()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(friend: Friend) {
    nameLabel.text = (friend.firstName ?? "") + " " + (friend.lastName ?? "")
    
    if let online = friend.online {
      let isOnline = online == 1
      if isOnline {
        onlineCircle.backgroundColor = .green
      } else {
        onlineCircle.backgroundColor = .red
      }
    }
    
    DispatchQueue.global().async {
      guard let url = URL(string: friend.photo ?? ""),
            let data = try? Data(contentsOf: url) else { return }
      
      DispatchQueue.main.async {
        self.friendImage.image = UIImage(data: data)
      }
    }
  }
}

private extension FriendCell {
  func setViews() {
    addSubview(friendImage)
    addSubview(nameLabel)
    addSubview(stackView)
    friendImage.addSubview(onlineCircle)
  }
  
  func setConstraints() {
    NSLayoutConstraint.activate([
      friendImage.centerYAnchor.constraint(equalTo: centerYAnchor),
      friendImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      friendImage.widthAnchor.constraint(equalToConstant: 50),
      friendImage.heightAnchor.constraint(equalTo: friendImage.widthAnchor),
      
      onlineCircle.widthAnchor.constraint(equalToConstant: 20),
      onlineCircle.heightAnchor.constraint(equalTo: onlineCircle.widthAnchor),
      onlineCircle.bottomAnchor.constraint(equalTo: friendImage.bottomAnchor),
      onlineCircle.trailingAnchor.constraint(equalTo: friendImage.trailingAnchor, constant: 10),
      
      nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      nameLabel.leadingAnchor.constraint(equalTo: friendImage.trailingAnchor, constant: 10),
      nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
    ])
  }
  
  func setGesture() {
    let recognizer = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
  }
  
  @objc func cellTapped() {
    tap?(nameLabel.text, friendImage.image)
  }
}
