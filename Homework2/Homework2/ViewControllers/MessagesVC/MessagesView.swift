//
//  MessagesView.swift
//  Homework2
//
//  Created by Евгений Самарин on 03.10.2021.
//

import Foundation
import UIKit

class MessagesView: UIView {

    private enum Metrics {
        static let headerHeight: CGFloat = 128
        static let sideOfSet: CGFloat = 16
        static let logoutBtnWidth: CGFloat = 143
        static let logoutBtnHeight: CGFloat = 36
    }

    // MARK: - Instance Properties

    public weak var output: MessagesVCViewOutput?

    private var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "HeaderViewColor")

        return view
    }()

    private var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        button.setImage(UIImage(named: "backBarButtonIcon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "MESSAGES"
        guard let customFont = UIFont(name: "Habibi", size: 17) else {
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

    private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.searchBarStyle = .minimal
        searchBar.isTranslucent = false
        searchBar.placeholder = "Who do you want to chat with?"
        guard let customFont = UIFont(name: "Habibi", size: 17) else {
            fatalError("""
                Failed to load the "Habibi" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Who do you want to chat with?", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: customFont
        ])
        return searchBar
    }()

    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    // MARK: -

    private var senders: [Sender] = []

    // MARK: - UIView Methods

    init() {
        super.init(frame: .zero)
        self.setupViews()
        self.setupConstraints()
        self.setupDelegates()

        self.senders = fetchData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Instance Methods

    private func setupViews() {
        self.addSubviews([self.headerView, self.tableView])
        headerView.addSubviews([self.backButton, self.titleLabel, self.searchBar])

        self.backButton.addTarget(self, action: #selector(self.back), for: .touchUpInside)
        self.backgroundColor = UIColor(named: "BackgroundColor")
    }

    private func setupConstraints() {

        // MARK: - HeaderView Constraints

        self.headerView.pinToSuperView(sides: [.right, .left, .top])
        self.headerView.setDemission(.height(Metrics.headerHeight))

        // MARK: - BackBarButton Constraints

        self.backButton.pinToSuperView(sides: [.left(8), .bottom(-59)])

        // MARK: - TitleLabel Constraints

        self.titleLabel.pinToSuperView(sides: [.centerX, .bottom(-64)])

        // MARK: - SearchBar Constraints

        self.searchBar.pinToSuperView(sides: [.bottom(-1), .left(8), .right(-8)])

        // MARK: - TableView Constraints

        self.tableView.pinToSuperView(sides: [.right, .left, .bottom])
        self.tableView.pin(side: .top, to: .bottom(self.headerView))

    }

    private func setupDelegates() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 92
        self.tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: "chatTableViewCell")
        self.tableView.separatorColor = UIColor(named: "MessagesChatDividerColor")
        self.tableView.separatorStyle = .singleLine
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    @objc private func back() {
        self.output?.back()
    }
}

extension MessagesView: UITableViewDelegate {
    
}

extension MessagesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.senders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatTableViewCell") as! ChatTableViewCell
        let sender = self.senders[indexPath.row]
        cell.set(sender: sender)

        return cell
    }
}

extension MessagesView {

    func fetchData() -> [Sender] {
        let sender = Sender(image: UIImage(named: "steveJobs") ?? UIImage(), name: "Steve Jobs", message: "OMG! OMG! OMG!", date: "4h ago")

        return [sender]
    }
}
