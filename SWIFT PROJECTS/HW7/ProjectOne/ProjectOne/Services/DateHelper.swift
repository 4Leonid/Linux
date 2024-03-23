//
//  DateHelper.swift
//  ProjectOne
//
//  Created by Леонид Турко on 13.03.2024.
//

import Foundation

final class DateHelper {
  static func getDate(date: Date?) -> String {
    guard let date else {
      return ""
    }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMMM YYYY hh:mm"
    dateFormatter.locale = Locale(identifier: "ru_RU")
    
    return dateFormatter.string(from: date)
  }
}
