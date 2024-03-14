//
//  APIRouter.swift
//  DigioTest
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (RESOURCE TECNOLOGIA E INFORMATICA LTDA – GEDES – SP) on 13/03/24.
//  Copyright © 2020 Digio Test. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {

    case products

    private var method: HTTPMethod {
           switch self {
           case .products:
               return .get
           }
    }

    private var path: String {
           switch self {
           case .products:
               return "/products"
           }
       }

    private var parameters: Parameters? {
           switch self {
           case .products:
               return nil

        }
   }

    func asURLRequest() throws -> URLRequest {
        let url = try Constants.Server.baseURL.asURL()

           var urlRequest = URLRequest(url: url.appendingPathComponent(path))

           // HTTP Method
           urlRequest.httpMethod = method.rawValue

        // Common Headers
           urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
           urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

           // Parameters
           if let parameters = parameters {
               do {
                   urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
               } catch {
                   throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
               }
           }

           return urlRequest
       }
}
