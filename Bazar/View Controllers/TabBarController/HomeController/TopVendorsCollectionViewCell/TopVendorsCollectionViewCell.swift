//
//  TopVendorsCollectionViewCell.swift
//  Bazar
//
//  Created by Naveed Khalid on 28/01/2025.
//



import UIKit

class TopVendorsCollectionViewCell: UICollectionViewCell {
    
    let vendorsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        contentView.addSubview(vendorsImageView)
        NSLayoutConstraint.activate([
            vendorsImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            vendorsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vendorsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            vendorsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

