//
//  PersonalInfoView.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 19.02.2025.
//

import UIKit

class PersonalInfoView: UIView {
    
    let nameView = UIView()
    let ageView = UIView()
    let nameLabel = UILabel()
    let ageLabel = UILabel()
    let nameTextField = UITextField()
    let ageTextField = UITextField()
    let defaults = UserDefaults.standard

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureNameAndAgeView()
        configureNameBlock()
        configureAgeBlock()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configureNameAndAgeView() {
        addSubview(nameView)
        addSubview(ageView)

        nameView.layer.borderWidth = 2
        nameView.layer.borderColor = UIColor.lightGray.cgColor
        nameView.layer.cornerRadius = 8
        ageView.layer.borderWidth = 2
        ageView.layer.borderColor = UIColor.lightGray.cgColor
        ageView.layer.cornerRadius = 8
        
        nameView.translatesAutoresizingMaskIntoConstraints = false
        ageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameView.topAnchor.constraint(equalTo: topAnchor),
            nameView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -5),
            
            ageView.topAnchor.constraint(equalTo: centerYAnchor, constant: 5),
            ageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    fileprivate func configureNameBlock() {
        nameView.addSubview(nameLabel)
        nameView.addSubview(nameTextField)
        
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 16)
        nameLabel.textColor = .systemGray
        nameLabel.text = "Имя"
        nameTextField.text = defaults.string(forKey: "Name")
        nameTextField.delegate = self
        nameTextField.textAlignment = .left
        nameTextField.font = .systemFont(ofSize: 16)
        nameTextField.textColor = .systemGray
        nameTextField.placeholder = "Введите имя"
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        ageLabel.textAlignment = .left
        ageLabel.font = .systemFont(ofSize: 16)
        ageLabel.textColor = .systemGray
        ageLabel.text = "Возраст"
        ageTextField.text = defaults.string(forKey: "Age")
        ageTextField.delegate = self
        ageTextField.keyboardType = .numberPad
        ageTextField.textAlignment = .left
        ageTextField.font = .systemFont(ofSize: 16)
        ageTextField.textColor = .systemGray
        ageTextField.placeholder = "Введите возраст"
        
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        
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

extension PersonalInfoView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == ageTextField {
            let allowedCharacters = CharacterSet.decimalDigits
                let characterSet = CharacterSet(charactersIn: string)
                return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTextField {
            defaults.set(nameTextField.text, forKey: "Name")
        } else {
            defaults.set(ageTextField.text, forKey: "Age")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}
