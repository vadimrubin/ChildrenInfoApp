//
//  ViewController.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 18.02.2025.
//

import UIKit

class MainScreenVC: UIViewController, UpdateTable, UIActionSheetDelegate {
    
    let personalInfoLabel = UILabel()
    let personalInfoContainer = UIView()
    let childrenLabel = UILabel()
    let addChildButton = CIButton(color: .systemBlue)
    let childrenTable = UITableView()
    let clearButton = CIButton(color: .systemRed)
    let minPadding: CGFloat = 15
    var childrenArray: [ChildObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configurePersonalInfoLabel()
        configurePersonalInfoContainer()
        configureChildrenLabel()
        configureAddChildButton()
        configureClearButton()
        configureChildrenTable()
        createDismissKeyboardTapGesture()
        importCoreData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        importCoreData()
    }
    
    func updateTable() {
        importCoreData()
        if childrenArray.count >= 5 {
            addChildButton.isHidden = true
        }
    }
    
    func importCoreData() {
        CoreDataManager.shared.retrieveChildren { result in
            switch result {
            case .success(let children):
                self.childrenArray = children
                if self.childrenArray.count == 5 {
                    self.addChildButton.isHidden = true
                }
                DispatchQueue.main.async {
                    self.childrenTable.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
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
    
    fileprivate func configurePersonalInfoContainer() {
        
        
        view.addSubview(personalInfoContainer)
        personalInfoContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            personalInfoContainer.topAnchor.constraint(equalTo: personalInfoLabel.bottomAnchor, constant: 5),
            personalInfoContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: minPadding),
            personalInfoContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -minPadding),
            personalInfoContainer.heightAnchor.constraint(equalToConstant: 150)
        ])
        let personalVC = PersonalInfoForMainUser()
        self.add(childVC: personalVC, to: personalInfoContainer)
    }
    
    fileprivate func configureChildrenLabel() {
        view.addSubview(childrenLabel)
        childrenLabel.text = "Дети (макс. 5)"
        childrenLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        childrenLabel.textColor = .label
        childrenLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            childrenLabel.topAnchor.constraint(equalTo: personalInfoContainer.bottomAnchor, constant: minPadding),
            childrenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: minPadding),
            childrenLabel.heightAnchor.constraint(equalToConstant: 40),
            childrenLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    fileprivate func configureAddChildButton() {
        view.addSubview(addChildButton)
        addChildButton.addTarget(self, action: #selector(pushAddChildVC), for: .touchUpInside)
        addChildButton.setTitle("Добавить ребенка", for: .normal)
        if let symbolImage = UIImage(systemName: "plus") {
            var configuration = UIButton.Configuration.plain()
            configuration.image = symbolImage
            configuration.baseForegroundColor = .systemBlue
            addChildButton.configuration = configuration
        }
        
        NSLayoutConstraint.activate([
            addChildButton.topAnchor.constraint(equalTo: personalInfoContainer.bottomAnchor, constant: minPadding),
            addChildButton.leadingAnchor.constraint(equalTo: childrenLabel.trailingAnchor, constant: minPadding),
            addChildButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -minPadding),
            addChildButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
    }
    
    @objc func pushAddChildVC() {
        print("add button tapped")
        let destVC = AddChildVC()
        destVC.deleg = self
        destVC.modalPresentationStyle = .overFullScreen
        destVC.modalTransitionStyle = .crossDissolve
        self.present(destVC, animated: true)
    }
    
    fileprivate func configureClearButton() {
        view.addSubview(clearButton)
        clearButton.setTitle("Очистить", for: .normal)
        clearButton.addTarget(self, action: #selector(showClearAlert), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            clearButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -minPadding),
            clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clearButton.heightAnchor.constraint(equalToConstant: 40),
            clearButton.widthAnchor.constraint(equalTo: addChildButton.widthAnchor)
        ])
    }
    
    @objc func showClearAlert() {
        let alertContoller = UIAlertController(title: "", message: "Вы хотите удалить все записи?", preferredStyle: .actionSheet)
        let clearAction = UIAlertAction(title: "Да", style: .destructive) { action in
            if self.childrenArray.count > 0 {
                for eachElement in self.childrenArray {
                    CoreDataManager.shared.deleteChild(child: eachElement) { error in
                        print(error ?? "")
                    }
                }
                self.childrenArray.removeAll()
                DispatchQueue.main.async {
                    self.childrenTable.reloadData()
                    self.addChildButton.isHidden = false
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alertContoller.addAction(clearAction)
        alertContoller.addAction(cancelAction)
        
        self.present(alertContoller, animated: true, completion: nil)
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
        return childrenArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CICustomCell.reuseID) as! CICustomCell
        let child = childrenArray[indexPath.row]
        cell.set(child: child)
        cell.deleteButtonAction = { [weak self] in
            self?.deleteItem(at: indexPath)
        }
        return cell
    }
    
    private func deleteItem(at indexPath:IndexPath) {
        childrenArray.remove(at: indexPath.row)
        if childrenArray.count < 5 {
            addChildButton.isHidden = false
        }
        childrenTable.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

