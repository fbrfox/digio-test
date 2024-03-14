//
//  HomeViewControllerSnapshotTest.swift
//  DigioTestTests
//
//  Created by Pedro Henrique Borges De Paula Sebastiao on 14/03/24.
//  Copyright © 2024 Digio Test. All rights reserved.
//

import Foundation

import XCTest
import FBSnapshotTestCase
@testable import DigioTest

class HomeViewControllerSnapshotTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        // Set the image folder and the tolerance level for snapshot comparison
        self.recordMode = false // Change to true to record new snapshots
    }

    func testHomeViewController() {
        // Given
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
        let viewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController // Replace "HomeViewController" with your view controller identifier

        // When
        _ = viewController.view // Force load the view

        // Then
        FBSnapshotVerifyView(viewController.view)
    }
}
