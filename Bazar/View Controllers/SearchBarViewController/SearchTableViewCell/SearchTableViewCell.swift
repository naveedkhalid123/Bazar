//
//  SearchTableViewCell.swift
//  Bazar
//
//  Created by Naveed Khalid on 03/02/2025.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    let searchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appFont(.robotoRegular, size: 16)
        label.textColor = .appColor(.grey)
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(searchLabel)
        NSLayoutConstraint.activate([
            searchLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27),
            searchLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
           // searchLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -27),
            searchLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    
}

