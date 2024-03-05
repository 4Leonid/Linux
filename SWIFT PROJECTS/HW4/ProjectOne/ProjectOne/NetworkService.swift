//
//  NetworkService.swift
//  ProjectOne
//
//  Created by Леонид Турко on 04.03.2024.
//

import Foundation

protocol NetworkServiceDelegate: AnyObject {
  func update(friends: FriendsModel)
  func update(groups: GroupsModel)
}

final class NetworkService {
  private let session = URLSession.shared
  
  static var token = ""
  static var userID = ""
  
  weak var delegate: NetworkServiceDelegate?
  
  func getFriends() {
    guard let url = URL(string: "https://api.vk.com/method/friends.get?fields=photo_50&access_token=\(NetworkService.token)&v=5.131") else { return }
    
    session.dataTask(with: url) { [weak self] (data, _, error) in
      guard let data else { return }
      
      do {
        let decoder = JSONDecoder()
        let friends = try decoder.decode(FriendsModel.self, from: data)
        self?.delegate?.update(friends: friends)
      } catch {
        print(error.localizedDescription)
      }
    }.resume()
  }
  
  func getGroups() {
    guard let url = URL(string: "https://api.vk.com/method/groups.get?access_token=\(NetworkService.token)&fields=description&v=5.131&extended=1") else { return }
    
    session.dataTask(with: url) { (data, _, error) in
      guard let data else { return }
      
      do {
        let decoder = JSONDecoder()
        let groups = try decoder.decode(GroupsModel.self, from: data)
        self.delegate?.update(groups: groups)
      } catch {
        print(error.localizedDescription)
      }
    }.resume()
  }
  
  func getPhotos() {
    guard let url = URL(string: "https://api.vk.com/method/photos.get?fields=bdate&access_token=\(NetworkService.token)&v=5.131&album_id=profile") else { return }
    
    session.dataTask(with: url) { (data, _, error) in
      guard let data else { return }
      
      do {
        let decoder = JSONDecoder()
        let photos = try decoder.decode(PhotosModel.self, from: data)
        print(photos)
      } catch {
        print(error.localizedDescription)
      }
    }.resume()
  }
}