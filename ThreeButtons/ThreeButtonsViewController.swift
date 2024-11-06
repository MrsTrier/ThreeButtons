//
//  ThreeButtonsViewController.swift
//  ThreeButtons
//
//  Created by Daria Cheremina on 04/11/2024.
//

import UIKit

enum Constants: String {
    case arrowButton = "arrow.right.circle.fill"
}

class ThreeButtonsViewController: UIViewController {
    weak var coordinator: AppCoordinator?

    private lazy var threeButtonsView = ThreeButtonsView(
        with: [
            ButtonModel(name: "First Button", iconName: Constants.arrowButton.rawValue, action: {}),
            ButtonModel(name: "Second Medium Button", iconName: Constants.arrowButton.rawValue, action: {}),
            ButtonModel(name: "Third", iconName: Constants.arrowButton.rawValue, action: { self.coordinator?.threeButtonsVCThirdButtonDidTapped() })
        ]
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }

    private func setupConstraints() {
        view.addSubview(threeButtonsView)

        threeButtonsView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            threeButtonsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            threeButtonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

