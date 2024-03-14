//
//  SpotLightCollectionViewCell.swift
//  DigioTest
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (RESOURCE TECNOLOGIA E INFORMATICA LTDA – GEDES – SP) on 13/03/24..
//  Copyright © 2020 Digio Test. All rights reserved.
//

import UIKit
import moa

class SpotLightCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var ivSpotlight: UIImageView!
    static let CellIdentifier = "SpotLightCollectionViewCellIdentifier"

    func displayCell(spotLight: Spotlight) {

        ivSpotlight.moa.url = spotLight.bannerURL

    }

}
