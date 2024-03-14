//
//  HomeViewController.swift
//  DigioTest
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (RESOURCE TECNOLOGIA E INFORMATICA LTDA – GEDES – SP) on 13/03/24.
//  Copyright © 2020 Digio Test. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate {

    func showHideLoading(showHide: Bool)
    func loadCollectionViews()
    func showErrorMessage(message: String)
}

class HomeViewController: BaseViewController {

    @IBOutlet weak var cvSpotlight: UICollectionView!
    @IBOutlet weak var cvProducts: UICollectionView!
    var viewModel: HomeViewModel!
    @IBOutlet weak var lbProfile: UILabel!

    fileprivate func configurarFlow() {

         if let flowLayout = cvProducts.collectionViewLayout as? UICollectionViewFlowLayout {

             flowLayout.estimatedItemSize = CGSize(width: 100, height: 100)
         }

         if let flowLayout = cvSpotlight.collectionViewLayout as? UICollectionViewFlowLayout {
             flowLayout.estimatedItemSize = CGSize(width: 0, height: 0)
         }
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = HomeViewModel(self, service: HomeService(apiClient: APIClient()))
        self.configurarFlow()
        self.viewModel.viewDidLoad()
        lbProfile.text = self.viewModel.welcome

    }

}

extension HomeViewController: HomeViewControllerDelegate {
    func showHideLoading(showHide: Bool) {

        super.showHideProgress(showHide)
    }

    func showErrorMessage(message: String) {

        super.showError(message)

    }

    func loadCollectionViews() {

        cvSpotlight.reloadData()
        cvProducts.reloadData()
    }

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        if collectionView.isEqual(cvProducts) {
            return self.viewModel.products.count
        } else {
            return self.viewModel.spotLights.count
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView.isEqual(cvProducts) {
            guard let cvCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.CellIdentifier, for: indexPath) as? ProductsCollectionViewCell else {

                return UICollectionViewCell()
            }

            return cvCell

        } else {

            guard let cvCell = collectionView.dequeueReusableCell(withReuseIdentifier: SpotLightCollectionViewCell.CellIdentifier, for: indexPath) as? SpotLightCollectionViewCell else {

                return UICollectionViewCell()
            }

           return cvCell

        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {

        if let cell = cell as? ProductsCollectionViewCell {

            let product = self.viewModel.products[indexPath.row]
            cell.displayCell(product: product)
        } else if let cell = cell as? SpotLightCollectionViewCell {

            let spotLight = self.viewModel.spotLights[indexPath.row]
            cell.displayCell(spotLight: spotLight)
        }
    }
}
