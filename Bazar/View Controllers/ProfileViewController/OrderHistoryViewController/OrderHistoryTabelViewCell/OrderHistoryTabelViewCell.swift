//
//  OrderHistoryTabelViewCell.swift
//  Bazar
//
//  Created by Naveed Khalid on 31/01/2025.
//

import UIKit



class OrderHistoryTabelViewCell: UITableViewCell {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
     let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
     let titleLabel: UILabel = {
        let label = UILabel()
         label.font = .appFont(.RobotoBold, size: 16)
         label.textColor = .appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let statusLabel: UILabel = {
        let label = UILabel()
         label.font = .appFont(.RobotoMedium, size: 14)
         label.textColor = UIColor(named: "green")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dotLabel: UILabel = {
        let label = UILabel()
        label.text = "•"
        label.font = .appFont(.RobotoMedium, size: 14)
        label.textColor = .appColor(.grey)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let itemCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(containerView)
        containerView.addSubview(itemImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(statusLabel)
        containerView.addSubview(dotLabel)
        containerView.addSubview(itemCountLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // ContainerView constraints
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            // Item ImageView constraints
            itemImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            itemImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 48),
            itemImageView.heightAnchor.constraint(equalToConstant: 48),
            
            // Title Label constraints
            titleLabel.topAnchor.constraint(equalTo: itemImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            // Status Label constraints
            statusLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            statusLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            // Dot Label constraints
            dotLabel.centerYAnchor.constraint(equalTo: statusLabel.centerYAnchor),
            dotLabel.leadingAnchor.constraint(equalTo: statusLabel.trailingAnchor, constant: 5),
            
            // Item Count Label constraints
            itemCountLabel.centerYAnchor.constraint(equalTo: statusLabel.centerYAnchor),
            itemCountLabel.leadingAnchor.constraint(equalTo: dotLabel.trailingAnchor, constant: 5),
        ])
    }
    
  
}
