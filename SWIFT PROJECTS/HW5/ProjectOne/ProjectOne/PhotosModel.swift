//
//  PhotosModel.swift
//  ProjectOne
//
//  Created by Леонид Турко on 04.03.2024.
//

struct PhotosModel: Codable {
  let response: Photos
}

struct Photos: Codable {
  let items: [Photo]
}

struct Photo: Codable {
  var id: Int
  var text: String?
  var sizes: [Sizes]
}

struct Sizes: Codable {
  let url: String
}
