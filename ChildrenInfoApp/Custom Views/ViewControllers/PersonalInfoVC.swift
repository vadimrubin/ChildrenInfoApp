//
//  PersonalInfoVC.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 20.02.2025.
//

import UIKit

class PersonalInfoVC: UIViewController {
    
    let nameView = UIView()
    let ageView = UIView()
    let nameLabel = CIMainLabel()
    let ageLabel = CIMainLabel()
    let nameTextField = CITextFiled()
    let ageTextField = CITextFiled()
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNameAndAgeView()
        configureNameBlock()
        configureAgeBlock()
    }
    
    fileprivate func configureNameAndAgeView() {
        view.addSubview(nameView)
        view.addSubview(ageView)

        nameView.layer.borderWidth = 2
        nameView.layer.borderColor = UIColor.lightGray.cgColor
        nameView.layer.cornerRadius = 8
        ageView.layer.borderWidth = 2
        ageView.layer.borderColor = UIColor.lightGray.cgColor
        ageView.layer.cornerRadius = 8
        
        nameView.translatesAutoresizingMaskIntoConstraints = false
        ageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameView.topAnchor.constraint(equalTo: view.topAnchor),
            nameView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -5),
            
            ageView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 5),
            ageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            ageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    fileprivate func configureNameBlock() {
        nameView.addSubview(nameLabel)
        nameView.addSubview(nameTextField)
        
        nameLabel.text = "Имя"
        nameTextField.placeholder = "Введите имя"
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: nameView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: -10),
            nameLabel.bottomAnchor.constraint(equalTo: nameView.centerYAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: nameView.centerYAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: nameView.leadingAnchor, constant: 10),
            nameTextField.trailingAnchor.constraint(equalTo: nameView.trailingAnchor, constant: -10),
            nameTextField.bottomAnchor.constraint(equalTo: nameView.bottomAnchor)
        ])
    }
    
    fileprivate func configureAgeBlock() {
        ageView.addSubview(ageLabel)
        ageView.addSubview(ageTextField)
        
        ageLabel.text = "Возраст"
        ageTextField.keyboardType = .numberPad
        ageTextField.placeholder = "Введите возраст"
        
        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: ageView.topAnchor),
            ageLabel.leadingAnchor.constraint(equalTo: ageView.leadingAnchor, constant: 10),
            ageLabel.trailingAnchor.constraint(equalTo: ageView.trailingAnchor, constant: -10),
            ageLabel.bottomAnchor.constraint(equalTo: ageView.centerYAnchor),
            
            ageTextField.topAnchor.constraint(equalTo: ageView.centerYAnchor),
            ageTextField.leadingAnchor.constraint(equalTo: ageView.leadingAnchor, constant: 10),
            ageTextField.trailingAnchor.constraint(equalTo: ageView.trailingAnchor, constant: -10),
            ageTextField.bottomAnchor.constraint(equalTo: ageView.bottomAnchor)
        ])
    }
}
