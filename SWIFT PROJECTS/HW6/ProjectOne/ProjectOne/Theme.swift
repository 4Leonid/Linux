//
//  Theme.swift
//  ProjectOne
//
//  Created by Леонид Турко on 12.03.2024.
//

import UIKit

enum AllTheme {
  case white
  case blue
  case green
}

protocol AppTheme {
  var backgroundColor: UIColor { get }
  var textColor: UIColor { get }
  var subtitleTextColor: UIColor { get }
  var type: AllTheme { get }
}

extension AppTheme {
  var subtitleTextColor: UIColor { .gray }
}


final class Theme {
  static var currentTheme: AppTheme = WhiteTheme()
}

final class WhiteTheme: AppTheme {
    var backgroundColor: UIColor = .white
    var textColor: UIColor = .black
    var type: AllTheme = .white
}

final class BlueTheme: AppTheme {
    var backgroundColor: UIColor = UIColor(red: 228/255, green: 231/255, blue: 255, alpha: 1)
    var textColor: UIColor  = .brown
    var type: AllTheme = .blue
}

final class GreenTheme: AppTheme {
    var backgroundColor: UIColor = UIColor(red: 206/255, green: 1, blue: 162/255, alpha: 1)
    var textColor: UIColor  = .brown
    var type: AllTheme = .green
}
