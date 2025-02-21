//
//  CIMainLabel.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 19.02.2025.
//

import UIKit

class CIMainLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textAlignment = .left
        font = .systemFont(ofSize: 16)
        textColor = .systemGray
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
