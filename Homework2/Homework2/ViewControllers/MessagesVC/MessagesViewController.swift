//
//  MessagesViewController.swift
//  Homework2
//
//  Created by Евгений Самарин on 03.10.2021.
//

import UIKit

final class MessagesViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = true
        self.setNeedsStatusBarAppearanceUpdate()
    }

    override func loadView() {
        let view = MessagesView()
        view.output = self
        self.view = view
    }
}

extension MessagesViewController: MessagesVCViewOutput {

    func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
