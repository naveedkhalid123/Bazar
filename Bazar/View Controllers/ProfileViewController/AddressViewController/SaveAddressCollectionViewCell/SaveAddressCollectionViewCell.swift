//
//  SaveAddressCollectionViewCell.swift
//  Bazar
//
//  Created by Naveed Khalid on 31/01/2025.
//

import UIKit

class SaveAddressCollectionViewCell: UICollectionViewCell {
    
     let buttonView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 16
        view.backgroundColor = .appColor(.lightGrey)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
     let buttonLabel: UILabel = {
        let label = UILabel()
        label.text = "Save Address"
        label.textColor = .appColor(.purple)
         label.font = .appFont(.RobotoMedium, size: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(buttonView)
        buttonView.addSubview(buttonLabel)
        
        NSLayoutConstraint.activate([
            buttonView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            buttonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            buttonView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            buttonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            buttonView.heightAnchor.constraint(equalToConstant: 32),
            
            buttonLabel.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            buttonLabel.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor)
        ])
    }
}

