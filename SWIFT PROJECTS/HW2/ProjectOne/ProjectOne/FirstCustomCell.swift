//
//  FirstCustomCell.swift
//  ProjectOne
//
//  Created by Леонид Турко on 27.02.2024.
//

import UIKit

final class FirstCustomCell: UITableViewCell {
  
  private lazy var image: UIImageView = {
    let image = UIImage(systemName: "person")
    let element = UIImageView()
    element.image = image
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
    element.text = "Text 1"
    element.textColor = .black
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
  
  private lazy var twoLabel: UILabel = {
    let element = UILabel()
    element.text = "Text 2"
    element.textColor = .black
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  private lazy var threeLabel: UILabel = {
    let element = UILabel()
    element.text = "Text 3"
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

private extension FirstCustomCell {
  func setViews() {
    addSubview(image)
    addSubview(nameLabel)
    addSubview(stackView)
//    stackView.addArrangedSubview(oneLabel)
//    stackView.addArrangedSubview(twoLabel)
//    stackView.addArrangedSubview(threeLabel)
  }
  
  func setConstraints() {
    NSLayoutConstraint.activate([
      image.centerYAnchor.constraint(equalTo: centerYAnchor),
      image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      image.widthAnchor.constraint(equalToConstant: 50),
      image.heightAnchor.constraint(equalTo: image.widthAnchor),
      
      nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      nameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
      nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
    ])
  }
}
