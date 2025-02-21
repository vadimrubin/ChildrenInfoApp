//
//  DetailedInfoView.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 19.02.2025.
//

import UIKit

class ChildInfoView: UIView {
    
    let nameInfoView = InfoView()
    let ageInfoView = InfoView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(child: ChildObject) {
        nameInfoView.set(type: .name, child: child)
        ageInfoView.set(type: .age, child: child)
    }
    
    func configure() {
        addSubview(nameInfoView)
        addSubview(ageInfoView)

        nameInfoView.layer.borderWidth = 2
        nameInfoView.layer.borderColor = UIColor.lightGray.cgColor
        nameInfoView.layer.cornerRadius = 8
        ageInfoView.layer.borderWidth = 2
        ageInfoView.layer.borderColor = UIColor.lightGray.cgColor
        ageInfoView.layer.cornerRadius = 8
        
        nameInfoView.translatesAutoresizingMaskIntoConstraints = false
        ageInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameInfoView.topAnchor.constraint(equalTo: topAnchor),
            nameInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameInfoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameInfoView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -5),
            
            ageInfoView.topAnchor.constraint(equalTo: centerYAnchor, constant: 5),
            ageInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ageInfoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ageInfoView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
