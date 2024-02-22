//
//  ViewController.swift
//  ProjectOne
//
//  Created by Леонид Турко on 21.02.2024.
//

import UIKit

class ViewController: UIViewController {
  
  private lazy var stackView: UIStackView = {
    let element = UIStackView()
    element.axis = .vertical
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  private lazy var image: UIImageView = {
    let image = UIImage(systemName: "person")
    let element = UIImageView()
    element.image = image
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  private lazy var authLabel: UILabel = {
    let element = UILabel()
    element.text = "Авторизация"
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  private lazy var loginTextField: UITextField = {
    let element = UITextField()
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  private lazy var passwordTextField: UITextField = {
    let element = UITextField()
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setViews()
  }
}


private extension ViewController {
  func setViews() {
    view.backgroundColor = .white
    view.addSubview(stackView)
    stackView.addArrangedSubview(image)
    stackView.addArrangedSubview(authLabel)
    stackView.addArrangedSubview(loginTextField)
    stackView.addArrangedSubview(passwordTextField)
    
  }
  
  func setConstraints() {
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
    ])
  }
}
