//
//  HomeService.swift
//  DigioTest
//
//  Created by Pedro Henrique Borges De Paula Sebastiao on 14/03/24.
//  Copyright © 2024 Digio Test. All rights reserved.
//

import Foundation
import Alamofire

class HomeService: HomeServiceProtocol {
  
  let apiClient: APIClientProcotol
  
  init(apiClient: APIClientProcotol){
    self.apiClient = apiClient
  }
  
  
  
  func products(completion: @escaping (Result<ProductsResponse, AFError>) -> Void) {
    
    apiClient.performRequest(route: .products, decoder: JSONDecoder()) { result in
      completion(result)
    }
  }
  
}
