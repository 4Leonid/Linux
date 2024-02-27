//
//  ViewController.swift
//  ProjectOne
//
//  Created by Леонид Турко on 21.02.2024.
//

import UIKit

final class ViewController: UIViewController {
  
  private lazy var stackView: UIStackView = {
    let element = UIStackView()
    element.axis = .vertical
    element.spacing = 10
    element.distribution = .fillProportionally
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
    element.textAlignment = .center
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  private lazy var loginTextField: UITextField = {
    let element = UITextField()
    element.backgroundColor = .green
    element.layer.borderColor = UIColor.darkGray.cgColor
    element.borderStyle = .roundedRect
    element.placeholder = "Login"
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  private lazy var passwordTextField: UITextField = {
    let element = UITextField()
    element.backgroundColor = .yellow
    element.borderStyle = .roundedRect
    element.placeholder = "Password"
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()
  
  private lazy var enterButton: UIButton = {
    let element = UIButton(type: .system)
    element.setTitle("Войти", for: .normal)
    element.backgroundColor = .blue
    element.layer.cornerRadius = 16
    element.tintColor = .white
    element.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
    element.translatesAutoresizingMaskIntoConstraints = false
    return element
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setViews()
    setConstraints()
  }
  
  @objc func enterButtonTapped() {
    let tabBarController = TabBarController()
    navigationController?.pushViewController(tabBarController, animated: true)
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
    stackView.addArrangedSubview(enterButton)
  }
  
  func setConstraints() {
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
      stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
      
      image.widthAnchor.constraint(equalTo: stackView.widthAnchor),
      image.heightAnchor.constraint(equalTo: image.widthAnchor),
     
      authLabel.heightAnchor.constraint(equalToConstant: 20),
      loginTextField.heightAnchor.constraint(equalToConstant: 40),
      passwordTextField.heightAnchor.constraint(equalToConstant: 40),
      enterButton.heightAnchor.constraint(equalToConstant: 50),
    ])
  }
}
