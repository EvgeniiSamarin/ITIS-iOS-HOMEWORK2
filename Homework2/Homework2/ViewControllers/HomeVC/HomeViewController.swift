//
//  HomeViewController.swift
//  Homework2
//
//  Created by Евгений Самарин on 03.10.2021.
//

import UIKit

final class HomeViewController: UINavigationController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.isNavigationBarHidden = true
        self.setNeedsStatusBarAppearanceUpdate()
    }

    override func loadView() {
        let view = HomeView()
        view.output = self
        self.view = view
    }
}

extension HomeViewController: HomeVCViewOutput {
    func message() {
    }
}
