//
//  SecondCustomCell.swift
//  ProjectOne
//
//  Created by Леонид Турко on 27.02.2024.
//

import UIKit

final class SecondCustomCell: UITableViewCell {
  
  private lazy var groupImage: UIImageView = {
    let element = UIImageView()
    let image = UIImage(systemName: "person.3")
    element.image = image
    element.contentMode = .scaleAspectFit
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
  
  private lazy var oneLabel: UILabel = {
    let element = UILabel()
    element.text = "Name"
    element.textColor = .black
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  private lazy var twoLabel: UILabel = {
    let element = UILabel()
    element.text = "Description"
    element.textColor = .black
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setViews()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

private extension SecondCustomCell {
  func setViews() {
    addSubview(groupImage)
    addSubview(stackView)
    stackView.addArrangedSubview(oneLabel)
    stackView.addArrangedSubview(twoLabel)
  }
  
  func setConstraints() {
    NSLayoutConstraint.activate([
      groupImage.centerYAnchor.constraint(equalTo: centerYAnchor),
      groupImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      groupImage.widthAnchor.constraint(equalToConstant: 50),
      groupImage.heightAnchor.constraint(equalTo: groupImage.widthAnchor),
      
      stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
      stackView.leadingAnchor.constraint(equalTo: groupImage.trailingAnchor, constant: 10),
      stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
    ])
  }
}
