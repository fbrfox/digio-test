//
//  HomeServiceProtocol.swift
//  DigioTest
//
//  Created by Pedro Henrique Borges De Paula Sebastiao on 14/03/24.
//  Copyright © 2024 Digio Test. All rights reserved.
//

import Foundation
import Alamofire

protocol HomeServiceProtocol {
  
  func products(completion:@escaping (Result<ProductsResponse, AFError>)->Void)
  
}
