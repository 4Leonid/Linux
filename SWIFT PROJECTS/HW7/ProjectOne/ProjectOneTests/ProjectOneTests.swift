//
//  ProjectOneTests.swift
//  ProjectOneTests
//
//  Created by Леонид Турко on 15.03.2024.
//

import XCTest
@testable import ProjectOne

final class ProjectOneTests: XCTestCase {

  private var networkService: NetworkServiceSpy!
  
  override func setUp() {
    super.setUp()
    networkService = NetworkServiceSpy()
  }
  
  override func tearDown() {
    networkService = nil
    super.tearDown()
  }
  
  func testFriendsFetch() {
    networkService.getFriends(complition: <#T##(Result<[Friend], Error>) -> Void#>)
  }
}
