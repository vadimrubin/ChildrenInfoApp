//
//  ViewController+Ext.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 22.02.2025.
//

import UIKit

extension UIViewController {
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}
