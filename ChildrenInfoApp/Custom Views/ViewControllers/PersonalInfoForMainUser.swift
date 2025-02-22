//
//  PersonalInfoForMainUser.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 20.02.2025.
//

import UIKit

class PersonalInfoForMainUser: PersonalInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        ageTextField.delegate = self
        nameTextField.placeholder = "Введите свое имя"
        ageTextField.placeholder = "Введите свой возраст"
        ageTextField.text = defaults.string(forKey: "Age")
        nameTextField.text = defaults.string(forKey: "Name")
    }
}

extension PersonalInfoForMainUser: UITextFieldDelegate {
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
        view.endEditing(true)
        return true
    }
}
