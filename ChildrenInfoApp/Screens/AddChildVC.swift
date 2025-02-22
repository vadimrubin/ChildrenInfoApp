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

protocol UpdateTableProtocol {
    func updateTable()
}

protocol DismissVCProtocol {
    func dismissVC()
}

class AddChildVC: UIViewController, DismissVCProtocol {

    let containerView = UIView()
    let childInfoView = UIView()
    let saveButton = CIButton(color: .systemGreen)
    let padding: CGFloat = 10
    let cancelButton = UIButton()
    var addChildProtocolDelegate: AddChildProtocol?
    var updateTableProtocolDelegate: UpdateTableProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        configureContainerView()
        configureCancelButton()
        configurePersonalInfoForChild()
        configureSaveButton()
        createDismissKeyboardTapGesture()
    }
    
    fileprivate func configureContainerView() {
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
    
    fileprivate func configureCancelButton() {
        let cancelImage = UIImageView()
        cancelImage.image = UIImage(systemName: "x.circle.fill")
        cancelImage.tintColor = .systemRed
        view.addSubview(cancelButton)
        cancelButton.addSubview(cancelImage)
        cancelButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cancelButton.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            cancelButton.leadingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            cancelButton.widthAnchor.constraint(equalToConstant: 30),
            cancelButton.heightAnchor.constraint(equalToConstant: 30),
            
            cancelImage.topAnchor.constraint(equalTo: cancelButton.topAnchor),
            cancelImage.leadingAnchor.constraint(equalTo: cancelButton.leadingAnchor),
            cancelImage.trailingAnchor.constraint(equalTo: cancelButton.trailingAnchor),
            cancelImage.bottomAnchor.constraint(equalTo: cancelButton.bottomAnchor)
        ])
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    fileprivate func configurePersonalInfoForChild() {
        containerView.addSubview(childInfoView)
        childInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            childInfoView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            childInfoView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            childInfoView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            childInfoView.heightAnchor.constraint(equalToConstant: 160)
        ])
        let personalInforForChild = PersonalInfoForChild()
        personalInforForChild.dismissVCProtocolDelegate = self
        self.addChildProtocolDelegate = personalInforForChild
        self.add(childVC: personalInforForChild, to: childInfoView)
    }
    
    fileprivate func configureSaveButton() {
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
        addChildProtocolDelegate?.saveChildInfo()
        updateTableProtocolDelegate?.updateTable()
    }
    
    fileprivate func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}

