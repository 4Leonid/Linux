//
//  NewsModel.swift
//  NewsApp
//
//  Created by Леонид Турко on 11.03.2024.
//

struct NewsModel: Codable {
  var results: [News]
}

struct News: Codable, Identifiable {
  let id: Int
  let date: Double
  let title: String
  
  enum CodingKeys: String, CodingKey {
    case id
    case date = "publication_date"
    case title
  }
}
