//
//  VendorsLblCollectionViewCell.swift
//  Bazar
//
//  Created by Naveed Khalid on 28/01/2025.
//

import UIKit

class VendorsLblCollectionViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont(.robotoRegular, size: 15)
        label.textColor = .appColor(.grey)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
   
    func configure(with text: String, isSelected: Bool) {
        if isSelected {
            titleLabel.attributedText = NSAttributedString(
                string: text,
                attributes: [
                    .font: UIFont.appFont(.RobotoMedium, size: 16),
                    .foregroundColor: UIColor.appColor(.black),
                    .underlineStyle: NSUnderlineStyle.thick.rawValue
                ]
            )
        } else {
            titleLabel.attributedText = NSAttributedString(
                string: text,
                attributes: [
                    .font: UIFont.appFont(.robotoRegular, size: 15),
                    .foregroundColor: UIColor.appColor(.grey)
                ]
            )
        }
    }

}
