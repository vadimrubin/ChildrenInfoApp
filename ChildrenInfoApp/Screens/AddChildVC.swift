//
//  AddChildVC.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 20.02.2025.
//

import UIKit

protocol AddChildProtocol {
    func saveChildInfo()
}

protocol UpdateTable {
    func updateTable()
}

class AddChildVC: UIViewController {

    let containerView = UIView()
    let childInfoView = UIView()
    let saveButton = CIButton(color: .systemGreen)
    let padding: CGFloat = 10
    var delegate: AddChildProtocol?
    var deleg: UpdateTable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        configureContainerView()
        configurePersonalInfoForChild()
        configureSaveButton()
        createDismissKeyboardTapGesture()
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
            containerView.heightAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    func configurePersonalInfoForChild() {
        containerView.addSubview(childInfoView)
        childInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            childInfoView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            childInfoView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            childInfoView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            childInfoView.heightAnchor.constraint(equalToConstant: 160)
        ])
        let personalInforForChild = PersonalInfoForChild()
        self.delegate = personalInforForChild
        self.add(childVC: personalInforForChild, to: childInfoView)
    }
    
    func configureSaveButton() {
        containerView.addSubview(saveButton)
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.addTarget(self, action: #selector(saveChildData), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            saveButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 120),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func saveChildData() {
        delegate?.saveChildInfo()
        deleg?.updateTable()
        dismiss(animated: true)
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    fileprivate func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }

}

