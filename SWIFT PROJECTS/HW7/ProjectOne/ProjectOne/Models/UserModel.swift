//
//  UserModel.swift
//  ProjectOne
//
//  Created by Леонид Турко on 10.03.2024.
//

struct UserModel: Codable {
  var response: [User]
}

struct User: Codable {
  let firstName: String?
  let lastName: String?
  let photo: String?
  
  enum CodingKeys: String, CodingKey {
    case firstName = "first_name"
    case lastName = "last_name"
    case photo = "photo_400_orig"
  }
}
