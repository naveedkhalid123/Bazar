//
//  PaymentDetailsCell.swift
//  Bazar
//
//  Created by Naveed Khalid on 03/02/2025.
//

import UIKit

class PaymentDetailsCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont(.robotoRegular, size: 12)
        label.textColor = .appColor(.grey)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont(.robotoRegular, size: 12)
        label.textColor = .appColor(.grey)
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
