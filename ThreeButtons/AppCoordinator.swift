//
//  AppCoordinator.swift
//  ThreeButtons
//
//  Created by Daria Cheremina on 04/11/2024.
//

import UIKit

protocol AppCoordinatorProtocol: AnyObject {
    func start()
}

final class AppCoordinator: AppCoordinatorProtocol {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let threeButtonsVC = ThreeButtonsViewController()
        threeButtonsVC.coordinator = self
        
        navigationController.pushViewController(threeButtonsVC, animated: false)
    }

    func threeButtonsVCThirdButtonDidTapped() {
        let secondViewController = SecondViewController()

        navigationController.present(secondViewController, animated: true)
    }
}
