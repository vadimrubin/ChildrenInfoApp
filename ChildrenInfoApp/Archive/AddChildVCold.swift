//
//  AddChildVC.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 19.02.2025.
//

import UIKit

class AddChildVCold: UIViewController {
    
    let containerView = UIView()
    let nameLabel = CIMainLabel()
    let ageLabel = CIMainLabel()
    let nameTextField = CITextFiled()
    let ageTextField = CITextFiled()
    let saveButton = CIButton(color: .systemGreen)
    let padding: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        configureContainerView()
        configureLabels()
        configureTextFields()
        configureSaveButton()
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func configureLabels() {
        containerView.addSubview(nameLabel)
        containerView.addSubview(ageLabel)
        
        nameLabel.text = "Имя"
        ageLabel.text = "Возраст"
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            ageLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            ageLabel.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: padding),
            ageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            ageLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureTextFields() {
        containerView.addSubview(nameTextField)
        containerView.addSubview(ageTextField)
        
        nameTextField.placeholder = "Введите имя"
        ageTextField.placeholder = "Введите возраст"
        nameTextField.layer.borderWidth = 2
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        nameTextField.layer.cornerRadius = 8
        ageTextField.layer.borderWidth = 2
        ageTextField.layer.borderColor = UIColor.lightGray.cgColor
        ageTextField.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: padding),
            ageTextField.leadingAnchor.constraint(equalTo: ageLabel.leadingAnchor),
            ageTextField.trailingAnchor.constraint(equalTo: ageLabel.trailingAnchor),
            ageTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureSaveButton() {
        containerView.addSubview(saveButton)
        saveButton.setTitle("Сохранить", for: .normal)
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            saveButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }

}
