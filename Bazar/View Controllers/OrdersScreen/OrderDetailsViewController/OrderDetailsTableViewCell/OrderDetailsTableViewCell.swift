//
//  OrderDetailsTableViewCell.swift
//  Bazar
//
//  Created by Naveed Khalid on 04/02/2025.
//


import UIKit

class OrderDetailsTableViewCell: UITableViewCell {
    
    let qtyLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont(.robotoRegular, size: 12)
        label.textColor = .appColor(.black)
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont(.robotoRegular, size: 12)
        label.textColor = .appColor(.black)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont(.robotoRegular, size: 12)
        label.textColor = .appColor(.black)
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(qtyLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        
        qtyLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            qtyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            qtyLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: qtyLabel.trailingAnchor, constant: 8),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
