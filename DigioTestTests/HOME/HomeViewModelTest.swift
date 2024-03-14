//
//  HomeViewModelTest.swift
//  DigioTestTests
//
//  Created by Pedro Henrique Borges De Paula Sebastiao on 14/03/24.
//  Copyright © 2024 Digio Test. All rights reserved.
//

import XCTest
import Alamofire

@testable import DigioTest

class HomeViewModelTests: XCTestCase {
  
  
  var homeViewModel: HomeViewModel!
      var mockDelegate: MockHomeViewControllerDelegate!
      var mockService: MockHomeServiceProtocol!

      override func setUp() {
          super.setUp()
          mockDelegate = MockHomeViewControllerDelegate()
          mockService = MockHomeServiceProtocol()
          homeViewModel = HomeViewModel(mockDelegate, service: mockService)
      }

      override func tearDown() {
          mockDelegate = nil
          mockService = nil
          homeViewModel = nil
          super.tearDown()
      }

      func testViewDidLoad_Success() {
          // Given
          let expectation = XCTestExpectation(description: "Load collection views after getting data")
          let spotlight = Spotlight(name: "mock", bannerURL: "mock", spotlightDescription: "mock")
          let products = [Product(name: "mock", imageURL: "mock", productDescription: "mock")]
          let cash = Cash(title: "mock", bannerURL: "mock", cashDescription: "mock")
          let response = ProductsResponse(spotlight: [spotlight], products: products, cash: cash)
          mockService.mockResponse = .success(response)

          // When
          homeViewModel.viewDidLoad()

          // Then
          DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
              XCTAssertEqual(self.mockDelegate.showHideLoadingCalls.count, 2) // One for showing, one for hiding
              XCTAssertFalse(self.mockDelegate.showHideLoadingCalls[1]) // Hide loading
              XCTAssertEqual(self.homeViewModel.spotLights.count, 1) // Spotlights should be updated
              XCTAssertEqual(self.homeViewModel.products.count, 1) // Products should be updated
              XCTAssertEqual(self.mockDelegate.loadCollectionViewsCalls, 1) // Collection views should be loaded
              expectation.fulfill()
          }

          wait(for: [expectation], timeout: 5.0)
      }

      func testViewDidLoad_Failure() {
          // Given
          let expectation = XCTestExpectation(description: "Show error message on failure")
        mockService.mockResponse = .failure(AFError.sessionTaskFailed(error: NSError(domain: "com.yourapp.AFNetworkingErrorDomain", code: -1009, userInfo: [NSLocalizedDescriptionKey: "The Internet connection appears to be offline."])))

          // When
          homeViewModel.viewDidLoad()

          // Then
          DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
              XCTAssertEqual(self.mockDelegate.showHideLoadingCalls.count, 2) // One for showing, one for hiding
              XCTAssertFalse(self.mockDelegate.showHideLoadingCalls[1]) // Hide loading
              XCTAssertEqual(self.mockDelegate.showErrorMessageCalls, 1) // Show error message
              XCTAssertEqual(self.mockDelegate.errorMessage, Constants.Strings.genericError) // Correct error message
              expectation.fulfill()
          }

          wait(for: [expectation], timeout: 5.0)
      }

  
}


class MockHomeViewControllerDelegate: HomeViewControllerDelegate {
    var showHideLoadingCalls = [Bool]()
    var loadCollectionViewsCalls = 0
    var showErrorMessageCalls = 0
    var errorMessage: String?

    func showHideLoading(showHide: Bool) {
        showHideLoadingCalls.append(showHide)
    }

    func loadCollectionViews() {
        loadCollectionViewsCalls += 1
    }

    func showErrorMessage(message: String) {
        showErrorMessageCalls += 1
        errorMessage = message
    }
}



class MockHomeServiceProtocol: HomeServiceProtocol {
  func products(completion: @escaping (Result<ProductsResponse, AFError>) -> Void) {
    if let response = mockResponse {
        completion(response)
    }
  }
    var mockResponse: Result<ProductsResponse, AFError>?

}
