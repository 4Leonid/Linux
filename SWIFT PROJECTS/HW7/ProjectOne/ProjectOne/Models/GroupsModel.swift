//
//  GroupsModel.swift
//  ProjectOne
//
//  Created by Леонид Турко on 04.03.2024.
//

struct GroupsModel: Codable {
  let response: Groups
}

struct Groups: Codable {
  let items: [Group]
}

struct Group: Codable {
  let id: Int
  let name: String?
  let photo: String?
  let description: String?
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case photo = "photo_50"
    case description
  }
}
