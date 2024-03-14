//
//  Constants.swift
//  DigioTest
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (RESOURCE TECNOLOGIA E INFORMATICA LTDA – GEDES – SP) on .
//  Copyright © 2020 Digio Test. All rights reserved.
//

import Foundation

struct Constants {
    struct Server {
        static let baseURL = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox"
    }
  struct Strings {
    static let welcome = "Olá, Maria"
    static let genericError = "Ocorreu um erro ao obter as informações!"
  }

}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
