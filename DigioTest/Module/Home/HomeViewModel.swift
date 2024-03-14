//
//  HomeViewModel.swift
//  DigioTest
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (RESOURCE TECNOLOGIA E INFORMATICA LTDA – GEDES – SP) on 13/03/24.
//  Copyright © 2020 Digio Test. All rights reserved.
//

import Foundation

class HomeViewModel {

  var spotLights: [Spotlight]
  var products: [Product]
  var welcome: String
  var delegate: HomeViewControllerDelegate?
  let service: HomeServiceProtocol


  init(_ delegate: HomeViewControllerDelegate,
       service: HomeServiceProtocol) {
    self.welcome = Constants.Strings.welcome
    self.delegate = delegate
    self.products = [Product]()
    self.spotLights = [Spotlight]()
    self.service = service
  }

  func viewDidLoad() {

    self.delegate?.showHideLoading(showHide: true)

      DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {

        self.service.products { result in
          self.delegate?.showHideLoading(showHide: false)
            switch result {
              case .success(let response):
                self.spotLights = response.spotlight
                self.products = response.products
                self.delegate?.loadCollectionViews()

              case .failure:
                self.delegate?.showErrorMessage(message: Constants.Strings.genericError)
              }
          }
      })
  }
}
