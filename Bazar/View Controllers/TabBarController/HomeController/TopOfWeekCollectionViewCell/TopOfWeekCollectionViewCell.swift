//
//  TopOfWeekCollectionViewCell.swift
//  Bazar
//
//  Created by Naveed Khalid on 28/01/2025.
//

import UIKit

class TopOfWeekCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let imageHeadLbl: UILabel = {
        let label = UILabel()
        label.text = "The Kite Runner"
        label.font = .appFont(.RobotoMedium, size: 14)
        label.textColor = .appColor(.black)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLbl: UILabel = {
        let label = UILabel()
        label.text = "$14.99"
        label.font = .appFont(.RobotoBold, size: 12)
        label.textColor = .appColor(.purple)
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
    
    private func setupUI(){
        setupImageView()
        setUpImageHeadLbl()
        setUpPriceLbl()
    }
    
    private func setupImageView(){
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    
    private func setUpImageHeadLbl(){
        contentView.addSubview(imageHeadLbl)
        NSLayoutConstraint.activate([
            imageHeadLbl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            imageHeadLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0)
        ])
    }
    
    private func setUpPriceLbl(){
        contentView.addSubview(priceLbl)
        NSLayoutConstraint.activate([
            priceLbl.topAnchor.constraint(equalTo: imageHeadLbl.bottomAnchor, constant: 4),
            priceLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            priceLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
            
            
        ])
    }
    
    
}
