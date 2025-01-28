//
//  AllVendorsCollectionViewCell.swift
//  Bazar
//
//  Created by Naveed Khalid on 28/01/2025.
//


import UIKit

class AllVendorsCollectionViewCell: UICollectionViewCell {
    
    let vendorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let vendorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .appFont(.RobotoMedium, size: 16)
        label.textColor = .appColor(.black)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let starsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        contentView.addSubview(vendorImageView)
        contentView.addSubview(vendorNameLabel)
        contentView.addSubview(starsStackView)
        
        for _ in 0..<5 {
            let starImageView = UIImageView()
            starImageView.image = UIImage(systemName: "star.fill")
            starImageView.tintColor = .systemYellow
            starImageView.contentMode = .scaleAspectFit
            starsStackView.addArrangedSubview(starImageView)
        }
        
        NSLayoutConstraint.activate([
            vendorImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            vendorImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            vendorImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            vendorImageView.heightAnchor.constraint(equalToConstant: 101), 
            
            vendorNameLabel.topAnchor.constraint(equalTo: vendorImageView.bottomAnchor, constant: 8),
            vendorNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            vendorNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            starsStackView.topAnchor.constraint(equalTo: vendorNameLabel.bottomAnchor, constant: 8),
            starsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            starsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            starsStackView.heightAnchor.constraint(equalToConstant: 20),
            starsStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(image: UIImage?, vendorName: String) {
        vendorImageView.image = image
        vendorNameLabel.text = vendorName
    }
}
