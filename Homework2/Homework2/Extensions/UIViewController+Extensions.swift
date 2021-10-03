//
//  UIViewController+Extensions.swift
//  Homework2
//
//  Created by Евгений Самарин on 03.10.2021.
//

import UIKit

extension UIViewController {

    // MARK: - Instance Methods

    func addBackBarButton() {
        let image = UIImage(named: "ic_nav_back")
        let button = UIBarButtonItem(image: image,
                                     style: .plain,
                                     target: self,
                                     action: #selector(tappedOnBackBarButton(sender:)))
        navigationItem.leftBarButtonItem = button
    }

    @objc open func tappedOnBackBarButton(sender: UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
}
