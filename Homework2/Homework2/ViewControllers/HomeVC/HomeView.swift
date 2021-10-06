//
//  HomeView.swift
//  Homework2
//
//  Created by Евгений Самарин on 03.10.2021.
//

import Foundation
import UIKit

class HomeView: UIView {

    private enum Metrics {
        static let headerHeight: CGFloat = 126
        static let sideOfSet: CGFloat = 16
        static let logoutBtnWidth: CGFloat = 143
        static let logoutBtnHeight: CGFloat = 36
    }

    // MARK: - Instance Properties

    public weak var output: HomeVCViewOutput?

    private var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "HeaderViewColor")

        return view
    }()

    private var logoutButtonView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(named: "LogoutButtonColor")?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var profileNameView: UILabel = {
        let view = UILabel()
        view.text = "Alex Tsimikas"
        guard let customFont = UIFont(name: "Habibi", size: 34) else {
            fatalError("""
                Failed to load the "Habibi" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        view.font = UIFontMetrics.default.scaledFont(for: customFont)
        view.adjustsFontForContentSizeCategory = true
        return view
    }()

    private var cityProfileView: UILabel = {
        let view = UILabel()
        view.text = "Brooklyn, NY"
        guard let customFont = UIFont(name: "Habibi", size: 16) else {
            fatalError("""
                Failed to load the "Habibi" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        view.font = UIFontMetrics.default.scaledFont(for: customFont)
        view.adjustsFontForContentSizeCategory = true
        return view
    }()

    private var messagesButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 42))
        button.setTitle("Messages", for: .normal)
        guard let customFont = UIFont(name: "Habibi", size: 17) else {
            fatalError("""
                Failed to load the "Habibi" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        button.setTitleColor(UIColor(named: "MessageButtonColor"), for: .normal)
        button.titleLabel?.font = UIFontMetrics.default.scaledFont(for: customFont)
        return button
    }()

    private var logoutButtonImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "backArrow"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private var logoutButtonLabel: UILabel = {
        let label = UILabel()
        label.text = "Logout"
        guard let customFont = UIFont(name: "Habibi", size: 14) else {
            fatalError("""
                Failed to load the "Habibi" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    // MARK: - UIView Methods

    init() {
        super.init(frame: .zero)
        self.setupViews()
        self.setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Instance Methods

    private func setupViews() {
        self.addSubviews([self.headerView, self.cityProfileView, self.logoutButtonView])

        self.headerView.addSubviews([self.profileNameView, self.messagesButton])
        self.logoutButtonView.addSubviews([self.logoutButtonImage, self.logoutButtonLabel])

        self.messagesButton.addTarget(self, action: #selector(self.message), for: .touchUpInside)

        self.backgroundColor = UIColor(named: "BackgroundColor")
    }

    private func setupConstraints() {

        // MARK: - HeaderView Constraints

        self.headerView.pinToSuperView(sides: [.right, .left, .top])
        self.headerView.setDemission(.height(Metrics.headerHeight))

        // MARK: - MessagesButtonView Constraints

        self.messagesButton.pinToSuperView(sides: [.right(-8), .top(42)])
//        self.messagesButton.pin(side: .bottom(-14), to: .top(self.profileNameView))

        // MARK: - ProfileNameView Constraints

        self.profileNameView.pin(sides: [.left(16), .right(-16), .bottom(-7)], to: self.headerView)

        // MARK: - CityProfileView Constraints

        self.cityProfileView.pin(side: .top(19), to: .bottom(self.headerView))
        self.cityProfileView.pinToSuperView(sides: [.left(25)])

        // MARK: - LogoutButtonView Constraints

        self.logoutButtonView.setDemission(.height(Metrics.logoutBtnHeight))
        self.logoutButtonView.setDemission(.width(Metrics.logoutBtnWidth))
        self.logoutButtonView.pin(side: .top(101), to: .bottom(self.cityProfileView))
        self.logoutButtonView.pinToSuperView(sides: [.centerX])

        self.logoutButtonImage.pinToSuperView(sides: [.centerY, .left(34)])

        self.logoutButtonLabel.pinToSuperView(sides: [.centerY])
        self.logoutButtonLabel.pin(side: .left(19), to: .right(self.logoutButtonImage))
    }

    @objc private func message() {
        self.output?.message()
    }
}
