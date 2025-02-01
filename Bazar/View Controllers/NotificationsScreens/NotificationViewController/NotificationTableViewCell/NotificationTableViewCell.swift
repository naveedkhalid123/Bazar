//
//  NotificationTableViewCell.swift
//  Bazar
//
//  Created by Naveed Khalid on 01/02/2025.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appColor(.purple)
        label.font = .appFont(.openSansBold, size: 16)
        label.text = "Promotion"
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appColor(.grey)
        label.font = .appFont(.RobotoMedium, size: 12)
        label.textAlignment = .right
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        let text = "Today 50% discount on all Books in Novel category with online orders worldwide."
        let attributedText = NSMutableAttributedString(string: text)
        let boldRange = (text as NSString).range(of: "50% discount")
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: boldRange)
        label.attributedText = attributedText
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(messageLabel)

        contentView.addSubview(stackView)
        contentView.addSubview(dateLabel)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),

            messageLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -16)
        ])


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(date: String, message: String) {
        dateLabel.text = date
        
        let attributedText = NSMutableAttributedString(string: message)
        let boldRange = (message as NSString).range(of: "50% discount")
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: boldRange)
        messageLabel.attributedText = attributedText
    }
    
    func configure(title: String, date: String, message: String) {
           titleLabel.text = title
           dateLabel.text = date
           
           let attributedText = NSMutableAttributedString(string: message)
           if let boldRange = message.range(of: "50% discount") {
               let nsRange = NSRange(boldRange, in: message)
               attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: nsRange)
           }
           messageLabel.attributedText = attributedText
       }
}
