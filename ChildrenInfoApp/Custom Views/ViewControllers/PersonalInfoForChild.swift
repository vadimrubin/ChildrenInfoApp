//
//  PersonalInfoForChild.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 20.02.2025.
//

import UIKit



class PersonalInfoForChild: PersonalInfoVC, AddChildProtocol {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ageTextField.delegate = self
    }
    
    func saveChildInfo() {
        guard let name = nameTextField.text else { return }
        guard let age = ageTextField.text else { return }
        CoreDataManager.shared.saveChild(name: name, age: age) { error in
            print(error ?? "")
        }
        print("data saved!!!")
    }
}

extension PersonalInfoForChild: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == ageTextField {
            let allowedCharacters = CharacterSet.decimalDigits
                let characterSet = CharacterSet(charactersIn: string)
                return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
}

