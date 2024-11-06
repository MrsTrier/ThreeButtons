//
//  ThreeButtonsView.swift
//  ThreeButtons
//
//  Created by Daria Cheremina on 04/11/2024.
//

import UIKit

final class ThreeButtonsView: UIView {

    private let buttonsArray: [UIButton]

    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: buttonsArray)

        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .center
        stack.distribution = .fillProportionally
        return stack
    }()

    init(with models: [ButtonModel]) {
        buttonsArray = models.map({ UIButtonBuilder.getButton(from: $0) })
        super.init(frame: .zero)
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.addSubview(stack)

        stack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
