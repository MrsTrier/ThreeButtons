//
//  UIButtonBuilder.swift
//  ThreeButtons
//
//  Created by Daria Cheremina on 04/11/2024.
//

import UIKit

class AnimatedButton: UIButton {
    private var currentScale: CGFloat = 1.0
    private let springAnimationDuration: TimeInterval = 0.4
    private let dampingRatio: CGFloat = 0.5
    private let initialSpringVelocity: CGFloat = 0.5

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    override var isHighlighted: Bool {
        get {
            return false
        }
        set { }
    }

    private func setupButton() {
        addTarget(self, action: #selector(touchDown), for: .touchDown)
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        addTarget(self, action: #selector(touchUpOutside), for: .touchUpOutside)
        addTarget(self, action: #selector(touchDragExit), for: .touchDragExit)
        addTarget(self, action: #selector(touchDragEnter), for: .touchDragEnter)
    }

    @objc private func touchDown() {
        animate(scale: 0.9)
    }

    @objc private func touchUpInside() {
        animate(scale: 1.0)
    }

    @objc private func touchUpOutside() {
        animate(scale: 1.0)
    }

    @objc private func touchDragExit() {
        animate(scale: 1.0)
    }

    @objc private func touchDragEnter() {
        animate(scale: 0.9)
    }

    private func animate(scale: CGFloat) {
        UIView.animate(withDuration: springAnimationDuration, delay: 0, usingSpringWithDamping: dampingRatio, initialSpringVelocity: initialSpringVelocity, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            self.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: { _ in
            self.currentScale = scale
        })
    }
}

struct UIButtonBuilder {

    static func buttonConfig(from model: ButtonModel) -> UIButton.Configuration {
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: model.iconName)
        config.imagePlacement = .trailing
        config.imagePadding = 8

        config.title = model.name

        config.contentInsets.leading = 14
        config.contentInsets.trailing = 14

        config.contentInsets.top = 10
        config.contentInsets.bottom = 10

        return config
    }

    static func getButton(from model: ButtonModel) -> UIButton {
        let button = AnimatedButton()

        button.configuration = buttonConfig(from: model)

        button.addAction(UIAction { _ in
            model.action()
        }, for: .touchUpInside)

        return button
    }
}
