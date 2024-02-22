//
//  ViewController.swift
//  ProjectTwo
//
//  Created by Леонид Турко on 22.02.2024.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var loginTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  @IBOutlet weak var authLabel: UILabel!
  @IBOutlet weak var enterButton: UIButton!
  
  var isColored = false
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }


  @IBAction func enterButtonTapped() {
    authLabel.textColor = isColored ? .black : .green
    isColored.toggle()
  }
}

