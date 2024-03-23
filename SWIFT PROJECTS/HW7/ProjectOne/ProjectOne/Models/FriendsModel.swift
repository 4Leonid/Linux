//
//  FriendsModel.swift
//  ProjectOne
//
//  Created by Леонид Турко on 04.03.2024.
//

struct FriendsModel: Codable {
  var response: Friends
}

struct Friends: Codable {
  var items: [Friend]
}

struct Friend: Codable {
  let id: Int
  let firstName: String?
  let lastName: String?
  let photo: String?
  let online: Int?
  
  enum CodingKeys: String, CodingKey {
    case id
    case firstName = "first_name"
    case lastName = "last_name"
    case photo = "photo_400_orig"
    case online
  }
}
