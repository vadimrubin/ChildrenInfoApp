//
//  PersonalInfoForChild.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 20.02.2025.
//

import UIKit



class PersonalInfoForChild: PersonalInfoVC, AddChildProtocol {
    
    var dismissVCProtocolDelegate: DismissVCProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ageTextField.delegate = self
    }
    
    func saveChildInfo() {
        if nameTextField.hasText && ageTextField.hasText {
            let name = nameTextField.text!
            let age = ageTextField.text!
            CoreDataManager.shared.saveChild(name: name, age: age) { error in
                print(error ?? "")
            }
            dismissVCProtocolDelegate?.dismissVC()
        } else {
            nameTextField.attributedPlaceholder = NSAttributedString(string: "Нужно ввести имя", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemRed])
            ageTextField.attributedPlaceholder = NSAttributedString(string: "Нужно ввести возраст", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemRed])
        }
        
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

