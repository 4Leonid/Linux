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
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setViews()
    setConstraints()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    personImage.image = nil 
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(photo: Photo) {
    DispatchQueue.global().async {
      guard let url = URL(string: photo.sizes.first?.url ?? ""),
            let data = try? Data(contentsOf: url) else { return }
      
      DispatchQueue.main.async {
        self.personImage.image = UIImage(data: data)
      }
    }
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
}

