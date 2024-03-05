//
//  PhotoCell.swift
//  ProjectOne
//
//  Created by Леонид Турко on 27.02.2024.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
  
  static let reuseIdentifier = String(describing: PhotoCell.self)
  
  private lazy var personImage: UIImageView = {
    let personImage = UIImage(systemName: "person")
    let element = UIImageView()
    element.image = personImage
    element.contentMode = .scaleAspectFit
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  var tap: ((UIImage) -> Void)?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setViews()
    setConstraints()
    setRecognaizer()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func cellTap() {
    tap?(personImage.image ?? UIImage())
  }
}

private extension PhotoCell {
  func setViews() {
    addSubview(personImage)
  }
  
  func setConstraints() {
    NSLayoutConstraint.activate([
      personImage.leadingAnchor.constraint(equalTo: leadingAnchor),
      personImage.topAnchor.constraint(equalTo: topAnchor),
      personImage.trailingAnchor.constraint(equalTo: trailingAnchor),
      personImage.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }
  
  func setRecognaizer() {
    let recognizer = UITapGestureRecognizer(target: self, action: #selector(cellTap))
    addGestureRecognizer(recognizer)
  }
}

