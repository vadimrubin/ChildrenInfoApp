//
//  ViewController.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 18.02.2025.
//

import UIKit

class MainScreenVC: UIViewController {
    
    let personalInfoLabel = UILabel()
    let personalInfoView = PersonalInfoView()
    let childrenLabel = UILabel()
    let addChildButton = UIButton()
    let childrenTable = UITableView()
    let clearButton = UIButton()
    
    let minPadding: CGFloat = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configurePersonalInfoLabel()
        configurePersonalInfoView()
        configureChildrenLabel()
        configureAddChildButton()
        configureClearButton()
        configureChildrenTable()
        createDismissKeyboardTapGesture()
    }

    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    fileprivate func configurePersonalInfoLabel() {
        view.addSubview(personalInfoLabel)
        personalInfoLabel.text = "Персональные данные"
        personalInfoLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        personalInfoLabel.textColor = .label
        personalInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            personalInfoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            personalInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: minPadding),
            personalInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -minPadding),
            personalInfoLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    fileprivate func configurePersonalInfoView() {
        
        
        view.addSubview(personalInfoView)
        personalInfoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            personalInfoView.topAnchor.constraint(equalTo: personalInfoLabel.bottomAnchor, constant: 5),
            personalInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: minPadding),
            personalInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -minPadding),
            personalInfoView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    fileprivate func configureChildrenLabel() {
        view.addSubview(childrenLabel)
        childrenLabel.text = "Дети (макс. 5)"
        childrenLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        childrenLabel.textColor = .label
        childrenLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            childrenLabel.topAnchor.constraint(equalTo: personalInfoView.bottomAnchor, constant: minPadding),
            childrenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: minPadding),
            childrenLabel.heightAnchor.constraint(equalToConstant: 40),
            childrenLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    fileprivate func configureAddChildButton() {
        view.addSubview(addChildButton)
        addChildButton.layer.cornerRadius = 20
        addChildButton.layer.borderWidth = 2
        addChildButton.layer.borderColor = UIColor.systemBlue.cgColor
        addChildButton.setTitle("Добавить ребенка", for: .normal)
        if let symbolImage = UIImage(systemName: "plus") {
            var configuration = UIButton.Configuration.plain()
            configuration.image = symbolImage
            configuration.baseForegroundColor = .systemBlue
            addChildButton.configuration = configuration
        }
        addChildButton.setTitleColor(.systemBlue, for: .normal)
        addChildButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        addChildButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addChildButton.topAnchor.constraint(equalTo: personalInfoView.bottomAnchor, constant: minPadding),
            addChildButton.leadingAnchor.constraint(equalTo: childrenLabel.trailingAnchor, constant: minPadding),
            addChildButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -minPadding),
            addChildButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    fileprivate func configureClearButton() {
        view.addSubview(clearButton)
        clearButton.layer.cornerRadius = 20
        clearButton.layer.borderWidth = 2
        clearButton.layer.borderColor = UIColor.systemRed.cgColor
        clearButton.setTitle("Очистить", for: .normal)
        clearButton.setTitleColor(.systemRed, for: .normal)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            clearButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -minPadding),
            clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clearButton.heightAnchor.constraint(equalToConstant: 40),
            clearButton.widthAnchor.constraint(equalTo: addChildButton.widthAnchor)
        ])
    }
    
    fileprivate func configureChildrenTable() {
        view.addSubview(childrenTable)
        childrenTable.delegate = self
        childrenTable.dataSource = self
        childrenTable.register(CICustomCell.self, forCellReuseIdentifier: CICustomCell.reuseID)
        childrenTable.allowsSelection = false
        childrenTable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            childrenTable.topAnchor.constraint(equalTo: childrenLabel.bottomAnchor, constant: minPadding),
            childrenTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: minPadding),
            childrenTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -minPadding),
            childrenTable.bottomAnchor.constraint(equalTo: clearButton.topAnchor, constant: -minPadding)
        ])
    }
    
    fileprivate func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}

extension MainScreenVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CICustomCell.reuseID) as! CICustomCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

