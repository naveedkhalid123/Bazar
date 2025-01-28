//
//  AuthorsCollectionViewCell.swift
//  Bazar
//
//  Created by Naveed Khalid on 28/01/2025.
//


import UIKit

class AuthorsCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 51
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let authorNameLbl: UILabel = {
        let label = UILabel()
        label.text = "John Freeman"
        label.font = .appFont(.RobotoMedium, size: 16)
        label.textColor = .appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let authorCategoryLbl: UILabel = {
        let label = UILabel()
        label.text = "Writer"
        label.font = .appFont(.robotoRegular, size: 14)
        label.textColor = .appColor(.grey)
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
        contentView.addSubview(imageView)
        contentView.addSubview(authorNameLbl)
        contentView.addSubview(authorCategoryLbl)
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imageView.widthAnchor.constraint(equalToConstant: 102),
            imageView.heightAnchor.constraint(equalToConstant: 102),
            
            authorNameLbl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            authorNameLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            
            authorCategoryLbl.topAnchor.constraint(equalTo: authorNameLbl.bottomAnchor, constant: 4),
            authorCategoryLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            authorCategoryLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
