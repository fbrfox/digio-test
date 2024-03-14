//
//  ProductsCollectionViewCell.swift
//  DigioTest
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (RESOURCE TECNOLOGIA E INFORMATICA LTDA – GEDES – SP) on 13/03/24.
//  Copyright © 2020 Digio Test. All rights reserved.
//

import UIKit
import moa

class ProductsCollectionViewCell: UICollectionViewCell {

    static let CellIdentifier = "ProductsCollectionViewCellIdentifier"
    @IBOutlet weak var ivProduct: UIImageView!

    func displayCell(product: Product) {

        ivProduct.moa.url = product.imageURL

    }
}
