//
//  DetailViewController.swift
//  ProjectOne
//
//  Created by Леонид Турко on 27.02.2024.
//

import UIKit

class DetailViewController: UIViewController {
  
  private lazy var detailImage: UIImageView = {
    let element = UIImageView()
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  var image: UIImage? {
    didSet {
      detailImage.image = image
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setViews()
    setConstraints()
  }
}

private extension DetailViewController {
  func setViews() {
    view.backgroundColor = .white
    view.addSubview(detailImage)
  }
  
  func setConstraints() {
    NSLayoutConstraint.activate([
      detailImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      detailImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      detailImage.widthAnchor.constraint(equalToConstant: 200),
      detailImage.heightAnchor.constraint(equalTo: detailImage.widthAnchor),
    ])
  }
}

