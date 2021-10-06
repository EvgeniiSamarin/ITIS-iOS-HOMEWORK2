//
//  ChatTableViewCell.swift
//  Homework2
//
//  Created by Евгений Самарин on 04.10.2021.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    private var photoImageView = UIImageView()
    private var nameLabel: UILabel = {
        let label = UILabel()
        guard let customFont = UIFont(name: "Habibi", size: 14) else {
            fatalError(ChatError.fontError)
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.textColor = UIColor(named: "MessagesChatTitleColor")
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    private var messageLabel: UILabel = {
        let label = UILabel()
        guard let customFont = UIFont(name: "Habibi", size: 14) else {
            fatalError(ChatError.fontError)
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.textColor = UIColor(named: "MessagesChatColor")
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    private var dateLabel: UILabel = {
        let label = UILabel()
        guard let customFont = UIFont(name: "Habibi", size: 14) else {
            fatalError(ChatError.fontError)
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.textColor = UIColor(named: "MessagesChatDateColor")
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.addSubviews([self.photoImageView, self.nameLabel, self.messageLabel, self.dateLabel])

        self.photoImageView.layer.cornerRadius = 20
        self.photoImageView.clipsToBounds = true
    }

    private func setupConstraints() {
        self.photoImageView.pinToSuperView(sides: [.left(24), .bottom(-26), .top(26)])
        self.photoImageView.setEqualSize(constant: 40)
        

        self.nameLabel.pinToSuperView(sides: [.top(26)])
        self.nameLabel.pin(side: .left(8), to: .right(self.photoImageView))

        self.messageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.messageLabel.pin(side: .left(8), to: .right(self.photoImageView))
        self.messageLabel.pin(side: .top(4), to: .bottom(self.nameLabel))

        self.dateLabel.pinToSuperView(sides: [.right(-24), .top(24)])
    }

    func set(sender: Sender) {
        self.photoImageView.image = sender.image
        self.nameLabel.text = sender.name
        self.messageLabel.text = sender.message
        self.dateLabel.text = sender.date
    }
}
