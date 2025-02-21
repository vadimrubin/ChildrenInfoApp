//
//  InfoView.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 18.02.2025.
//

import UIKit

enum InfoTypes {
    case name, age
}

class InfoView: UIView {
    
    let titleLabel = CIMainLabel()
    let infoLabel = CIMainLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(titleLabel)
        addSubview(infoLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: centerYAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            infoLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func set(type: InfoTypes, child: ChildObject) {
        switch type {
        case .name:
            titleLabel.text = "Имя"
            infoLabel.text = child.name
            infoLabel.textColor = .label
        case .age:
            titleLabel.text = "Возраст"
            infoLabel.text = child.age
            infoLabel.textColor = .label
        }
    }
    
    
}
