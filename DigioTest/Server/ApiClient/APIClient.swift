//
//  APIClient.swift
//  DigioTest
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (RESOURCE TECNOLOGIA E INFORMATICA LTDA – GEDES – SP) on 13/03/24.
//  Copyright © 2020 Digio Test. All rights reserved.
//

import Foundation
import Alamofire


protocol APIClientProcotol {
  
   func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder, completion:@escaping (Result<T, AFError>)->Void) -> DataRequest
  
}

class APIClient: APIClientProcotol {
    
    
    @discardableResult
    func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        return AF.request(route)
                        .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                            completion(response.result)
        }
    }
}
