//
//  CIButton.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 19.02.2025.
//

import UIKit

class CIButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(color: UIColor) {
        self.init(frame: .zero)
        self.layer.borderColor = color.cgColor
        self.setTitleColor(color, for: .normal)
    }
    
    private func configure() {
        layer.cornerRadius = 20
        layer.borderWidth = 2
        titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
