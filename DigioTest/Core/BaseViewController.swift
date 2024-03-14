//
//  BaseViewController.swift
//  DigioTest
//
//  Created by Pedro Henrique Borges De Paula Sebastiao (RESOURCE TECNOLOGIA E INFORMATICA LTDA – GEDES – SP) on 13/03/24.
//  Copyright © 2020 Digio Test. All rights reserved.
//

import UIKit
import ProgressHUD

class BaseViewController: UIViewController {

    func showError(_ message: String) {

        ProgressHUD.showError(message)
    }
    func showHideProgress(_ show: Bool) {

        if show {
            ProgressHUD.show("Aguarde...")
        } else {
            ProgressHUD.dismiss()
        }
     }
}
