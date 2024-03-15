//
//  NetworkServiceSpy.swift
//  ProjectOneTests
//
//  Created by Леонид Турко on 15.03.2024.
//

@testable import ProjectOne

final class NetworkServiceSpy: NetworkServiceProtocol {
  private(set) var isFriendCalled = false
  
  func getFriends(complition: @escaping (Result<[ProjectOne.Friend], Error>) -> Void) {
    isFriendCalled = true
  }
  
  func getGroups(complition: @escaping (Result<[ProjectOne.Group], Error>) -> Void) {
    <#code#>
  }
  
  func getPhotos(complition: @escaping ([ProjectOne.Photo]) -> Void) {
    <#code#>
  }
  
  func getProfileInfo(competion: @escaping (ProjectOne.User?) -> Void) {
    <#code#>
  }
  
  
}
