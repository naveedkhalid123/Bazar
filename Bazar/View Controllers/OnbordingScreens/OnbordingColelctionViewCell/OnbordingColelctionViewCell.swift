//
//  OnbordingColelctionViewCell.swift
//  Bazar
//
//  Created by Naveed Khalid on 23/01/2025.
//



import UIKit

class OnbordingColelctionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let headLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.appFont(.openSansBold, size: 24)
        label.textColor = UIColor.appColor(.black)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subHead: UILabel = {
        let label = UILabel()
        label.font = UIFont.appFont(.robotoRegular, size: 16)
        label.textColor = UIColor.appColor(.grey)
        label.textAlignment = .center
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(headLbl)
        contentView.addSubview(subHead)
        
        NSLayoutConstraint.activate([
           
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 320),
            imageView.widthAnchor.constraint(equalToConstant: 320),
            
          
            headLbl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 14),
            headLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 41),
            headLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -41),
            
          
            subHead.topAnchor.constraint(equalTo: headLbl.bottomAnchor, constant: 12),
            subHead.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 41),
            subHead.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -41),
            subHead.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
