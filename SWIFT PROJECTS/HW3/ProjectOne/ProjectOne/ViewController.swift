//
//  ViewController.swift
//  ProjectOne
//
//  Created by Леонид Турко on 21.02.2024.
//

import UIKit
import WebKit

final class ViewController: UIViewController {
  
  private lazy var webView: WKWebView = {
    let element = WKWebView(frame: view.bounds)
    element.navigationDelegate = self
    return element
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setViews()
    makeRequest()
  }
}

private extension ViewController {
  func setViews() {
    view.backgroundColor = .white
    view.addSubview(webView)
  }
  
  func makeRequest() {
    guard let url = URL(string: "https://oauth.vk.com/authorize?client_id=\(AppCode.appCode) &redirect_uri=https://oauth.vk.com/blank.html&scope=262150&display=mobile&response_type=token") else { return }
    
    let request = URLRequest(url: url)
    webView.load(request)
  }
}


extension ViewController: WKNavigationDelegate {
  func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
    guard let url = navigationResponse.response.url, url.path == "/blank.html",
          let fragment = url.fragment else {
      decisionHandler(.allow)
      return
    }
    
    let params = fragment
      .components(separatedBy: "&")
      .map { $0.components(separatedBy: "=") }
      .reduce([String: String]()) { result, param in
        var dict = result
        let key = param[0]
        let value = param[1]
        dict[key] = value
        return dict
      }
    let token = params["access_token"]!
    let userID = params["user_id"]!
    NetworkService.token = token
    NetworkService.userID = userID
    print(token)
    print(userID)
    decisionHandler(.cancel)
    webView.removeFromSuperview()
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    let tabBarController = TabBarController()
    tabBarController.modalPresentationStyle = .fullScreen
    present(tabBarController, animated: true)
  }
}
