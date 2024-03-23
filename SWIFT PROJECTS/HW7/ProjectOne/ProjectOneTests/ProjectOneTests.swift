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
  private var friendViewController: FriendTableViewController!
  
  override func setUp() {
    super.setUp()
    networkService = NetworkServiceSpy()
    friendViewController = FriendTableViewController(networkService: networkService)
  }
  
  override func tearDown() {
    networkService = nil
    friendViewController = nil
    super.tearDown()
  }
  
  func testFriendsFetch() {
    friendViewController.fetchFriends()
    
    XCTAssert(networkService.isFriendCalled, "Метод вызван")
  }
}
