//
//  Helper.swift
//  NewsApp
//
//  Created by Леонид Турко on 11.03.2024.
//

import Foundation

final class Helper {
  static func getDate(date: Double) -> String {
    let currentDate = Date(timeIntervalSince1970: date)
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMMM YYYY"
    dateFormatter.locale = Locale(identifier: "ru_RU")
    
    return dateFormatter.string(from: currentDate)
  }
}
