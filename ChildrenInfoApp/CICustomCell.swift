//
//  CICustomCell.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 19.02.2025.
//

import UIKit

class CICustomCell: UITableViewCell {
    
    static let reuseID = "CICustomCell"
    let childInfoView = ChildInfoView()
    let deleteButton = UIButton()
    var child = ""
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(child: String) {
        self.child = child
    }
    
    func configure() {
        contentView.addSubview(childInfoView)
        contentView.addSubview(deleteButton)
            
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        deleteButton.setTitle("Удалить", for: .normal)
        deleteButton.setTitleColor(.systemBlue, for: .normal)
        deleteButton.contentHorizontalAlignment = .left
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        childInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            childInfoView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            childInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            childInfoView.trailingAnchor.constraint(equalTo: centerXAnchor),
            childInfoView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            deleteButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            deleteButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            deleteButton.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -5)
        ])
        
    }
   
    @objc func deleteButtonTapped() {
        print("tapped")
    }

}
